import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/login_screen/widgets/send_email_dialog/send_email_dialog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'login_screen_controller.freezed.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    @Default("") String email,
    @Default("") String password,
    @Default("") String error,
  }) = _LoginScreenState;
}

final loginScreenControllerProvider = StateNotifierProvider<LoginScreenController, LoginScreenState>((ref) => LoginScreenController(ref.read));

class LoginScreenController extends StateNotifier<LoginScreenState> {
  final Reader _read;
  LoginScreenController(this._read) : super(const LoginScreenState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setError(String errorText) {
    state = state.copyWith(
      error: errorText
    );
  }

  Future<void> onLogin() async {
    setError('');
    final user = await _read(authControllerProvider.notifier).signInWithEmailAndPassword(email: state.email, password: state.password);
    if (user == null) {
      setError('emailとパスワードがマッチしません');
      return;
    }

    if (user.emailVerified) {
      await _read(routerProvider.notifier).go(route: Routes.main);
    } else {
      await user.sendEmailVerification();
      await _read(routerProvider.notifier).go(route: Routes.emailCheck, extra: EmailCheckRouteParams(email: state.email, password: state.password, from: Routes.login));
    }
  }

  Future<void> onForgotPassword() async {
    setError('');
    try {
      await _read(authControllerProvider.notifier).sendPasswordResetEmail(email: state.email);
      _read(routerProvider.notifier).showDialog(child: const SendEmailDialog());
    } catch (e) {
      setError('再設定メールの送信中にエラーが発生しました');
    }
  }
}