import 'dart:async';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/dynamic_link_repository.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:aciste/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dynamicLinksControllerProvider = Provider<DynamicLinksController>((ref) => DynamicLinksController(ref.read)..appStarted());

class DynamicLinksController {
  final Reader _read;

  DynamicLinksController(this._read);

  void appStarted() async {
    
    _read(firebaseDynamicLinksProvider).onLink.listen((dynamicLinkData) async {
      await Future.delayed(const Duration(seconds: 3));
      final resourceId = dynamicLinkData.link.queryParameters['resourceId'];
      if (resourceId == null) {
        throw const CustomException(message: 'dynamiclink: resourceId is null');
      }
      final resource = await _read(resourceRepositoryProvider).retrieveResource(resourceId: resourceId);
      if (resource.id == null) {
        throw const CustomException(message: 'dynamiclink: resource is null');
      }
      final userId = _read(authControllerProvider)?.uid;
      if (userId == null) {
        throw const CustomException(message: 'dynamiclink: userId is null');
      }
      final item = Item.empty().copyWith(
        resource: resource,
        userId: userId,
      );
      _read(routerProvider).push(Routes.itemImport.route, extra: item);
    });
  }

  Future<String> getItemImportUrl({required String resourceId}) async {
    final url = await _read(dynamicLinksRepositoryProvider).createItemImportDynamicLink(resourceId: resourceId);
    return url.toString();
  }
}