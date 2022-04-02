import 'dart:async';

import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/repositories/profile_announcement_repository.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'profile_announce_list_controller.freezed.dart';

@freezed
class ProfileAnnounceListState with _$ProfileAnnounceListState {
  const factory ProfileAnnounceListState({
    @Default(AsyncValue.loading()) AsyncValue<List<Announcement>> data,
    DocumentSnapshot? firstDoc,
    DocumentSnapshot? lastDoc,
  }) = _ProfileAnnounceListState;
}

final profileAnnounceListControllerProvider = StateNotifierProvider<AnnouncementController, ProfileAnnounceListState>(
  (ref) {
    final user = ref.watch(profileScreenControllerProvider).user;
    return AnnouncementController(ref.read, user?.id);
  }
);

class AnnouncementController extends StateNotifier<ProfileAnnounceListState> {
  final Reader _read;
  final String? _userId;

  AnnouncementController(this._read, this._userId) : super(const ProfileAnnounceListState()) {
    if (_userId != null) {
      retrieveAnnouncementsPage();
    }
  }

  void _managePage() {
    state.data.whenData((data) => state = state.copyWith(
      firstDoc: data.isNotEmpty ? data.first.doc : null,
      lastDoc: data.isNotEmpty ? data.last.doc : null,
    ));
  }

  Future<void> retrieveAnnouncementsPage() async {
    try {
      final result = await _read(profileAnnouncementRepositoryProvider).retrieveAnnouncementsPage(userId: _userId!, startAfterDoc: state.lastDoc);
      final announcements = result.item1;

      state = state.copyWith(
        data: AsyncValue.data([
          ...(state.data.asData?.value ?? []),
          ...announcements
        ]),
      );

      _managePage();
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }

  Future<void> retrieveAnnouncementsBeforePage() async {
    try {
      final result = await _read(profileAnnouncementRepositoryProvider).retrieveAnnouncementsBeforePage(userId: _userId!, endBeforeDoc: state.firstDoc);
      final announcements = result.item1;

      state = state.copyWith(
        data: AsyncValue.data([
          ...announcements,
          ...(state.data.asData?.value ?? []),
        ]),
      );

      _managePage();
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }
}