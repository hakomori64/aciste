import 'package:aciste/screens/main_screen/widgets/announcement_screen/widgets/announcement_list/announcement_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnouncementScreen extends HookConsumerWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AnnouncementList();
  }
}