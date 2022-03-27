import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_create_screen/controllers/item_create_screen_controller.dart';
import 'package:aciste/widgets/attachments_carousel/attachments_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemCreateScreen extends HookConsumerWidget {

  const ItemCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final bodyController = useTextEditingController();
    final authUserState = ref.watch(authControllerProvider);
    final userControllerState = ref.watch(userControllerProvider);
    final user = userControllerState.asData?.value;
    final attachments = ref.watch(itemCreateScreenControllerProvider).attachments;
    final title = ref.watch(itemCreateScreenControllerProvider).title;

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GestureDetector(
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
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
                style: title.isNotEmpty ? ButtonStyle(
                  elevation: MaterialStateProperty.all<double?>(2),
                  backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                  )
                ) : ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor.withOpacity(0.5)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                    )
                  )
                ),
                onPressed: title.isNotEmpty && attachments.where((attachment) => attachment.asData?.value == null).toList().isEmpty ? () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  ref.read(routerProvider.notifier).go(route: Routes.main);
                  await ref.read(itemListControllerProvider.notifier)
                    .addItem(
                        description: '',
                        title: titleController.text,
                        body: bodyController.text,
                        createdBy: authUserState!.uid,
                        attachments: attachments.map((attachment) => attachment.asData!.value).toList(), 
                    );
                } : null,
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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (attachments.isNotEmpty) AttachmentsCarousel(
                        attachments: attachments,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        onTap: (attachment) async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await ref.read(routerProvider.notifier).push(
                            route: Routes.attachmentDetail,
                            extra: AttachmentDetailRouteParams(attachment: attachment)
                          );
                        },
                        onLongPress: (attachment) async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await ref.read(routerProvider.notifier).showBottomSheet(child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.restart_alt),
                                title: const Text('再度選択する'),
                                onTap: () {
                                  ref.read(routerProvider.notifier).closeBottomSheet();
                                  ref.read(routerProvider.notifier).push(route: Routes.media, extra: MediaRouteParams(attachmentType: attachment.type, onTapFunc: (file) async {
                                    ref.read(routerProvider.notifier).pop(); // pop media screen
                                    final params = CreatePhotoParams(file: file);
                                    await ref.read(itemCreateScreenControllerProvider.notifier).updateAttachment(
                                      oldAttachmentId: attachment.id!,
                                      attachmentType: attachment.type,
                                      data: params,
                                    );
                                  }));
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text('削除'),
                                onTap: () async {
                                  ref.read(routerProvider.notifier).closeBottomSheet();
                                  await ref.read(itemCreateScreenControllerProvider.notifier).deleteAttachment(attachmentId: attachment.id!);
                                }
                              )
                            ],
                          ));
                        },
                      ),
                      TextField(
                        controller: titleController,
                        onChanged: ref.read(itemCreateScreenControllerProvider.notifier).setTitle,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'タイトル',
                        ),
                      ),
                      const SizedBox(height: 5),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: TextField(
                          controller: bodyController,
                          onChanged: ref.read(itemCreateScreenControllerProvider.notifier).setBody,
                          maxLines: null,
                          maxLength: 600,
                          decoration: const InputDecoration(
                            labelText: '本文',
                          )
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  )
                ),
              
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    offset: Offset(0, 0.75)
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.white, 
                      child: InkWell(
                        splashColor: Theme.of(context).primaryColorLight,
                        onTap: () => ref.read(routerProvider.notifier).push(route: Routes.media, extra: MediaRouteParams(attachmentType: AttachmentType.photo, onTapFunc: (file) async {
                          ref.read(routerProvider.notifier).pop();
                          final params = CreatePhotoParams(file: file);
                          await ref.read(itemCreateScreenControllerProvider.notifier).addAttachment(attachmentType: AttachmentType.photo, data: params);
                        })),
                        child: const SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.image)
                        )
                      )
                    ),
                  )
                ]
              )
            )
          ],
        )
      ),
    );
  }
}