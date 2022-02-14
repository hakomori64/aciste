import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/screens/item_edit_screen/item_edit_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemEditScreen extends HookConsumerWidget {
  final Item item;

  const ItemEditScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final itemEditScreenState = ref.watch(itemEditScreenControllerProvider);
    final nameController = useTextEditingController(text: item.name);
    final descriptionController = useTextEditingController(text: item.description);


    return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            const Text('タイトル'),
            itemEditScreenState.isNameEditing
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextField(
                    controller: nameController,
                    autofocus: true,
                    decoration: const InputDecoration(hintText: 'タイトル')
                  ),
                ),
                TextButton(
                  child: const Text('決定'),
                  onPressed: () async {
                    await ref.read(itemListControllerProvider.notifier)
                      .updateItem(
                        updatedItem: item.copyWith(
                          name: nameController.text
                        )
                      );
                    ref.read(itemEditScreenControllerProvider.notifier)
                      .setIsNameEditing(value: false);
                  },
                )
              ],
            )
            : Row(
              children: [
                Text(nameController.text),
                TextButton(
                  child: const Text('編集'),
                  onPressed: () {
                    ref.read(itemEditScreenControllerProvider.notifier)
                      .setIsNameEditing(value: true);
                      
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text('説明'),
            itemEditScreenState.isDescriptionEditing
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextField(
                    controller: descriptionController,
                    autofocus: true,
                    decoration: const InputDecoration(hintText: '説明')
                  ),
                ),
                TextButton(
                  child: const Text('決定'),
                  onPressed: () {
                    ref.read(itemListControllerProvider.notifier)
                      .updateItem(
                        updatedItem: item.copyWith(
                          description: descriptionController.text
                        )
                      );
                    ref.read(itemEditScreenControllerProvider.notifier)
                      .setIsDescriptionEditing(value: false);
                  },
                )
              ],
            )
            : Row(
              children: [
                Text(descriptionController.text),
                TextButton(
                  child: const Text('編集'),
                  onPressed: () {
                    ref.read(itemEditScreenControllerProvider.notifier)
                      .setIsDescriptionEditing(value: true);
                      
                  },
                )
              ],
            ),
          ],
        )
    );
  }
}