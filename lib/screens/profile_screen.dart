import 'package:aciste/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/screens/profile_screen/profile_screen_controller.dart';

import 'profile_screen/my_account.dart';
import 'profile_screen/user_account.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(profileScreenControllerProvider).user;
    final me = ref.read(authControllerProvider);
    
    Widget child;
    if (user == null) {
      child = const Center(
        child: CircularProgressIndicator()
      );
    } else if (user.id == me?.uid) {
      child = const MyAccount();
    } else {
      child = UserAccount(user: user);
    }

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: child,
      )
    );
  }
}