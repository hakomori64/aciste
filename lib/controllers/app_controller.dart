import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_controller.freezed.dart';

@freezed
class AppControllerState with _$AppControllerState {
  const factory AppControllerState({
    @Default(false) bool loading,
  }) = _AppControllerState;
}

final appControllerProvider = StateNotifierProvider<AppController, AppControllerState>((ref) => AppController());

class AppController extends StateNotifier<AppControllerState> {
  AppController() : super(const AppControllerState());

  void setloading({required bool value}) {
    state = state.copyWith(loading: value);
  }
}