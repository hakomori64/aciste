import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/item_tile/item_tile.dart';

class ItemList extends HookConsumerWidget {
  const ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(itemListControllerProvider);

    return itemListState.when(
      data: (items) => items.isEmpty ? const Center(
        child: Text('まだアイテムはありません！', style: TextStyle(fontSize: 20.0))
      ) : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (index == items.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: ItemTile(item: item)
            );
          }
          return ItemTile(item: item);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => SomethingWentWrong(
        message: error is CustomException ? error.message! : 'Something went wrong'
      )
    );
  }
}
