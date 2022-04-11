import 'package:aciste/constants.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/controllers/cache_controller.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/qrcode_screen/qrcode_screen.dart';
import 'package:aciste/screens/qrcode_screen/controllers/qrcode_screen_controller.dart';
import 'package:aciste/utils/miscellaneous.dart';
import 'package:aciste/widgets/attachments_carousel/attachments_carousel.dart';
import 'package:aciste/widgets/expandable_text/expandable_text.dart';
import 'package:aciste/widgets/user_icon/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCacheTile extends HookConsumerWidget {
  final Cache cache;

  const ProfileCacheTile({Key? key, required this.cache}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (cache.rank <= 3) FaIcon(
              FontAwesomeIcons.trophy,
              color: getRankColor(cache.rank),
              size: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cache.rank <= 0
                  ? const Text('')
                  : Text('${numWithSuffix(cache.rank)} discoverer')
              ],
            ),
            ListTile(
              leading: UserIcon(
                size: 40,
                imageUrl: cache.resource?.createdBy?.photoUrl ?? defaultUserPhotoUrl,
                onTap: () async {
                  ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: cache.resource!.createdBy!.id!));
                },
              ),
              title: Center(child: Text(cache.resource!.title),),
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
                            route: Routes.cacheEdit,
                            extra: CacheEditRouteParams(
                              cache: cache
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
                                    '${cache.resource!.title}の削除',
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
                                          await ref.read(cacheListControllerProvider.notifier)
                                            .deleteCache(cacheId: cache.id!);
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
                        leading: const FaIcon(FontAwesomeIcons.commentMedical),
                        title: const Text('キャッシュの作成をおしらせ'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          ref.read(routerProvider.notifier).push(route: Routes.announceCreate, extra: AnnounceCreateRouteParams(message: '', announceType: AnnounceType.cacheCreate));
                        }
                      ),
                      ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text('共有'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          final resourceId = cache.resource!.id!;
                          final url = await ref.read(dynamicLinksControllerProvider.notifier).getCacheImportUrl(
                            resourceId: resourceId,
                          );
                          final box = context.findRenderObject() as RenderBox?;
                          await Share.share('I am the ${cache.rank <= 0 ? "owner!!" : numWithSuffix(cache.rank) + ' discoverer!!'}\n $url', subject: url, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.qr_code),
                        title: const Text('QRコードで共有'),
                        onTap: () async {
                          ref.read(routerProvider.notifier).closeBottomSheet();
                          final resourceId = cache.resource!.id!;
                          final url = await ref.read(dynamicLinksControllerProvider.notifier).getCacheImportUrl(
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
              child: ExpandableText(text: cache.resource!.body)
            ),
            if (cache.resource!.attachments.isNotEmpty) Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AttachmentsCarousel(
                  attachments: cache.resource!.attachments.map((attachment) => AsyncValue.data(attachment)).toList(),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  onTap: (attachment) async {
                    await ref.read(routerProvider.notifier).push(
                      route: Routes.attachmentDetail,
                      extra: AttachmentDetailRouteParams(attachment: attachment)
                    );
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}