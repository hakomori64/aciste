import 'package:aciste/controllers/cache_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/cache_edit_screen/controllers/cache_edit_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CacheEditScreen extends HookConsumerWidget {

  const CacheEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cacheEditScreenState = ref.watch(cacheEditScreenControllerProvider);
    final cache = cacheEditScreenState.cache;
    final description = cacheEditScreenState.description;
    final descriptionController = useTextEditingController(text: description);


    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
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
                    onPressed: () async {
                      await ref.read(cacheListControllerProvider.notifier)
                        .updateCache(
                          cacheId: cache!.id!,
                          description: description,
                          title: cache.resource!.title,
                          body: cache.resource!.body,
                          createdBy: cache.resource!.createdBy!.id!,
                          attachments: cache.resource!.attachments,
                        );
                      ref.read(routerProvider.notifier).closeDialog();
                    },
                    child: const Text(
                      '確定',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: descriptionController,
                      maxLines: null,
                      maxLength: 600,
                      onChanged: ref.read(cacheEditScreenControllerProvider.notifier).setDescription,
                      decoration: const InputDecoration(labelText: '説明')
                    )
                  ],
                )
              ),
            ),
          ],
        )
    );
  }
}