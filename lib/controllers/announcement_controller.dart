import 'dart:async';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/repositories/announcement_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final announcementControllerProvider = StateNotifierProvider<AnnouncementController, AsyncValue<List<Announcement>>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return AnnouncementController(ref.read, user?.uid);
  }
);

class AnnouncementController extends StateNotifier<AsyncValue<List<Announcement>>> {
  final Reader _read;
  final String? _userId;

  late StreamSubscription streamController;

  AnnouncementController(this._read, this._userId) : super(const AsyncValue.loading()) {
    if (_userId != null) {
      streamAnnouncement();
    }
  }

  Future<void> streamAnnouncement() async {
    try {
      final stream = await _read(announcementRepositoryProvider).streamAnnouncement(userId: _userId!);
      streamController = stream.listen((announcements) {
        state = AsyncValue.data(announcements);
      });
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  @override
  void dispose() {
    streamController.cancel();
    super.dispose();
  }

  Future<void> notifyToFollowers({required AnnounceType announceType}) async {
    if (_userId == null) return;

    await _read(announcementRepositoryProvider).notifyToFollowers(
      userId: _userId!,
      announceType: announceType,
    );
  }
}