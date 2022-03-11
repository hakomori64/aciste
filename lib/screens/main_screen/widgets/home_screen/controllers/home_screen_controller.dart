import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_screen_controller.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState() = _HomeScreenState;
}

final homeScreenControllerProvider = StateNotifierProvider.autoDispose<HomeScreenController, HomeScreenState>((ref) => HomeScreenController());

class HomeScreenController extends StateNotifier<HomeScreenState> {
  HomeScreenController() : super(const HomeScreenState());
}