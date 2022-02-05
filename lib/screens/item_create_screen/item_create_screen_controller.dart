import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'item_create_screen_controller.freezed.dart';

@freezed
class ItemCreateScreenState with _$ItemCreateScreenState {
  const factory ItemCreateScreenState({
    File? imageFile,
  }) = _ItemCreateScreenState;
}

final itemCreateScreenControllerProvider = StateNotifierProvider.autoDispose<ItemCreateScreenController, ItemCreateScreenState>((ref) => ItemCreateScreenController());

class ItemCreateScreenController extends StateNotifier<ItemCreateScreenState> {
  ItemCreateScreenController() : super(const ItemCreateScreenState());

  Future<void> pickImage(XFile? image) async {
    if (image == null) return;

    state = state.copyWith(imageFile: File(image.path));
  }
}