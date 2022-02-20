import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/message.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/message_repository.dart';
import 'package:aciste/repositories/photo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseResourceRepository {
  Future<Resource> retrieveResource({required String userId, required ResourceType resourceType, required String resourceId});
  Future<Resource> createResource({required String userId, required ResourceType resourceType, required CreateResourceParams createResourceParams});
}

final resourceRepositoryProvider = Provider<ResourceRepository>((ref) => ResourceRepository(ref.read));

class ResourceRepository implements BaseResourceRepository {
  final Reader _read;

  const ResourceRepository(this._read);

  @override
  Future<Resource> retrieveResource({required String userId, required ResourceType resourceType, required String resourceId}) async {
    switch (resourceType) {
      case ResourceType.photo:
        return _read(photoRepositoryProvider).retrievePhoto(userId: userId, photoId: resourceId);
      case ResourceType.message:
        return _read(messageRepositoryProvider).retrieveMessage(userId: userId, messageId: resourceId);
      case ResourceType.none:
        throw const CustomException(message: '不明なリソースタイプです');
    }
  }

  @override
  Future<Resource> createResource({required String userId, required ResourceType resourceType, required CreateResourceParams createResourceParams}) async {
    switch (resourceType) {
      case ResourceType.photo:
        return _read(photoRepositoryProvider).createPhoto(userId: userId, createPhotoParams: createResourceParams as CreatePhotoParams);
      case ResourceType.message:
        return _read(messageRepositoryProvider).createMessage(userId: userId, createMessageParams: createResourceParams as CreateMessageParams);
      case ResourceType.none:
        throw const CustomException(message: '不明なリソースタイプです');
    }
  }
}