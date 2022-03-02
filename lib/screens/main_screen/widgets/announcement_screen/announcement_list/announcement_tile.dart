import 'package:aciste/constants.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/main_screen/widgets/announcement_screen/announcement_list/announcement_tile/widgets/announcement_tile_top_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementTile extends HookConsumerWidget {
  final Announcement announcement;

  const AnnouncementTile({Key? key, required this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnnouncementTileTopIcon(announcement: announcement)
            ),
            ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: ClipOval(
                  child: GestureDetector(
                    onTap: () {
                      ref.read(routerProvider.notifier).push(route: Routes.profile, extra: ProfileRouteParams(userId: announcement.user!.id!));
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey[50],
                      child: CachedNetworkImage(
                        imageUrl: announcement.user?.photoUrl ?? defaultUserPhotoUrl,
                        fit: BoxFit.cover,
                      )
                    ),
                  )
                )
              ),
              title: Text(announcement.message),
            ),
          ],
        )
      )
    );
  }
}