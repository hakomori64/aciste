import 'package:aciste/controllers/app_controller.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_create_screen/item_create_screen_controller.dart';
import 'package:aciste/widgets/create_resource_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemCreateScreen extends HookConsumerWidget {

  const ItemCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final authUserState = ref.watch(authControllerProvider);

    final itemCreateScreenState = ref.watch(itemCreateScreenControllerProvider);
    final resourceType = itemCreateScreenState.resourceType;
    final params = itemCreateScreenState.params;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () async {
            await ref.read(routerProvider.notifier).go(route: Routes.home);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )
                )
              ),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                ref.read(appControllerProvider.notifier).setloading(value: true);
                await ref.read(itemListControllerProvider.notifier)
                  .addItem(
                      name: nameController.text.trim(),
                      description: descriptionController.text.trim(),
                      createdBy: authUserState!.uid,
                      resourceType: resourceType!,
                      content: params!
                  );
                ref.read(appControllerProvider.notifier).setloading(value: false);
                ref.read(routerProvider.notifier).go(route: Routes.home);
              },
              child: const Text('作成')
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreateResourceOverView(
                resourceType: resourceType,
                params: params,
              ),
              TextField(
                controller: nameController,
                autofocus: true,
                decoration: const InputDecoration(hintText: '名前'),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: descriptionController,
                maxLines: null,
                autofocus: true,
                decoration: const InputDecoration(hintText: '説明'),
              ),
            ],
          )
        ),

      )
    );
  }
}