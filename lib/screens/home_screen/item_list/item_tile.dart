import 'dart:math';

import 'package:aciste/constants.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/qrcode_screen.dart';
import 'package:aciste/screens/qrcode_screen/qrcode_screen_controller.dart';
import 'package:aciste/widgets/resource_overview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: GestureDetector(
                  onTap:() {
                    ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: item.resource!.createdBy!.id!));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.grey[50],
                    child: CachedNetworkImage(
                      imageUrl: item.resource?.createdBy?.photoUrl ?? defaultUserPhotoUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
              ),
            ),
            title: Center(child: Text(item.name)),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description)
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () async {
                await ref.read(routerProvider.notifier).showBottomSheet(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('編集'),
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
                                  '${item.name}の削除',
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
                    if (item.userId == item.resource!.createdBy!.id) ListTile(
                      leading: const Icon(Icons.share),
                      title: const Text('共有'),
                      onTap: () async {
                        final resourceId = item.resource!.id!;
                        final url = await ref.read(dynamicLinksControllerProvider.notifier).getItemImportUrl(resourceId: resourceId);
                        final box = context.findRenderObject() as RenderBox?;
                        await Share.share(url, subject: url, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                      },
                    ),
                    if (item.userId == item.resource!.createdBy!.id) ListTile(
                      leading: const Icon(Icons.qr_code),
                      title: const Text('QRコードで共有'),
                      onTap: () async {
                        ref.read(routerProvider.notifier).closeBottomSheet();
                        final resourceId = item.resource!.id!;
                        final url = await ref.read(dynamicLinksControllerProvider.notifier).getItemImportUrl(resourceId: resourceId);
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
            width: boxSize,
            height: boxSize,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  ref.read(routerProvider.notifier).push(route: Routes.itemDetail, extra: ItemDetailRouteParams(item: item));
                },
                child: ResourceOverView(item: item),
              )
            ),
          )
        ],
      ),
    );
  }
}