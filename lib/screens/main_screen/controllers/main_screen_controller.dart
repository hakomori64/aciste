import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'main_screen_controller.freezed.dart';

enum BottomItem {
  cmap,
  cache,
  announcement,
}

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(BottomItem.cmap) BottomItem page,
    @Default(false) bool isSelecting
  }) = _MainScreenState;
}

final mainScreenControllerProvider = StateNotifierProvider.autoDispose<MainScreenController, MainScreenState>((ref) => MainScreenController());

class MainScreenController extends StateNotifier<MainScreenState> {
  MainScreenController() : super(const MainScreenState()) {
    initScrollControllers();
  }

  late List<ScrollController> scrollControllers;

  void initScrollControllers() {
    scrollControllers = [
      ScrollController(),
      ScrollController(),
      ScrollController(),
    ];
  }

  Future<void> onPageChange(int page) async {
    state = state.copyWith(page: BottomItem.values[page]);
  }

  Future<void> jumpToPage(PageController pageController, BottomItem item) async {
    await pageController.animateToPage(
      item.index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void scrollToTop(BottomItem item) {
    scrollControllers[item.index].animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease
    );
  }

  Future<void> setIsSelecting({required bool value }) async {
    state = state.copyWith(isSelecting: value);
  }
}