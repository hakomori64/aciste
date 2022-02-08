import 'package:aciste/models/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_detail_screen_controller.freezed.dart';

@freezed
class ItemDetailScreenState with _$ItemDetailScreenState {
  const factory ItemDetailScreenState({
    Item? item,
  }) = _ItemDetailScreenState;
}

final itemDetailScreenControllerProvider = StateNotifierProvider<ItemDetailScreenController, ItemDetailScreenState>((ref) => ItemDetailScreenController());

class ItemDetailScreenController extends StateNotifier<ItemDetailScreenState> {
  ItemDetailScreenController() : super(const ItemDetailScreenState());

  void setItem(Item item) {
    state = state.copyWith(item: item);
  }
}