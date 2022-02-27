import 'dart:math';

import 'package:aciste/controllers/app_controller.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/controllers/resource_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_import_screen/item_import_screen_controller.dart';
import 'package:aciste/screens/item_import_screen/widgets/item_import_celebrate_dialog.dart';
import 'package:aciste/widgets/resource_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_import_screen/widgets/item_import_already_own_dialog.dart';

class ItemImportScreen extends HookConsumerWidget {

  const ItemImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemImportScreenControllerProvider).item;
    final name = ref.watch(itemImportScreenControllerProvider).name;
    final description = ref.watch(itemImportScreenControllerProvider).description;
    final authUserStatus = ref.watch(authControllerProvider);

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
    final nameController = useTextEditingController(text: item.resource?.name ?? '');
    final descriptionController = useTextEditingController(text: item.resource?.description ?? '');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => ref.read(routerProvider.notifier).clear(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )
                )
              ),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                ref.read(appControllerProvider.notifier).setloading(value: true);
                final ownResource = await ref.read(itemListControllerProvider.notifier)
                  .checkHasResource(resourceId: item.resource!.id!);
                if (ownResource) {
                  ref.read(appControllerProvider.notifier).setloading(value: false);
                  ref.read(dynamicLinksControllerProvider.notifier).clear();
                  await ref.read(routerProvider.notifier).go(route: Routes.home);
                  ref.read(routerProvider.notifier).showDialog(child: const ItemImportAlreadyOwnDialog());
                  return;
                }

                await ref.read(itemListControllerProvider.notifier)
                  .importItem(
                    name: name,
                    description: description,
                    resource: item.resource!,
                    resourceType: item.resourceType!,
                    userId: authUserStatus?.uid,
                    rank: item.resource!.viewCount + 1,
                  );
                await ref.read(resourceControllerProvider)
                  .updateResource(
                    resource: item.resource!.copyWith(
                      viewCount: item.resource!.viewCount + 1,
                    ),
                    resourceType: item.resourceType!
                  );
                ref.read(appControllerProvider.notifier).setloading(value: false);
                ref.read(dynamicLinksControllerProvider.notifier).clear();
                await ref.read(routerProvider.notifier).go(route: Routes.home);
                if (item.resource!.viewCount + 1 < 4) {
                  ref.read(routerProvider.notifier).showDialog(child: ItemImportCelebrateDialog(rank: item.resource!.viewCount + 1));
                }
              },
              child: Text(
                'インポート',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                )
              ),
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'タイトル',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    )
                  ),
                  const SizedBox(height: 8.0,),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: '名前'),
                    onChanged: ref.read(itemImportScreenControllerProvider.notifier).setName,
                  ),
                  const SizedBox(height: 12.0,),
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
                    decoration: const InputDecoration(hintText: '説明'),
                    onChanged: ref.read(itemImportScreenControllerProvider.notifier).setDescription,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12,),
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
      )
    );
  }
}