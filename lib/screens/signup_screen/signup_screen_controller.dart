import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'signup_screen_controller.freezed.dart';

@freezed
class SignupScreenState with _$SignupScreenState {
  const factory SignupScreenState({
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default("") String error,
  }) = _SignupScreenState;
}

final signupScreenControllerProvider = StateNotifierProvider<SignupScreenController, SignupScreenState>((ref) => SignupScreenController(ref.read));

class SignupScreenController extends StateNotifier<SignupScreenState> {
  final Reader _read;
  SignupScreenController(this._read) : super(const SignupScreenState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String password) {
    state = state.copyWith(
      confirmPassword: password
    );
  }

  void setError(String errorText) {
    state = state.copyWith(
      error: errorText
    );
  }

  Future<void> onSignup() async {
    setError('');
    try {
      if (state.password.isNotEmpty && state.password != state.confirmPassword) {
        setError('パスワードが一致しません');
        return;
      }
      if (state.password.length < 8) {
        setError('パスワードは８文字以上です');
      }
      final user = await _read(authControllerProvider.notifier).signUpWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      await user?.sendEmailVerification();
      await _read(routerProvider.notifier).push(route: Routes.emailCheck, extra: EmailCheckRouteParams(email: state.email, password: state.password, from: Routes.signup));
    } catch (e) {
      setError('アカウント作成中にエラーが発生しました');
    }
  }
}