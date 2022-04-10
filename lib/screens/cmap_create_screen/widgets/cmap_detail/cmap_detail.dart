import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/enums/cmap_type.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/cmap_create_screen/controllers/cmap_create_screen_controller.dart';
import 'package:aciste/widgets/attachments_carousel/attachments_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CMapDetail extends HookConsumerWidget {
  const CMapDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheCreateScreenState = ref.watch(cMapCreateScreenControllerProvider);
    final cacheType = cacheCreateScreenState.type;
    final messageController = useTextEditingController();
    final passwordController = useTextEditingController();
    final attachments = cacheCreateScreenState.attachments;

    return GestureDetector(
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Column(
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
                                    await ref.read(cMapCreateScreenControllerProvider.notifier).updateAttachment(
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
                                  await ref.read(cMapCreateScreenControllerProvider.notifier).deleteAttachment(attachmentId: attachment.id!);
                                }
                              )
                            ],
                          ));
                        },
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: TextField(
                          controller: messageController,
                          onChanged: ref.read(cMapCreateScreenControllerProvider.notifier).setMessage,
                          maxLines: null,
                          maxLength: 2000,
                          decoration: const InputDecoration(
                            labelText: 'キャッシュメッセージ',
                            hintText: 'キャッシュを見つけるためのヒントを書きましょう✨'
                          )
                        )
                      ),

                      DropdownButtonFormField<CMapType>(
                        value: cacheType,
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: 'キャッシュの形式',
                        ),
                        items: const [
                          DropdownMenuItem(
                            child: Center(child: Text('パスワード', style: TextStyle(fontSize: 20))),
                            value: CMapType.password,
                          ),
                          DropdownMenuItem(
                            child: Center(child: Text('リンク', style: TextStyle(fontSize: 20))),
                            value: CMapType.link
                          ),
                        ],
                        onChanged: (cacheType) => ref.read(cMapCreateScreenControllerProvider.notifier).setType(cacheType!),
                      ),
                      if (cacheType == CMapType.password) TextField(
                        controller: passwordController,
                        onChanged: ref.read(cMapCreateScreenControllerProvider.notifier).setPassword,
                        decoration: const InputDecoration(
                          labelText: 'パスワード'
                        )
                      )
                    ],
                  )
                )
              )
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
                        splashColor: Theme.of(context).primaryColor,
                        onTap: () => ref.read(routerProvider.notifier).push(route: Routes.media, extra: MediaRouteParams(attachmentType: AttachmentType.photo, onTapFunc: (file) async {
                          ref.read(routerProvider.notifier).pop();
                          final params = CreatePhotoParams(file: file);
                          await ref.read(cMapCreateScreenControllerProvider.notifier).addAttachment(attachmentType: AttachmentType.photo, data: params);
                        })),
                        child: const SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.image),
                        )
                      )
                    )
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}