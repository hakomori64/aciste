import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/user.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

final userExceptionProvider = StateProvider<CustomException?>((ref) => null);
final userControllerProvider = StateNotifierProvider<UserController, AsyncValue<User?>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return UserController(ref.read, user);
  }
);

class UserController extends StateNotifier<AsyncValue<User?>> {
  final Reader _read;
  final auth.User? _user;

  UserController(this._read, this._user) : super(const AsyncValue.loading()) {
    if (_user?.uid != null) {
      getUser();
    }
  }

  Future<void> getUser({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      if (_user == null) {
        throw const CustomException(message: "_userIdがnullです");
      }
      var user = await _read(userRepositoryProvider).getUser(userId: _user!.uid);
      if (user == null) {
        await _read(userRepositoryProvider).createUser(
          userId: _user!.uid,
          user: User.empty().copyWith(
            email: _user?.email ?? ''
          ));
        user = await _read(userRepositoryProvider).getUser(userId: _user!.uid);
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

  Future<void> follow({required String fromId, required String toId}) async {
    try {
      await _read(userRepositoryProvider).follow(fromId: fromId, toId: toId);
    } on CustomException catch (e) {
      _read(userExceptionProvider.notifier).state = e;
    }
  }

  Future<void> unfollow({required String fromId, required String toId}) async {
    try {
      await _read(userRepositoryProvider).unfollow(fromId: fromId, toId: toId);
    } on CustomException catch (e) {
      _read(userExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updatePhoto({required String userId, required File file}) async {
    final imageUrl = await _read(userRepositoryProvider).uploadPhoto(userId: userId, file: file);
    final user = state.asData?.value;
    if (user != null) {
      await updateUser(userId: user.id!, user: user.copyWith(
        photoUrl: imageUrl
      ));
      state = AsyncValue.data(user.copyWith(photoUrl: imageUrl));
    }
  }

  Future<void> updateBackgroundImage({required String userId, required File file}) async {
    final imageUrl = await _read(userRepositoryProvider).uploadPhoto(userId: userId, file: file);
    final user = state.asData?.value;
    if (user != null) {
      await updateUser(userId: user.id!, user: user.copyWith(
        backgroundImageUrl: imageUrl
      ));
      state = AsyncValue.data(user.copyWith(backgroundImageUrl: imageUrl));
    }
  }

  void setNotifyToFollowersDefault({required bool value}) async {
    final user = state.asData?.value;
    if (user != null) {
      await updateUser(userId: user.id!, user: user.copyWith(
        notifyToFollowersDefault: value
      ));
      state = AsyncValue.data(user.copyWith(notifyToFollowersDefault: value));
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