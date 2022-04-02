import 'dart:math';

import 'package:aciste/constants.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/qrcode_screen/qrcode_screen.dart';
import 'package:aciste/screens/qrcode_screen/controllers/qrcode_screen_controller.dart';
import 'package:aciste/utils.dart';
import 'package:aciste/widgets/attachments_carousel/attachments_carousel.dart';
import 'package:aciste/widgets/expandable_text/expandable_text.dart';
import 'package:aciste/widgets/user_icon/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemTile extends HookConsumerWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    ) * 3 / 4;
    final me = ref.watch(authControllerProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.rank <= 3) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: item.rank <= 0
                    ? ''
                    : '${numWithSuffix(item.rank)} discoverer',
                  child: FaIcon(
                    FontAwesomeIcons.trophy,
                    color: getRankColor(item.rank),
                    size: 40,
                  ),
                ),
              ],
            ),
            ListTile(
              leading: UserIcon(
                size: 40,
                imageUrl: item.resource?.createdBy?.photoUrl ?? defaultUserPhotoUrl,
                onTap: () async {
                  await ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: item.resource!.createdBy!.id!));
                },
              ),
              title: Center(child: Text(item.resource!.title),),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () async {
                  await ref.read(routerProvider.notifier).showBottomSheet(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (me?.uid != null && item.resource!.createdBy?.id == me?.uid) ListTile(
                        leading: const FaIcon(FontAwesomeIcons.commentMedical),
                        title: const Text('アイテムの作成をおしらせ'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          ref.read(routerProvider.notifier).push(route: Routes.announceCreate, extra: AnnounceCreateRouteParams(message: '', announceType: AnnounceType.itemCreate));
                        }
                      ),
                      if (me?.uid != null && item.resource!.createdBy?.id == me?.uid) ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('編集'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          ref.read(routerProvider.notifier).push(route: Routes.resourceEdit, extra: ResourceEditRouteParams(item: item));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.description),
                        title: const Text('説明'),
                        onTap: () {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          ref.read(routerProvider.notifier).showDialogRoute(
                            route: Routes.itemEdit,
                            extra: ItemEditRouteParams(
                              item: item
                            )
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('削除'),
                        onTap: () {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          ref.read(routerProvider.notifier).showDialog(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${item.resource!.title}の削除',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    )
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('本当に削除しますか？')
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        child: const Text('キャンセル'),
                                        onPressed: () {
                                          ref.read(routerProvider.notifier).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('削除'),
                                        onPressed: () async {
                                          await ref.read(itemListControllerProvider.notifier)
                                            .deleteItem(itemId: item.id!);
                                          ref.read(routerProvider.notifier).pop();
                                        },
                                      )
                                    ],
                                  )
                                ],
                              )
                            )
                          );
                        }
                      ),
                      ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text('共有'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          final resourceId = item.resource!.id!;
                          final url = await ref.read(dynamicLinksControllerProvider.notifier).getItemImportUrl(
                            resourceId: resourceId,
                          );
                          final box = context.findRenderObject() as RenderBox?;
                          await Share.share('I am the ${item.rank <= 0 ? "owner!!" : numWithSuffix(item.rank) + ' discoverer!!'}\n $url', subject: url, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.qr_code),
                        title: const Text('QRコードで共有'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          final resourceId = item.resource!.id!;
                          final url = await ref.read(dynamicLinksControllerProvider.notifier).getItemImportUrl(
                            resourceId: resourceId,
                          );
                          ref.read(qrCodeScreenControllerProvider.notifier).setUrl(url);
                          ref.read(routerProvider.notifier).showDialog(
                            child: const QRCodeScreen(),
                          );
                        },
                      )
                    ],
                  ));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 80, top: 20),
              child: ExpandableText(text: item.resource!.body),
            ),
            if (item.resource!.attachments.isNotEmpty) Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AttachmentsCarousel(
                  attachments: item.resource!.attachments.map((attachment) => AsyncValue.data(attachment)).toList(),
                  height: boxSize,
                  width: MediaQuery.of(context).size.width,
                  onTap: (attachment) async {
                    await ref.read(routerProvider.notifier).push(
                      route: Routes.attachmentDetail,
                      extra: AttachmentDetailRouteParams(attachment: attachment)
                    );
                  }
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}