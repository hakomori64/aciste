import 'dart:async';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/repositories/announcement_repository.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final announcementListControllerProvider = StateNotifierProvider<AnnouncementController, Pager<Announcement>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return AnnouncementController(ref.read, user?.uid);
  }
);

class AnnouncementController extends StateNotifier<Pager<Announcement>> with PagingMixin<Announcement> {
  final Reader _read;
  final String? _userId;

  AnnouncementController(this._read, this._userId) : super(const Pager<Announcement>()) {
    if (_userId != null) {
      retrievePage();
    }
  }

  @override
  Future<List<Announcement>> getPage() async {
    return _read(announcementRepositoryProvider(AnnouncementRepositoryParams(userId: _userId!))).retrievePage(startAfterDoc: state.lastDoc);
  }

  @override
  Future<List<Announcement>> getBeforePage() async {
    return _read(announcementRepositoryProvider(AnnouncementRepositoryParams(userId: _userId!))).retrieveBeforePage(endBeforeDoc: state.firstDoc);
  }

  Future<void> notifyToFollowers({required String message, required AnnounceType announceType}) async {
    if (_userId == null) return;

    await _read(announcementRepositoryProvider(AnnouncementRepositoryParams(userId: _userId!))).notifyToFollowers(
      message: message,
      announceType: announceType,
    );
    await retrieveBeforePage();
  }
}