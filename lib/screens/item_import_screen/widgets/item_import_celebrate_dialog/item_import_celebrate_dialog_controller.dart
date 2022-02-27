import 'package:confetti/confetti.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_import_celebrate_dialog_controller.freezed.dart';

@freezed
class ItemImportCelebrateDialogState with _$ItemImportCelebrateDialogState {
  const factory ItemImportCelebrateDialogState({
    ConfettiController? controller,
  }) = _ItemImportCelebrateDialogState;
}

final itemImportCelebrateDialogControllerProvider = StateNotifierProvider.autoDispose<ItemImportCelebrateDialogController, ItemImportCelebrateDialogState>((ref) => ItemImportCelebrateDialogController());

class ItemImportCelebrateDialogController extends StateNotifier<ItemImportCelebrateDialogState> {
  ItemImportCelebrateDialogController() : super(const ItemImportCelebrateDialogState()) {
    state = state.copyWith(
      controller: ConfettiController(
        duration: const Duration(seconds: 3),
      )
    );
  }
}