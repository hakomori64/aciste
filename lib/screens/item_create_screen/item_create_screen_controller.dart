import 'dart:io';

import 'package:aciste/enums/resource_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'item_create_screen_controller.freezed.dart';

@freezed
class ItemCreateScreenState with _$ItemCreateScreenState {
  const factory ItemCreateScreenState({
    ResourceType? resourceType,
    File? imageFile,
  }) = _ItemCreateScreenState;
}

final itemCreateScreenControllerProvider = StateNotifierProvider.autoDispose<ItemCreateScreenController, ItemCreateScreenState>((ref) => ItemCreateScreenController());

class ItemCreateScreenController extends StateNotifier<ItemCreateScreenState> {
  ItemCreateScreenController() : super(const ItemCreateScreenState());

  void setResourceType(ResourceType resourceType) {
    state = state.copyWith(resourceType: resourceType);
  }

  void pickImage(XFile? image) {
    if (image == null) return;

    state = state.copyWith(imageFile: File(image.path));
  }
}