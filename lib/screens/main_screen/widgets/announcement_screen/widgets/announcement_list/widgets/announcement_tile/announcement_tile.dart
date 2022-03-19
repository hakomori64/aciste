import 'package:aciste/constants.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/widgets/announce_bubble/announce_bubble.dart';
import 'package:aciste/widgets/user_icon/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementTile extends HookConsumerWidget {
  final Announcement announcement;

  const AnnouncementTile({Key? key, required this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserIcon(
                size: 40,
                imageUrl: announcement.user?.photoUrl ?? defaultUserPhotoUrl,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AnnounceBubble(announcement: announcement)
              )
            ],
          ),
        ],
      )
    );
  }
}
