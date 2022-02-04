import 'package:aciste/constants.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/controllers/user_controller.dart';

import './home_screen/item_list.dart';
import 'home_screen/add_item_dialog.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userControllerState = ref.watch(userControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('aciste'),
        leading: userControllerState.when(
          data: (user) => Container(
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: GestureDetector(
                onTap: () {
                  debugPrint("hello");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Image.network(user?.photoUrl ?? defaultUserPhotoUrl)
                )
              )
            ),
          ),
          loading: () => const SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
          error: (error, _) => Text(error is CustomException ? error.message! : 'Something went wrong'),
        )
      ),
      body: const ItemList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => AddItemDialog.show(context, Item.empty()),
      ),
    );
  }
}