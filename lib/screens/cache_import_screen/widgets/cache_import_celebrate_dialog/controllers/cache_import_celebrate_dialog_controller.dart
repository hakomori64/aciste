import 'package:confetti/confetti.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'cache_import_celebrate_dialog_controller.freezed.dart';

@freezed
class CacheImportCelebrateDialogState with _$CacheImportCelebrateDialogState {
  const factory CacheImportCelebrateDialogState({
    ConfettiController? controller,
  }) = _CacheImportCelebrateDialogState;
}

final cacheImportCelebrateDialogControllerProvider = StateNotifierProvider.autoDispose<CacheImportCelebrateDialogController, CacheImportCelebrateDialogState>((ref) => CacheImportCelebrateDialogController());

class CacheImportCelebrateDialogController extends StateNotifier<CacheImportCelebrateDialogState> {
  CacheImportCelebrateDialogController() : super(const CacheImportCelebrateDialogState()) {
    state = state.copyWith(
      controller: ConfettiController(
        duration: const Duration(seconds: 3),
      )
    );
  }
}