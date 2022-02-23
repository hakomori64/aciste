import 'package:aciste/router.dart';
import 'package:aciste/screens/email_check_screen/email_check_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailCheckScreen extends HookConsumerWidget {
  const EmailCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailCheckScreenControllerProvider).email;
    final fromRoute = ref.watch(emailCheckScreenControllerProvider).from;
    final errorText = ref.watch(emailCheckScreenControllerProvider).error;

    var message = '';
    switch (fromRoute) {
      case Routes.login:
        message = '$emailに確認メールを送信しました';
        break;
      case Routes.signup:
        message = '登録を完了するために、確認メール内のリンクをクリックしてください';
        break;
      default:
        break;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
            ),
            if (errorText.isNotEmpty) Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                errorText,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                )
              )
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: const Text(
                  '確認メールを再送信',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: ref.read(emailCheckScreenControllerProvider.notifier).onLogin,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: const Text(
                  'メール確認完了',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: ref.read(emailCheckScreenControllerProvider.notifier).onLogin,
              )
            )
          ],
        ),
      ),
    );
  }
}