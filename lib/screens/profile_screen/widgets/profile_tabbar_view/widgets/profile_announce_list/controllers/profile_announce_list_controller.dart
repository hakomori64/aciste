import 'dart:async';

import 'package:aciste/models/announcement.dart';
import 'package:aciste/repositories/profile_announcement_repository.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final profileAnnounceListControllerProvider = StateNotifierProvider<AnnouncementController, Pager<Announcement>>(
  (ref) {
    final user = ref.watch(profileScreenControllerProvider).user;
    return AnnouncementController(ref.read, user?.id);
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
    return _read(profileAnnouncementRepositoryProvider(ProfileAnnouncementRepositoryParams(
      userId: _userId!
    ))).retrievePage();
  }

  @override
  Future<List<Announcement>> getBeforePage() async {
    return _read(profileAnnouncementRepositoryProvider(ProfileAnnouncementRepositoryParams(
      userId: _userId!
    ))).retrieveBeforePage();
  }
}