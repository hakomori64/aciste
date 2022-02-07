import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_edit_screen_controller.freezed.dart';

@freezed
class ItemEditScreenState with _$ItemEditScreenState {
  const factory ItemEditScreenState({
    @Default(false) bool isNameEditing,
    @Default(false) bool isDescriptionEditing,
  }) = _ItemEditScreenState;
}

final itemEditScreenControllerProvider = StateNotifierProvider.autoDispose<ItemEditScreenController, ItemEditScreenState>((ref) => ItemEditScreenController());


class ItemEditScreenController extends StateNotifier<ItemEditScreenState> {
  ItemEditScreenController() : super(const ItemEditScreenState());

  Future<void> setIsNameEditing({required bool value}) async {
    state = state.copyWith(isNameEditing: value);
  }

  Future<void> setIsDescriptionEditing({required bool value}) async {
    state = state.copyWith(isDescriptionEditing: value);
  }
}