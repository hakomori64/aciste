import 'package:aciste/controllers/announcement_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_announce_list/profile_announce_list_controller.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_announce_list/widgets/profile_announce_list_error.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_announce_list/widgets/profile_announce_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileAnnounceList extends HookConsumerWidget {
  const ProfileAnnounceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final announcementListState = ref.watch(profileAnnounceListControllerProvider);

    return announcementListState.when(
      data: (announcements) => announcements.isEmpty ? const Center(
        child: Text('おしらせはありません'),
      ): Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: announcements.map((announcement) {
          return ProfileAnnounceTile(announcement: announcement);
        }).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ProfileAnnounceListError(
        message: error is CustomException ? error.message! : 'Something went wrong',
      )
    );
  }
}