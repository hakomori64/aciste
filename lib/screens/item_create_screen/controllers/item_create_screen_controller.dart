import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_create_screen_controller.freezed.dart';

@freezed
class ItemCreateScreenState with _$ItemCreateScreenState {
  const factory ItemCreateScreenState({
    ResourceType? resourceType,
    CreateResourceParams? params,
  }) = _ItemCreateScreenState;
}

final itemCreateScreenControllerProvider = StateNotifierProvider<ItemCreateScreenController, ItemCreateScreenState>((ref) => ItemCreateScreenController());

class ItemCreateScreenController extends StateNotifier<ItemCreateScreenState> {
  ItemCreateScreenController() : super(const ItemCreateScreenState());

  void setResourceType(ResourceType resourceType) {
    state = state.copyWith(resourceType: resourceType);
  }

  void setCreateResourceParams(CreateResourceParams? params) {
    state = state.copyWith(params: params);
  }
}