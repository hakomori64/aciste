import 'package:aciste/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementTileTopIcon extends HookConsumerWidget {
  const AnnouncementTileTopIcon({Key? key, required this.announcement}) : super(key: key);

  final Announcement announcement;
  
  @override
  Widget build(context, ref) {
    switch (announcement.announceType!) {
      case AnnounceType.itemCreate:
        return ImageIcon(
          const AssetImage('assets/images/logo.png'),
          color: Theme.of(context).primaryColor,
          size: 35,
        );
      case AnnounceType.other:
        return const FaIcon(
          FontAwesomeIcons.comment,
          size: 30,
        );
    }
  }
}