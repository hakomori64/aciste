import 'package:aciste/controllers/announcement_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/screens/main_screen/widgets/announcement_screen/announcement_list/announcement_list_error.dart';
import 'package:aciste/screens/main_screen/widgets/announcement_screen/announcement_list/announcement_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementList extends HookConsumerWidget {
  const AnnouncementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementListState = ref.watch(announcementControllerProvider);

    return announcementListState.when(
      data: (announcements) => announcements.isEmpty ? const Center(
        child: Text('最近の通知はありません'),
      ): ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return AnnouncementTile(announcement: announcement);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => AnnouncementListError(
        message: error is CustomException ? error.message! : 'Something went wrong',
      )
    );
  }
}