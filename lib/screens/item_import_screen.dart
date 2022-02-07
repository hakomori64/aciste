import 'dart:math';

import 'package:aciste/models/item.dart';
import 'package:aciste/widgets/resource_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemImportScreen extends HookConsumerWidget {
  final Item item;

  const ItemImportScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final boxSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width
    ) * 3 / 4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('アイテムのインポート'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => context.pop(),
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