import 'dart:math';

import 'package:aciste/router.dart';
import 'package:aciste/screens/item_import_screen/item_import_screen_controller.dart';
import 'package:aciste/widgets/resource_overview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemImportScreen extends HookConsumerWidget {

  const ItemImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemImportScreenControllerProvider).item;

    final boxSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width
    ) * 3 / 4;

    if (item == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('アイテムのインポート'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => ref.read(routerProvider.notifier).clear(),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: boxSize,
            height: boxSize,
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  debugPrint('hello');
                },
                child: ResourceOverView(item: item)
              )
            )
          )
        ]
      ),
    );
  }
}