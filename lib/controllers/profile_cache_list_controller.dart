import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/repositories/profile_cache_repository.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final profileCacheListControllerProvider = StateNotifierProvider<ProfileCacheListController, Pager<Cache>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    final profileUser = ref.watch(profileScreenControllerProvider).user;
    return ProfileCacheListController(ref.read, user?.uid, profileUser?.id);
  }
);

class ProfileCacheListController extends StateNotifier<Pager<Cache>> with PagingMixin<Cache> {
  final Reader _read;
  final String? _userId;
  final String? _profileUserId;

  ProfileCacheListController(this._read, this._userId, this._profileUserId) : super(const Pager<Cache>()) {
    if (_userId != null && _profileUserId != null) {
      retrievePage();
    }
  }

  @override
  Future<List<Cache>> getPage() async {
    return _read(profileCacheRepositoryProvider(ProfileCacheRepositoryParams(
      userId: _userId!,
      resourceCreatedById: _profileUserId!
    ))).retrievePage(startAfterDoc: state.lastDoc);
  }

  @override
  Future<List<Cache>> getBeforePage() async {
    return _read(profileCacheRepositoryProvider(ProfileCacheRepositoryParams(
      userId: _userId!,
      resourceCreatedById: _profileUserId!
    ))).retrieveBeforePage(endBeforeDoc: state.firstDoc);
  }
}