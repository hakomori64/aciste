import 'dart:io';

import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/models/user.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

abstract class BaseResourceRepository {
  Future<Resource> retrieveResource({required resourceId});
  Future<Resource> uploadPhoto({required String userId, required File file});
}

final resourceRepositoryProvider = Provider<ResourceRepository>((ref) => ResourceRepository(ref.read));

class ResourceRepository implements BaseResourceRepository {
  final Reader _read;

  const ResourceRepository(this._read);

  Future<Resource> _getResource(DocumentSnapshot<Map<String, dynamic>> doc) async {
    final resource = Resource.fromDocumentSnapshot(doc);
    final user = await _read(userRepositoryProvider).getUser(userId: doc.data()!['createdById']);
    return resource.copyWith(createdBy: user);
  }

  @override
  Future<Resource> retrieveResource({required resourceId}) async {
    try {
      final doc = await _read(firebaseFirestoreProvider)
        .resourcesRef()
        .doc(resourceId)
        .get();
      
      return _getResource(doc);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Resource> uploadPhoto({required String userId, required File file}) async {

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

    final resource = Resource.empty().copyWith(
      createdBy: User.empty().copyWith(id: userId),
      url: imageUrl,
      type: ResourceType.photo
    );

    final docRef = await _read(firebaseFirestoreProvider)
      .resourcesRef()
      .add(resource.toDocument());
    
    return resource.copyWith(id: docRef.id);
  }
}