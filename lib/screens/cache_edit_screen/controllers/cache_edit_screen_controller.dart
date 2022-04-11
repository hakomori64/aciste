import 'package:aciste/models/cache.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'cache_edit_screen_controller.freezed.dart';

@freezed
class CacheEditScreenState with _$CacheEditScreenState {
  const factory CacheEditScreenState({
    Cache? cache,
    @Default(false) bool isNameEditing,
    @Default(false) bool isDescriptionEditing,
    @Default("") String description,
  }) = _CacheEditScreenState;
}

final cacheEditScreenControllerProvider = StateNotifierProvider<CacheEditScreenController, CacheEditScreenState>((ref) => CacheEditScreenController());


class CacheEditScreenController extends StateNotifier<CacheEditScreenState> {
  CacheEditScreenController() : super(const CacheEditScreenState());

  void setCache(Cache cache) {
    state = state.copyWith(cache: cache);
    setDescription(cache.description);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }
}