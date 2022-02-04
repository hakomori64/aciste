import 'package:aciste/models/item.dart';
import 'package:aciste/widgets/resource_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemTile extends HookConsumerWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: Text(item.name),
            subtitle: Text('created by ${item.createdBy}'),
          ),
          ResourceView(item: item),
          Text(item.description),
        ],
      ),
    );
  }
}