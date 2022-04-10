import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item_screen_controller.freezed.dart';

@freezed
class ItemScreenState with _$ItemScreenState {
  const factory ItemScreenState() = _ItemScreenState;
}

final itemScreenControllerProvider = StateNotifierProvider.autoDispose<HomeScreenController, ItemScreenState>((ref) => HomeScreenController());

class HomeScreenController extends StateNotifier<ItemScreenState> {
  HomeScreenController() : super(const ItemScreenState());
}