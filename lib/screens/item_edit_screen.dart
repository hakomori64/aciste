import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_edit_screen/item_edit_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemEditScreen extends HookConsumerWidget {

  const ItemEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final itemEditScreenState = ref.watch(itemEditScreenControllerProvider);
    final item = itemEditScreenState.item;
    final name = itemEditScreenState.name;
    final description = itemEditScreenState.description;
    final nameController = useTextEditingController(text: name);
    final descriptionController = useTextEditingController(text: description);


    return Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                        )
                      ),
                      onPressed: (name.isNotEmpty && description.isNotEmpty) ? () async {
                        await ref.read(itemListControllerProvider.notifier)
                          .updateItem(updatedItem: item!.copyWith(
                            name: name,
                            description: description
                          ));
                        ref.read(routerProvider.notifier).closeDialog();
                      } : null,
                      child: const Text(
                        '作成',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ),
                  ],
                ),
              ),
              const Text(
                'タイトル',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                )
              ),
              TextField(
                controller: nameController,
                onChanged: ref.read(itemEditScreenControllerProvider.notifier).setName,
                decoration: const InputDecoration(hintText: 'タイトル')
              ),
              const SizedBox(height: 20),
              const Text(
                '説明',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                )
              ),
              TextField(
                controller: descriptionController,
                maxLines: null,
                onChanged: ref.read(itemEditScreenControllerProvider.notifier).setDescription,
                decoration: const InputDecoration(hintText: '説明')
              ),
            ],
          )
        )
    );
  }
}