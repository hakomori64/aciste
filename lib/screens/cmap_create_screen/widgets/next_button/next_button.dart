import 'package:aciste/enums/cmap_type.dart';
import 'package:aciste/screens/cmap_create_screen/controllers/cmap_create_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NextButton extends HookConsumerWidget {
  final int page;
  final Future<void> Function() onPressed;
  const NextButton({Key? key, required this.page, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cMapCreateScreenState = ref.watch(cMapCreateScreenControllerProvider);
    final message = cMapCreateScreenState.message;
    final password = cMapCreateScreenState.password;
    final cMapType = cMapCreateScreenState.type;
    final item =cMapCreateScreenState.item;

    var condition = true;
    var text = '';
    switch (page) {
      case 0:
        condition = message.isNotEmpty;
        if (cMapType == CMapType.password) {
          condition &= password.isNotEmpty;
        }
        text = '次へ';
        break;
      case 1:
        condition = (item != null);
        text = '確認画面へ';
        break;
      case 2:
        condition = true;
        text = 'キャッシュする';
    }

    return TextButton(
      onPressed: condition ? onPressed : null,
      style: condition ? ButtonStyle(
        elevation: MaterialStateProperty.all<double?>(2),
        backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )
        )
      ) : ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )
        )
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        )
      ),
    );
  }
}