import 'package:aciste/models/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_import_screen_controller.freezed.dart';

@freezed
class ItemImportScreenState with _$ItemImportScreenState {
  const factory ItemImportScreenState({
    Item? item,
  }) = _ItemImportScreenState;
}

final itemImportScreenControllerProvider = StateNotifierProvider<ItemImportScreenController, ItemImportScreenState>((ref) => ItemImportScreenController());

class ItemImportScreenController extends StateNotifier<ItemImportScreenState> {
  ItemImportScreenController() : super(const ItemImportScreenState());

  void setItem(Item item) {
    state = state.copyWith(item: item);
  }
}