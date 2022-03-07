import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_import_screen_controller.freezed.dart';

@freezed
class ItemImportScreenState with _$ItemImportScreenState {
  const factory ItemImportScreenState({
    Item? item,
    @Default("") String name,
    @Default("") String description,
  }) = _ItemImportScreenState;
}

final itemImportScreenControllerProvider = StateNotifierProvider<ItemImportScreenController, ItemImportScreenState>((ref) {
  final uid = ref.watch(authControllerProvider)?.uid;
  return ItemImportScreenController(ref.read, uid);
});

class ItemImportScreenController extends StateNotifier<ItemImportScreenState> {
  final Reader _read;
  final String? userId;
  ItemImportScreenController(
    this._read,
    this.userId,
  ) : super(const ItemImportScreenState());

  void setItem(Item item) {
    state = state.copyWith(item: item);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }
}