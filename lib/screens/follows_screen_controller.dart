import 'dart:math';

import 'package:aciste/models/user.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'follows_screen_controller.freezed.dart';

@freezed
class FollowsScreenState with _$FollowsScreenState {
  const factory FollowsScreenState({
    @Default(false) bool isLoading,
    @Default([]) List<String> follows,
    @Default([]) List<User> data,
  }) = _FollowsScreenState;
}

final followsScreenControllerProvider = StateNotifierProvider<FollowsScreenController, FollowsScreenState>((ref) => FollowsScreenController(ref.read));

class FollowsScreenController extends StateNotifier<FollowsScreenState> {
  FollowsScreenController(this._read) : super(const FollowsScreenState());

  final diff = 30;
  final Reader _read;

  Future<void> loadMore() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));

    final data = state.data;
    final start = data.length;
    final end = min(start + diff, state.follows.length);

    for (var index = start; index < end; index++) {
      final user = await _read(userRepositoryProvider).getUser(userId: state.follows[index]);
      data.add(user!);
    }

    state = state.copyWith(
      data: data
    );
  }


  void setFollows({required List<String> follows}) {
    state = state.copyWith(follows: follows, data: []);
    loadMore();
  }
}