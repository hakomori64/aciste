import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/user.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';

final userExceptionProvider = StateProvider<CustomException?>((ref) => null);
final userControllerProvider = StateNotifierProvider<UserController, AsyncValue<User?>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return UserController(ref.read, user?.uid);
  }
);

class UserController extends StateNotifier<AsyncValue<User?>> {
  final Reader _read;
  final String? _userId;

  UserController(this._read, this._userId) : super(const AsyncValue.loading()) {
    if (_userId != null) {
      getUser();
    }
  }

  Future<void> getUser({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      if (_userId == null) {
        throw const CustomException(message: "_userIdがnullです");
      }
      var user = await _read(userRepositoryProvider).getUser(userId: _userId!);
      if (user == null) {
        await _read(userRepositoryProvider).createUser(
          userId: _userId!,
          user: User.empty());
        user = await _read(userRepositoryProvider).getUser(userId: _userId!);
        if (user == null) {
          throw const CustomException(message: "ユーザーを取得できませんでした");
        }
      }
      if (mounted) {
        state = AsyncValue.data(user);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> createUser({required String userId, required User user}) async {
    try {
      await _read(userRepositoryProvider).createUser(userId: userId, user: user);
    } on CustomException catch (e) {
      _read(userExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateUser({required String userId, required User user}) async {
    try {
      await _read(userRepositoryProvider).updateUser(userId: userId, user: user);
      state = AsyncValue.data(user);
    } on CustomException catch (e) {
      _read(userExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updatePhoto({required String userId, required XFile file}) async {
    final _file = File(file.path);
    final imageUrl = await _read(userRepositoryProvider).uploadPhoto(userId: userId, file: _file);
    final user = state.asData?.value;
    if (user != null) {
      await updateUser(userId: user.id!, user: user.copyWith(
        photoUrl: imageUrl
      ));
      state = AsyncValue.data(user.copyWith(photoUrl: imageUrl));
    }
  }

  Future<void> deleteUser({required String userId}) async {
    try {
      await _read(userRepositoryProvider).deleteUser(userId: userId);
      state = const AsyncValue.data(null);
    } on CustomException catch (e) {
      _read(userExceptionProvider.notifier).state = e;
    }
  }
}