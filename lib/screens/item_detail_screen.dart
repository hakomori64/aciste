import 'package:aciste/models/item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemDetailScreen extends HookConsumerWidget {
  final Item item;
  const ItemDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(item.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(
        child: Text(item.description)
      ),
    );
  }
}