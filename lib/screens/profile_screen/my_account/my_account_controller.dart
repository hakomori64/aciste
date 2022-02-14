import 'package:aciste/models/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'my_account_controller.freezed.dart';

@freezed
class MyAccountState with _$MyAccountState {
  const factory MyAccountState({
    Item? item,
    @Default(false) bool isDisplayNameEditing,
    @Default(false) bool isBioEditing,
  }) = _MyAccountState;
}

final myAccountControllerProvider = StateNotifierProvider.autoDispose<MyAccountController, MyAccountState>((ref) => MyAccountController());


class MyAccountController extends StateNotifier<MyAccountState> {
  MyAccountController() : super(const MyAccountState());

  void setIsDisplayNameEditing({required bool value}) {
    state = state.copyWith(isDisplayNameEditing: value);
  }

  Future<void> setIsBioEditing({required bool value}) async {
    state = state.copyWith(isBioEditing: value);
  }
}