import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './item_list/item_tile.dart';
import './item_list/item_list_error.dart';

class ItemList extends HookConsumerWidget {
  const ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(itemListControllerProvider);

    return itemListState.when(
      data: (items) => items.isEmpty ? const Center(
        child: Text('Tap + to add an item', style: TextStyle(fontSize: 20.0))
      ) : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(item: item);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ItemListError(
        message: error is CustomException ? error.message! : 'Something went wrong'
      )
    );
  }
}
