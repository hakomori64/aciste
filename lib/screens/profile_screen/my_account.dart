import 'package:aciste/constants.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/profile_screen/my_account/my_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends HookConsumerWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);
    final myAccountState = ref.watch(myAccountControllerProvider);
    final isDisplayNameEditing = myAccountState.isDisplayNameEditing;
    final isBioEditing = myAccountState.isBioEditing;

    final displayNameController = useTextEditingController(text: user.asData?.value?.displayName);
    final bioController = useTextEditingController(text: user.asData?.value?.bio);

    return user.when(
      data: (user) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              ref.read(routerProvider.notifier).showDialog(child: Column(
                children: [
                  ListTile(
                    title: const Center(child: Text('写真を撮る')),
                    
                    onTap: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        ref.read(userControllerProvider.notifier).updatePhoto(userId: user!.id!, file: pickedFile);
                      }
                      ref.read(routerProvider.notifier).closeDialog();
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Center(child: Text('画像を選択')),
                    onTap: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        ref.read(userControllerProvider.notifier).updatePhoto(userId: user!.id!, file: pickedFile);
                      }
                      ref.read(routerProvider.notifier).closeDialog();
                    },
                  )
                ],
              ));
            },
            child: ClipOval(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
                child: Image.network(user?.photoUrl ?? defaultUserPhotoUrl)
              )
            ),
          ),
          const SizedBox(height: 20),
          isDisplayNameEditing ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: TextField(
                  controller: displayNameController,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: '名前')
                ),
              ),
              TextButton(
                child: const Text('決定'),
                onPressed: () async {
                  await ref.read(userControllerProvider.notifier)
                    .updateUser(userId: user!.id!, user: user.copyWith(
                      displayName: displayNameController.text
                    ));
                  ref.read(myAccountControllerProvider.notifier)
                    .setIsDisplayNameEditing(value: false);
                },
              ),
            ],
          )
          : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(displayNameController.text),
              TextButton(
                child: const Text('編集'),
                onPressed: () {
                  ref.read(myAccountControllerProvider.notifier)
                    .setIsDisplayNameEditing(value: true);
                },
              )
            ],
          ),
          const SizedBox(height: 20),
          isBioEditing ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: TextField(
                  controller: bioController,
                  maxLines: null,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: '自分自身の説明を入れてください')
                ),
              ),
              TextButton(
                child: const Text('決定'),
                onPressed: () async {
                  await ref.read(userControllerProvider.notifier)
                    .updateUser(userId: user!.id!, user: user.copyWith(
                      bio: bioController.text
                    ));
                  ref.read(myAccountControllerProvider.notifier)
                    .setIsBioEditing(value: false);
                },
              ),
            ],
          )
          : Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(bioController.text),
              TextButton(
                child: const Text('編集'),
                onPressed: () {
                  ref.read(myAccountControllerProvider.notifier)
                    .setIsBioEditing(value: true);
                },
              )
            ],
          )
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error:(error, stackTrace) => Center(child: Text(error is CustomException ? error.message! : 'Something went wrong')),
    );
  }
}