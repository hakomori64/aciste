import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/attachment_repository.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final resourceControllerProvider = Provider<ResourceController>((ref) {
  final user = ref.watch(authControllerProvider);
  return ResourceController(ref.read, user?.uid);
});

class ResourceController {
  final Reader _read;
  final String? _userId;

  ResourceController(this._read, this._userId);

  Future<Resource> createResource({required Resource resource}) async {
    if (_userId == null) {
      throw const CustomException(message: 'user not authenticated');
    }

    final created = await _read(resourceRepositoryProvider).createResource(
      resource: resource 
    );

    for (final attachment in resource.attachments) {
      await _read(attachmentRepositoryProvider)
        .saveAttachmentToResource(
          resourceId: created.id!,
          attachment: attachment
        );
    }

    return created;
  }

  Future<Resource> updateResource({required Resource resource}) async {
    if (_userId == null) {
      throw const CustomException(message: 'user not authenticated');
    }
    await _read(resourceRepositoryProvider).updateResource(
      resource: resource,
    );

    for (final attachment in resource.attachments) {
      await _read(attachmentRepositoryProvider)
        .saveAttachmentToResource(
          resourceId: resource.id!,
          attachment: attachment
        );
    }

    return resource;
  }
}