import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/resource.dart';
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

  Future<Resource> createResource({required ResourceType resourceType, required CreateResourceParams content}) async {
    if (_userId == null) {
      throw const CustomException(message: 'user not authenticated');
    }
    return _read(resourceRepositoryProvider).createResource(
      userId: _userId!,
      resourceType: resourceType,
      createResourceParams: content
    );
  }
}