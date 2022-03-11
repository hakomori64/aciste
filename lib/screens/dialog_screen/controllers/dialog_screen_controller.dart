import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'dialog_screen_controller.freezed.dart';

@freezed
class DialogScreenState with _$DialogScreenState {
  const factory DialogScreenState({
    Widget? child,
  }) = _DialogScreenState;
}

final dialogScreenControllerProvider = StateNotifierProvider<DialogScreenController, DialogScreenState>((ref) => DialogScreenController());


class DialogScreenController extends StateNotifier<DialogScreenState> {
  DialogScreenController() : super(const DialogScreenState());

  void setChild(Widget child) {
    state = state.copyWith(child: child);
  }
}