import 'package:aciste/models/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_edit_screen_controller.freezed.dart';

@freezed
class ItemEditScreenState with _$ItemEditScreenState {
  const factory ItemEditScreenState({
    Item? item,
    @Default(false) bool isNameEditing,
    @Default(false) bool isDescriptionEditing,
    @Default("") String description,
  }) = _ItemEditScreenState;
}

final itemEditScreenControllerProvider = StateNotifierProvider<ItemEditScreenController, ItemEditScreenState>((ref) => ItemEditScreenController());


class ItemEditScreenController extends StateNotifier<ItemEditScreenState> {
  ItemEditScreenController() : super(const ItemEditScreenState());

  void setItem(Item item) {
    state = state.copyWith(item: item);
    setDescription(item.description);
  }
  
  void setDescription(String description) {
    state = state.copyWith(description: description);
  }
}