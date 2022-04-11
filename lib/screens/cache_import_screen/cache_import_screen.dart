import 'dart:math';

import 'package:aciste/constants.dart';
import 'package:aciste/controllers/app_controller.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/cache_controller.dart';
import 'package:aciste/controllers/resource_controller.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/cache_import_screen/controllers/cache_import_screen_controller.dart';
import 'package:aciste/screens/cache_import_screen/widgets/cache_import_celebrate_dialog/cache_import_celebrate_dialog.dart';
import 'package:aciste/widgets/attachments_carousel/attachments_carousel.dart';
import 'package:aciste/widgets/expandable_text/expandable_text.dart';
import 'package:aciste/widgets/user_icon/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/cache_import_already_own_dialog/cache_import_already_own_dialog.dart';

class CacheImportScreen extends HookConsumerWidget {

  const CacheImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cache = ref.watch(cacheImportScreenControllerProvider).cache;
    final authUserStatus = ref.watch(authControllerProvider);

    final boxSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width
    ) * 3 / 4;

    if (cache == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => ref.read(routerProvider.notifier).go(route: Routes.main),
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
                final ownResource = await ref.read(cacheListControllerProvider.notifier)
                  .checkHasResource(resourceId: cache.resource!.id!);
                if (ownResource) {
                  await ref.read(routerProvider.notifier).showDialog(
                    child: const CacheImportAlreadyOwnDialog(),
                    baseScreenRoute: Routes.main,
                  );
                  ref.read(appControllerProvider.notifier).setloading(value: false);
                  return;
                }

                await ref.read(cacheListControllerProvider.notifier)
                  .importCache(
                    description: '',
                    resource: cache.resource!,
                    userId: authUserStatus?.uid,
                    rank: cache.resource!.viewCount + 1,
                  );
                await ref.read(resourceControllerProvider)
                  .updateResource(
                    resource: cache.resource!.copyWith(
                      viewCount: cache.resource!.viewCount + 1,
                    ),
                  );

                if (cache.resource!.viewCount + 1 < 4) {
                  await ref.read(routerProvider.notifier).showDialog(
                    child: CacheImportCelebrateDialog(rank: cache.resource!.viewCount + 1),
                    baseScreenRoute: Routes.main
                  );
                } else {
                  await ref.read(routerProvider.notifier).go(route: Routes.main);
                }
                ref.read(appControllerProvider.notifier).setloading(value: false);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: UserIcon(
                  size: 40,
                  imageUrl: cache.resource?.createdBy?.photoUrl ?? defaultUserPhotoUrl,
                  onTap: () async {
                    await ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: cache.resource!.createdBy!.id!));
                  }
                ),
                title: Center(child: Text(cache.resource!.title)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 80, top: 20),
              child: ExpandableText(text: cache.resource!.body),
            ),
            if (cache.resource!.attachments.isNotEmpty) Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AttachmentsCarousel(
                  attachments: cache.resource!.attachments.map((attachment) => AsyncValue.data(attachment)).toList(),
                  height: boxSize,
                  width: MediaQuery.of(context).size.width,
                  onTap: (attachment) async {
                    await ref.read(routerProvider.notifier).push(
                      route: Routes.attachmentDetail,
                      extra: AttachmentDetailRouteParams(attachment: attachment)
                    );
                  }
                )
              )
            )
          ]
        ),
      )
    );
  }
}