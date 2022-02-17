import 'package:aciste/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageScreen extends HookConsumerWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () async {
            await ref.read(routerProvider.notifier).go(route: Routes.home);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )
                )
              ),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();

              },
              child: const Text('決定'),
            )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: TextField(
            controller: messageController,
            maxLines: null,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'メッセージを入力してください'),
          ),
        )
      )
    );
  }
}