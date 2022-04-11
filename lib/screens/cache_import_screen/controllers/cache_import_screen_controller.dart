import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/cache.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'cache_import_screen_controller.freezed.dart';

@freezed
class CacheImportScreenState with _$CacheImportScreenState {
  const factory CacheImportScreenState({
    Cache? cache,
  }) = _CacheImportScreenState;
}

final cacheImportScreenControllerProvider = StateNotifierProvider<CacheImportScreenController, CacheImportScreenState>((ref) {
  final uid = ref.watch(authControllerProvider)?.uid;
  return CacheImportScreenController(uid);
});

class CacheImportScreenController extends StateNotifier<CacheImportScreenState> {
  final String? userId;
  CacheImportScreenController(
    this.userId,
  ) : super(const CacheImportScreenState());

  void setCache(Cache cache) {
    state = state.copyWith(cache: cache);
  }
}