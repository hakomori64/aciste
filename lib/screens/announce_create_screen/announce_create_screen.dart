import 'package:aciste/controllers/announcement_controller.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/announce_create_screen/controllers/announce_create_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnounceCreateScreen extends HookConsumerWidget {
  const AnnounceCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userControllerState = ref.watch(userControllerProvider);
    final user = userControllerState.asData?.value;
    final message = ref.watch(announceCreateScreenControllerProvider).message;
    final announceType = ref.watch(announceCreateScreenControllerProvider).announceType;
    final messageController = useTextEditingController(text: message);

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator())
      );
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              ref.read(routerProvider.notifier).pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                  ),
                ),
                onPressed: ref.watch(announceCreateScreenControllerProvider).message.isNotEmpty ? () async {
                  ref.read(routerProvider.notifier).go(route: Routes.main);
                  await ref.read(announcementListControllerProvider.notifier).notifyToFollowers(
                    message: messageController.text,
                    announceType: announceType,
                  );
                } : null,
                child: const Text(
                  '投稿',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )
                )
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: TextField(
                    controller: messageController,
                    maxLines: null,
                    maxLength: 600,
                    onChanged: ref.read(announceCreateScreenControllerProvider.notifier).setMessage,
                    decoration: InputDecoration(
                      labelText: 'おしらせ内容',
                      hintText: (() {
                        switch (announceType) {
                          case AnnounceType.cacheCreate:
                            return 'キャッシュがどこにあるかヒントを書きましょう！';
                          case AnnounceType.other:
                            return 'てきとうな呟きを書きましょう';
                        }
                      })(),
                    )
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}