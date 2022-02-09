import 'package:aciste/models/item.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_import_screen_controller.freezed.dart';

@freezed
class ItemImportScreenState with _$ItemImportScreenState {
  const factory ItemImportScreenState({
    Item? item,
  }) = _ItemImportScreenState;
}

final itemImportScreenControllerProvider = StateNotifierProvider<ItemImportScreenController, ItemImportScreenState>((ref) {
  final path = ref.watch(dynamicLinksControllerProvider).path;
  final parameterMap = ref.watch(dynamicLinksControllerProvider).parameterMap;
  return ItemImportScreenController(ref.read, path, parameterMap);
});

class ItemImportScreenController extends StateNotifier<ItemImportScreenState> {
  final Reader _read;
  final String? path;
  final Map<String, dynamic>? parameterMap;
  ItemImportScreenController(
    this._read,
    this.path,
    this.parameterMap
  ) : super(const ItemImportScreenState()) {
    if (path == '/import' && parameterMap != null) {
      _init();
    }
  }

  void _init() async {
    // set Item using resourceId
    final resourceId = parameterMap!['resourceId'] as String;
    final resource = await _read(resourceRepositoryProvider).retrieveResource(resourceId: resourceId);
    
    final item = Item.empty().copyWith(
      resource: resource
    );
    setItem(item);
    //_read(dynamicLinksControllerProvider.notifier).clear();
  }

  void setItem(Item item) {
    state = state.copyWith(item: item);
  }
}