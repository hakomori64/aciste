import 'package:aciste/models/user.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'profile_screen_controller.freezed.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState({
    User? user,
  }) = _ProfileScreenState;
}

final profileScreenControllerProvider = StateNotifierProvider<ProfileScreenController, ProfileScreenState>((ref) => ProfileScreenController(ref.read));

class ProfileScreenController extends StateNotifier<ProfileScreenState> {
  final Reader _read;
  ProfileScreenController(this._read) : super(const ProfileScreenState());

  Future<void> setUser({required String userId}) async {
    final user = await _read(userRepositoryProvider).getUser(userId: userId);
    state = state.copyWith(user: user);
  }
}