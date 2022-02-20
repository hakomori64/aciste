import 'package:aciste/controllers/app_controller.dart';
import 'package:aciste/controllers/user_controller.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/profile_edit_screen/profile_edit_screen_controller.dart';
import 'package:aciste/screens/profile_screen/profile_screen_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);
    final profileEditScreenState = ref.watch(profileEditScreenControllerProvider);
    final displayName = profileEditScreenState.displayName;
    final bio = profileEditScreenState.bio;
    final displayNameController = useTextEditingController(text: displayName);
    final bioController = useTextEditingController(text: bio);


    return Scaffold(
      body: SingleChildScrollView(
        child: user.when(
          data: (user) => Column(
            children: [
              SizedBox(
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: user!.backgroundImageUrl,
                        height: 200,
                        width: double.infinity,
                      )
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: () async {
                          // select background image
                          await ref.read(routerProvider.notifier).push(route: Routes.media, extra: MediaRouteParams(resourceType: ResourceType.photo, onTapFunc: (file) async {
                            ref.read(appControllerProvider.notifier).setloading(value: true);
                            await ref.read(userControllerProvider.notifier).updateBackgroundImage(userId: user.id!, file: file);
                            await ref.read(profileScreenControllerProvider.notifier).setUser(userId: user.id!);
                            ref.read(appControllerProvider.notifier).setloading(value: false);
                            ref.read(routerProvider.notifier).pop();
                          }));
                        },
                        child: Container(
                          height: 200,
                          color: Colors.black45.withOpacity(0.5),
                          child: const Center(
                            child: Icon(
                              Icons.camera_enhance,
                              size: 40,
                              color: Colors.white,
                            )
                          ),
                        )
                      )
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipOval(
                          child: GestureDetector(
                            onTap: () async {
                              await ref.read(routerProvider.notifier).push(route: Routes.media, extra: MediaRouteParams(resourceType: ResourceType.photo, onTapFunc: (file) async {
                                ref.read(appControllerProvider.notifier).setloading(value: true);
                                await ref.read(userControllerProvider.notifier).updatePhoto(userId: user.id!, file: file);
                                await ref.read(profileScreenControllerProvider.notifier).setUser(userId: user.id!);
                                ref.read(appControllerProvider.notifier).setloading(value: false);
                                ref.read(routerProvider.notifier).pop();
                              }));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.white,
                                  )
                                ),
                                Positioned(
                                  child: CachedNetworkImage(
                                    imageUrl: user.photoUrl,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    color: Colors.black45.withOpacity(0.5),
                                    child: const Center(
                                      child: Icon(
                                        Icons.camera_enhance,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    )
                                  )
                                ),
                              ],
                            ),
                          )
                        )
                      )
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const SizedBox(
                        width: 50,
                        child: Center(
                          child: Text(
                            '保存',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )
                          )
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(Theme.of(context).primaryColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                        )
                      ),
                      onPressed: (displayName.isNotEmpty && bio.isNotEmpty) ? () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        ref.read(appControllerProvider.notifier).setloading(value: true);
                        await ref.read(userControllerProvider.notifier).updateUser(
                          userId: user.id!,
                          
                          user: user.copyWith(
                            displayName: displayName,
                            bio: bio
                          ),
                        );
                        ref.read(profileScreenControllerProvider.notifier).setUser(userId: user.id!);
                        ref.read(appControllerProvider.notifier).setloading(value: false);
                        ref.read(routerProvider.notifier).pop();
                      } : null,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '名前',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      )
                    ),
                    TextField(
                      controller: displayNameController,
                      onChanged: ref.read(profileEditScreenControllerProvider.notifier).setDisplayName,
                      decoration: const InputDecoration(hintText: '名前')
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider()
                    ),

                    const Text(
                      '説明',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      )
                    ),
                    TextField(
                      controller: bioController,
                      maxLines: null,
                      onChanged: ref.read(profileEditScreenControllerProvider.notifier).setBio,
                      decoration: const InputDecoration(hintText: '説明')
                    ),
                  ],
                ),
              )
            ],
          ),
          loading:() => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error is CustomException ? error.message! : 'Something went wrong')),
        )
      )
    );
  }
}