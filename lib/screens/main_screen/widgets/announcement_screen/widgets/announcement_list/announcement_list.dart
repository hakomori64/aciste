import 'package:aciste/controllers/announcement_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/screens/main_screen/widgets/announcement_screen/widgets/announcement_list/widgets/announcement_tile/announcement_tile.dart';
import 'package:aciste/widgets/something_went_wrong/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementList extends HookConsumerWidget {
  const AnnouncementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementListState = ref.watch(announcementListControllerProvider);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() async {
        if (scrollController.offset == scrollController.position.maxScrollExtent) {
          await ref.read(announcementListControllerProvider.notifier).retrievePage();
        } else if (scrollController.offset <= 0) {
          await ref.read(announcementListControllerProvider.notifier).retrieveBeforePage();
        }
      });

      return;
    }, [scrollController]);

    return announcementListState.data.when(
      data: (announcements) => announcements.isEmpty ? const Center(
        child: Text('おしらせはありません。\nユーザーをフォローしましょう！'),
      ): ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(0),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return AnnouncementTile(announcement: announcement);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => SomethingWentWrong(
        message: error is CustomException ? error.message! : 'Something went wrong',
      )
    );
  }
}