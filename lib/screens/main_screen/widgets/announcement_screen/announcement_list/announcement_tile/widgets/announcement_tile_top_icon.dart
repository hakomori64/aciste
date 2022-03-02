import 'package:aciste/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementTileTopIcon extends HookConsumerWidget {
  const AnnouncementTileTopIcon({Key? key, required this.announcement}) : super(key: key);

  final Announcement announcement;
  
  @override
  Widget build(context, ref) {
    switch (announcement.announceType!) {
      case AnnounceType.itemCreate:
        return ImageIcon(const AssetImage('assets/images/logo.png'), color: Theme.of(context).primaryColor);
    }
  }
}