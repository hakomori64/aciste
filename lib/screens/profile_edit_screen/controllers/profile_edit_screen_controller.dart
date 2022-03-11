import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'profile_edit_screen_controller.freezed.dart';

@freezed
class ProfileEditScreenState with _$ProfileEditScreenState {
  const factory ProfileEditScreenState({
    @Default("") String displayName,
    @Default("") String bio,
  }) = _ProfileEditScreenState;
}

final profileEditScreenControllerProvider = StateNotifierProvider.autoDispose<ProfileEditScreenController, ProfileEditScreenState>((ref) {
  final user = ref.watch(userControllerProvider).asData?.value;
  return ProfileEditScreenController(user);
});


class ProfileEditScreenController extends StateNotifier<ProfileEditScreenState> {
  final User? _user;
  ProfileEditScreenController(this._user) : super(const ProfileEditScreenState()) {
    if (_user != null) {
      _init();
    }
  }

  void _init() {
    state = state.copyWith(
      displayName: _user!.displayName,
      bio: _user!.bio,
    );
  }

  void setDisplayName(String displayName) {
    state = state.copyWith(
      displayName: displayName
    );
  }

  void setBio(String bio) {
    state = state.copyWith(
      bio: bio
    );
  }
}