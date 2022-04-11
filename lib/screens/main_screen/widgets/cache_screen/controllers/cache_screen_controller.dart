import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'cache_screen_controller.freezed.dart';

@freezed
class CacheScreenState with _$CacheScreenState {
  const factory CacheScreenState() = _CacheScreenState;
}

final cacheScreenControllerProvider = StateNotifierProvider.autoDispose<CacheScreenController, CacheScreenState>((ref) => CacheScreenController());

class CacheScreenController extends StateNotifier<CacheScreenState> {
  CacheScreenController() : super(const CacheScreenState());
}