import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'add_item_dialog_controller.freezed.dart';

@freezed
class AddItemDialogState with _$AddItemDialogState {
  const factory AddItemDialogState({
    File? imageFile,
  }) = _AddItemDialogState;
}

final addItemDialogControllerProvider = StateNotifierProvider.autoDispose<AddItemDialogController, AddItemDialogState>((ref) => AddItemDialogController());

class AddItemDialogController extends StateNotifier<AddItemDialogState> {
  AddItemDialogController() : super(const AddItemDialogState());

  Future<void> pickImage(XFile? image) async {
    if (image == null) return;

    state = state.copyWith(imageFile: File(image.path));
  }
}