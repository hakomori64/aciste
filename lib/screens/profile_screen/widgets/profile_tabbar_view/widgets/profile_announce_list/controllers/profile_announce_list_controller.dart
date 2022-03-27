import 'dart:async';

import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/repositories/announcement_repository.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileAnnounceListControllerProvider = StateNotifierProvider<AnnouncementController, AsyncValue<List<Announcement>>>(
  (ref) {
    final user = ref.watch(profileScreenControllerProvider).user;
    return AnnouncementController(ref.read, user?.id);
  }
);

class AnnouncementController extends StateNotifier<AsyncValue<List<Announcement>>> {
  final Reader _read;
  final String? _userId;

  AnnouncementController(this._read, this._userId) : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveAnnouncements();
    }
  }

  Future<void> retrieveAnnouncements() async {
    try {
      final announcements = await _read(announcementRepositoryProvider).retrieveAnnouncements(userId: _userId!);
      state = AsyncValue.data(announcements);
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}