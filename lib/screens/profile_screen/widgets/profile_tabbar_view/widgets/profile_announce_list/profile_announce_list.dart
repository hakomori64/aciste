import 'package:aciste/custom_exception.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './controllers/profile_announce_list_controller.dart';
import './widgets/profile_announce_tile/profile_announce_tile.dart';

class ProfileAnnounceList extends HookConsumerWidget {
  const ProfileAnnounceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final announcementListState = ref.watch(profileAnnounceListControllerProvider);

    return announcementListState.when(
      data: (announcements) => announcements.isEmpty ? const Center(
        child: Text('おしらせはありません'),
      ): ListView(
        children: announcements.map((announcement) {
          return ProfileAnnounceTile(announcement: announcement);
        }).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => SomethingWentWrong(
        message: error is CustomException ? error.message! : 'Something went wrong',
      )
    );
  }
}