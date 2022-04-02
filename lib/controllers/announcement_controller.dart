import 'dart:async';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/repositories/announcement_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_controller.freezed.dart';

@freezed
class AnnouncementListState with _$AnnouncementListState {
  const factory AnnouncementListState({
    @Default(AsyncValue.loading()) AsyncValue<List<Announcement>> data,
    DocumentSnapshot? firstDoc,
    DocumentSnapshot? lastDoc,
  }) = _AnnouncementListState;
}

final announcementListControllerProvider = StateNotifierProvider<AnnouncementController, AnnouncementListState>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return AnnouncementController(ref.read, user?.uid);
  }
);

class AnnouncementController extends StateNotifier<AnnouncementListState> {
  final Reader _read;
  final String? _userId;

  AnnouncementController(this._read, this._userId) : super(const AnnouncementListState()) {
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
      final result = await _read(announcementRepositoryProvider).retrieveAnnouncementsPage(userId: _userId!, startAfterDoc: state.lastDoc);
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
      final result = await _read(announcementRepositoryProvider).retrieveAnnouncementsBeforePage(userId: _userId!, endBeforeDoc: state.firstDoc);
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

  Future<void> notifyToFollowers({required String message, required AnnounceType announceType}) async {
    if (_userId == null) return;

    await _read(announcementRepositoryProvider).notifyToFollowers(
      userId: _userId!,
      message: message,
      announceType: announceType,
    );
    await retrieveAnnouncementsBeforePage();
  }
}