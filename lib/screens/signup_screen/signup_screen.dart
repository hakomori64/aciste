import 'package:aciste/screens/signup_screen/controllers/signup_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signupScreenControllerProvider).email;
    final password = ref.watch(signupScreenControllerProvider).password;
    final confirmPassword = ref.watch(signupScreenControllerProvider).confirmPassword;
    final isNotEmpty = (email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty);
    final errorText = ref.watch(signupScreenControllerProvider).error;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                '新規アカウントの作成',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: ref.read(signupScreenControllerProvider.notifier).setEmail,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                onChanged: ref.read(signupScreenControllerProvider.notifier).setPassword,
                maxLength: 20,
                obscureText: true,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: const InputDecoration(labelText: 'パスワード(確認)'),
                onChanged: ref.read(signupScreenControllerProvider.notifier).setConfirmPassword,
                maxLength: 20,
                obscureText: true,
              )
            ),
            if (errorText.isNotEmpty) Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                errorText,
                style: const TextStyle(color: Colors.red),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: const Text(
                  '登録',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: isNotEmpty ? ref.read(signupScreenControllerProvider.notifier).onSignup : null,
              ),
            ),
          ],
        )
      ),
    );
  }
}