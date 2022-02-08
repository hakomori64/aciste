import 'dart:async';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/dynamic_link_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'dynamic_links_controller.freezed.dart';

@freezed
class DynamicLinkState with _$DynamicLinkState {
  const factory DynamicLinkState({
    String? path,
    Map<String, dynamic>? parameterMap,
  }) = _DynamicLinkState;
}

final dynamicLinksControllerProvider = StateNotifierProvider<DynamicLinksController, DynamicLinkState>((ref) {
  final user = ref.watch(authControllerProvider);
  return DynamicLinksController(ref.read, user?.uid);
});

class DynamicLinksController extends StateNotifier<DynamicLinkState> {
  final Reader _read;
  final String? _userId;

  DynamicLinksController(this._read, this._userId) : super(const DynamicLinkState()) {
    if (_userId != null) {
      appStarted();
    }
  }

  Future<void> _handleUrl({required String path, required Map<String, dynamic> parameters}) async {
    state = state.copyWith(
      path: path,
      parameterMap: parameters
    );
  }

  Future<void> getInitialLink() async {
    final initialLink = await _read(firebaseDynamicLinksProvider).getInitialLink();
    if (initialLink != null) {
      final path = initialLink.link.path;
      final parameters = initialLink.link.queryParameters;
      await _handleUrl(path: path, parameters: parameters);
    }
  }

  void appStarted() async {
    await getInitialLink();
    _read(firebaseDynamicLinksProvider).onLink.listen((dynamicLinkData) async {
      final path = dynamicLinkData.link.path;
      final parameters = dynamicLinkData.link.queryParameters;
      await _handleUrl(path: path, parameters: parameters);
    });
  }

  Future<String> getItemImportUrl({required String resourceId}) async {
    final url = await _read(dynamicLinksRepositoryProvider).createItemImportDynamicLink(resourceId: resourceId);
    return url.toString();
  }
}