import 'package:aciste/controllers/app_controller.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_create_screen/item_create_screen_controller.dart';
import 'package:aciste/widgets/create_resource_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    Future.delayed(const Duration(), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () async {
            ref.read(routerProvider.notifier).pop();
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
                      name: nameController.text,
                      description: descriptionController.text,
                      createdBy: authUserState!.uid,
                      resourceType: resourceType!,
                      content: params!
                  );
                ref.read(appControllerProvider.notifier).setloading(value: false);
                ref.read(routerProvider.notifier).go(route: Routes.home);
              },
              child: const Text(
                '作成',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
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
              TextField(
                controller: nameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: '名前 (optional)',
                ),
              ),
              const SizedBox(height: 30),
              ExpansionTile(
                backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
                title: Container(),
                initiallyExpanded: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: CreateResourceOverView(
                        resourceType: resourceType,
                        params: params,
                      ),
                    )
                  ),
                ],
              )
            ],
          )
        ),

      )
    );
  }
}