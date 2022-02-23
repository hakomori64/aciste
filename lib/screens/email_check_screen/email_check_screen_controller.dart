import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'email_check_screen_controller.freezed.dart';

@freezed
class EmailCheckScreenState with _$EmailCheckScreenState {
  const factory EmailCheckScreenState({
    @Default("") String email,
    @Default("") String password,
    @Default("") String error,
    Routes? from,
  }) = _EmailCheckScreenState;
}

final emailCheckScreenControllerProvider = StateNotifierProvider<EmailCheckScreenController, EmailCheckScreenState>((ref) => EmailCheckScreenController(ref.read));

class EmailCheckScreenController extends StateNotifier<EmailCheckScreenState> {
  final Reader _read;
  EmailCheckScreenController(this._read) : super(const EmailCheckScreenState());

  void setEmail({required String email }) {
    state = state.copyWith(email: email);
  }

  void setPassword({required String password}) {
    state = state.copyWith(password: password);
  }

  void setFrom({required Routes from}) {
    state = state.copyWith(from: from);
  }

  void setError(String error) {
    state = state.copyWith(error: '');
  }

  Future<void> onLogin() async {
    setError('');
    final user = await _read(authControllerProvider.notifier).signInWithEmailAndPassword(email: state.email, password: state.password);
    if (user == null) {
      setError('emailとパスワードがマッチしません');
      return;
    }

    if (user.emailVerified) {
      await _read(routerProvider.notifier).go(route: Routes.home);
    } else {
      await user.sendEmailVerification();
      await _read(routerProvider.notifier).go(route: Routes.emailCheck, extra: EmailCheckRouteParams(email: state.email, password: state.password, from: Routes.login));
    }
  }
}