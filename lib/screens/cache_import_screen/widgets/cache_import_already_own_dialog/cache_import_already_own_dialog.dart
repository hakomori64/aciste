import 'package:aciste/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CacheImportAlreadyOwnDialog extends HookConsumerWidget {
  const CacheImportAlreadyOwnDialog({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                '既にこのキャッシュを持っています。',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(routerProvider.notifier).closeDialog();
            },
            child: Text(
              '閉じる',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              )
            )
          )
        ],
      )
    );
  }
}