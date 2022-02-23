import 'package:aciste/router.dart';
import 'package:aciste/screens/login_screen/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final email = ref.watch(loginScreenControllerProvider).email;
    final password = ref.watch(loginScreenControllerProvider).password;

    final isNotEmpty = (email.isNotEmpty && password.isNotEmpty);
    final errorText = ref.watch(loginScreenControllerProvider).error;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: TextField(
                decoration: const InputDecoration(labelText: "メールアドレス"),
                onChanged: ref.read(loginScreenControllerProvider.notifier).setEmail,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: TextField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                maxLength: 20,
                onChanged: ref.read(loginScreenControllerProvider.notifier).setPassword,
              ),
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
                  'ログイン',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: isNotEmpty ? ref.read(loginScreenControllerProvider.notifier).onLogin : null,
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              child: const Text('上のメールアドレスにパスワード再設定メールを送信'),
              onPressed: email.isNotEmpty ? ref.read(loginScreenControllerProvider.notifier).onForgotPassword : null,
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text(
                'アカウントを作成する',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: () async {
                await ref.read(routerProvider.notifier).go(route: Routes.signup);
              },
            )
          )
        ],
      ),
    );
  }
}