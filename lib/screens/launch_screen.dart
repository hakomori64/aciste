import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/router.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LaunchScreen extends HookConsumerWidget {
  const LaunchScreen({ Key? key }) : super(key: key);
  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Future<String?> onLogin(LoginData data) async {
      Future.delayed(loginTime, () async {
        final user = await ref.read(authControllerProvider.notifier).signInWithEmailAndPassword(email: data.name, password: data.password);
        if (user != null) {
          return null;
        } else {
          return 'emailとパスワードがマッチしません';
        }
      });
    }

    Future<String?> onSignUp(SignupData data) async {
      Future.delayed(loginTime, () async {
        if (data.name == null || data.password == null) {
          return 'Eメール、もしくはパスワードが空です';
        }
        final user = await ref.read(authControllerProvider.notifier).signUpWithEmailAndPassword(email: data.name!, password: data.password!);
        if (user != null) {
          return null;
        } else {
          return 'アカウントの作成に失敗しました';
        }
      });
    }

    Future<String?> onRecoverPassword(String data) async {
      return null;
    }

    return FlutterLogin(
      title: 'Aciste',
      onLogin: onLogin,
      onSignup: onSignUp,
      onRecoverPassword: onRecoverPassword,
      onSubmitAnimationCompleted: () async {
        ref.read(routerProvider.notifier).go(route: Routes.home);
      },
    );
  }
}