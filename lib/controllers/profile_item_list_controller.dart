import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/repositories/profile_item_repository.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final profileItemListControllerProvider = StateNotifierProvider<ProfileItemListController, Pager<Item>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    final profileUser = ref.watch(profileScreenControllerProvider).user;
    return ProfileItemListController(ref.read, user?.uid, profileUser?.id);
  }
);

class ProfileItemListController extends StateNotifier<Pager<Item>> with PagingMixin<Item> {
  final Reader _read;
  final String? _userId;
  final String? _profileUserId;

  ProfileItemListController(this._read, this._userId, this._profileUserId) : super(const Pager<Item>()) {
    if (_userId != null && _profileUserId != null) {
      retrievePage();
    }
  }

  @override
  Future<List<Item>> getPage() async {
    return _read(profileItemRepositoryProvider(ProfileItemRepositoryParams(
      userId: _userId!,
      resourceCreatedById: _profileUserId!
    ))).retrievePage(startAfterDoc: state.lastDoc);
  }

  @override
  Future<List<Item>> getBeforePage() async {
    return _read(profileItemRepositoryProvider(ProfileItemRepositoryParams(
      userId: _userId!,
      resourceCreatedById: _profileUserId!
    ))).retrieveBeforePage(endBeforeDoc: state.firstDoc);
  }
}