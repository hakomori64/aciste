import 'package:aciste/constants.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/router.dart';
import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileAnnounceTile extends HookConsumerWidget {
  final Announcement announcement;

  const ProfileAnnounceTile({Key? key, required this.announcement}) : super(key: key);

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
              SizedBox(
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

class AnnounceBubble extends StatelessWidget {
  final Announcement announcement;
  const AnnounceBubble({ Key? key, required this.announcement }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (announcement.announceType!) {
      case AnnounceType.itemCreate:
        return Bubble(
          borderColor: Theme.of(context).primaryColor,
          borderWidth: 3,
          margin: const BubbleEdges.only(top: 10),
          nipOffset: 15,
          nipWidth: 20,
          nip: BubbleNip.leftTop,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableLinkify(
              text: announcement.message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },

            ),
          ),
        );
      case AnnounceType.other:
        return Bubble(
          margin: const BubbleEdges.only(top: 10),
          nipOffset: 15,
          nipWidth: 20,
          nip: BubbleNip.leftTop,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableLinkify(
              text: announcement.message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
      
            ),
          ),
        );
    }
  }
}