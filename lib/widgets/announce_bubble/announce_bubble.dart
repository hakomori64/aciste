import 'package:aciste/models/announcement.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnounceBubble extends StatelessWidget {
  final Announcement announcement;
  const AnnounceBubble({ Key? key, required this.announcement }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (announcement.announceType!) {
      case AnnounceType.cacheCreate:
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