import 'dart:io';

import 'package:aciste/models/user.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/custom_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

abstract class BaseUserRepository {
  Future<User?> getUser({required String userId});
  Future<String> createUser({required String userId, required User user});
  Future<void> updateUser({required String userId, required User user});
  Future<void> deleteUser({required String userId});
  Future<String> uploadPhoto({required String userId, required File file});
  Future<bool> follow({required String fromId, required String toId});
  Future<bool> unfollow({required String fromId, required String toId});
}

final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepository(ref.read));

class UserRepository implements BaseUserRepository {
  final Reader _read;

  const UserRepository(this._read);

  @override
  Future<User?> getUser({required String userId}) async {
    try {
      final doc = await _read(firebaseFirestoreProvider)
        .userRef(userId).get();
      
      if (!doc.exists) {
        return null;
      }

      return User.fromDocumentSnapshot(doc);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createUser({required String userId, required User user}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userRef(userId)
        .set(user.toDocument());
      
      return userId;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateUser({required String userId, required User user}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userRef(userId)
        .update(user.copyWith(updatedAt: DateTime.now()).toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> uploadPhoto({required String userId, required File file}) async {
    final mimeType = lookupMimeType(file.path);
    if (mimeType != 'image/jpeg' && mimeType != 'image/png') {
      throw const CustomException(message: 'Unrecognized type');
    }

    final extension = extensionFromMime(mimeType!);
    const uuid = Uuid();
    final id = uuid.v4();
    final filename = '$id.$extension';
    final imageRef = _read(firebaseStorageProvider).ref("resources")
      .child(filename);
    final snapshot = await imageRef.putFile(file);
    
    final imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  @override
  Future<void> deleteUser({required String userId}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .userRef(userId)
        .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<bool> follow({required String fromId, required String toId}) async {
    final fromUser = await getUser(userId: fromId); // followingに追加
    final toUser = await getUser(userId: toId); // followedByに追加

    if (fromUser == null || toUser == null) {
      return false;
    }

    if (!fromUser.following.contains(toId) && !toUser.followedBy.contains(fromId)) {
      fromUser.following.add(toId);
      toUser.followedBy.add(fromId);
      await updateUser(
        userId: fromId,
        user: fromUser
      );
      await updateUser(
        userId: toId,
        user: toUser
      );
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> unfollow({required String fromId, required String toId}) async {
    final fromUser = await getUser(userId: fromId); // followingに追加
    final toUser = await getUser(userId: toId); // followedByに追加

    if (fromUser == null || toUser == null) {
      return false;
    }

    if (fromUser.following.contains(toId) && toUser.followedBy.contains(fromId)) {
      fromUser.following.remove(toId);
      toUser.followedBy.remove(fromId);
      await updateUser(
        userId: fromId,
        user: fromUser
      );
      await updateUser(
        userId: toId,
        user: toUser
      );
      return true;
    } else {
      return false;
    }
  }
}