import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/repositories/profile_item_repository.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'profile_item_list_controller.freezed.dart';

@freezed
class ProfileItemListState with _$ProfileItemListState {
  const factory ProfileItemListState({
    @Default(AsyncValue.loading()) AsyncValue<List<Item>> data,
    DocumentSnapshot? firstDoc,
    DocumentSnapshot? lastDoc,
  }) = _ProfileItemListState;
}

final profileItemListControllerProvider = StateNotifierProvider<ProfileItemListController, ProfileItemListState>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    final profileUser = ref.watch(profileScreenControllerProvider).user;
    return ProfileItemListController(ref.read, user?.uid, profileUser?.id);
  }
);

class ProfileItemListController extends StateNotifier<ProfileItemListState> {
  final Reader _read;
  final String? _userId;
  final String? _profileUserId;

  ProfileItemListController(this._read, this._userId, this._profileUserId) : super(const ProfileItemListState()) {
    if (_userId != null && _profileUserId != null) {
      retrieveItemsPage();
    }
  }

  void _managePage() {
    state.data.whenData((data) => state = state.copyWith(
      firstDoc: data.isNotEmpty ? data.first.doc : null,
      lastDoc: data.isNotEmpty ? data.last.doc : null,
    ));
  }

  Future<void> retrieveItemsPage() async {
    try {
      final result = await _read(profileItemRepositoryProvider).retrieveItemsPage(
        userId: _userId!,
        resourceCreatedBy: _profileUserId!,
        startAfterDoc: state.lastDoc);

      final items = result.item1;

      state = state.copyWith(
        data: AsyncValue.data([
          ...(state.data.asData?.value ?? []),
          ...items,
        ]),
      );

      _managePage();
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }

  Future<void> retrieveItemsBeforePage() async {
    try {
      final result = await _read(profileItemRepositoryProvider).retrieveItemsBeforePage(
        userId: _userId!,
        resourceCreatedBy: _profileUserId!,
        endBeforeDoc: state.firstDoc);
      final items = result.item1;

      state = state.copyWith(
        data: AsyncValue.data([
          ...items,
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