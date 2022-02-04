import 'package:aciste/models/user.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/custom_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseUserRepository {
  Future<User?> getUser({required String userId});
  Future<String> createUser({required String userId, required User user});
  Future<void> updateUser({required String userId, required User user});
  Future<void> deleteUser({required String userId});
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
        .update(user.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
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
}