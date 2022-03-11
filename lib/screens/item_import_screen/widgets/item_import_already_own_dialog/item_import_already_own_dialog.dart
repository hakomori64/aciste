import 'package:aciste/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemImportAlreadyOwnDialog extends HookConsumerWidget {
  const ItemImportAlreadyOwnDialog({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'あなたは既にこのアイテムを持っています。',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    ref.read(routerProvider.notifier).closeDialog();
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: const Icon(
                    Icons.close,
                    size: 30.0,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                )
              ],
            )
          )
        )
      ]
    );
  }
}