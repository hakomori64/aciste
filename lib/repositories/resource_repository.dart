import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/attachment_repository.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseResourceRepository {
  Future<Resource> retrieveResource({required String resourceId});
  Future<Resource> createResource({required Resource resource});
  Future<void> updateResource({required Resource resource});
}

final resourceRepositoryProvider = Provider<ResourceRepository>((ref) => ResourceRepository(ref.read));

class ResourceRepository implements BaseResourceRepository {
  final Reader _read;

  const ResourceRepository(this._read);

  Future<Resource> _getResource({
    required DocumentSnapshot<Map<String, dynamic>> doc,
  }) async {
    final resource = Resource.fromDocumentSnapshot(doc);
    final createdBy = await _read(userRepositoryProvider).getUser(userId: doc.data()!['createdById']);

    final attachments = await _read(attachmentRepositoryProvider).retrieveResourceAttachments(resourceId: resource.id!);

    return resource.copyWith(
      createdBy: createdBy,
      attachments: attachments,
    );
  }

  @override
  Future<Resource> retrieveResource({required String resourceId}) async {
    try {
      final snapshot = await _read(firebaseFirestoreProvider)
        .resourcesRef()
        .doc(resourceId)
        .get();
      
      return _getResource(doc: snapshot);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Resource> createResource({required Resource resource}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
        .resourcesRef()
        .add(resource.toDocument());

      return resource.copyWith(
        id: docRef.id
      );
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateResource({required Resource resource}) async {
    try {
      await _read(firebaseFirestoreProvider)
        .resourcesRef()
        .doc(resource.id!)
        .update(resource.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}