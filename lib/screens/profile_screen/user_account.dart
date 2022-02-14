import 'package:aciste/models/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAccount extends HookConsumerWidget {
  final User user;
  const UserAccount({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text('me');
  }
}