import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/screens/item_create_screen/item_create_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ItemCreateScreen extends HookConsumerWidget {

  final ResourceType resourceType;
  const ItemCreateScreen({Key? key, required this.resourceType}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final authUserState = ref.watch(authControllerProvider);

    final imageFile = ref.watch(itemCreateScreenControllerProvider).imageFile;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: imageFile == null
                  ? const Text('No image selected')
                  : Image.file(imageFile)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: 'camera',
                    onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                      ref.read(itemCreateScreenControllerProvider.notifier).pickImage(pickedFile);
                    },
                    tooltip: 'Pick Image From Camera',
                    child: const Icon(Icons.add_a_photo),
                  ),
                  FloatingActionButton(
                    heroTag: 'gallery',
                    onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      ref.read(itemCreateScreenControllerProvider.notifier).pickImage(pickedFile);
                    },
                    tooltip: 'Pick Image From Gallery',
                    child: const Icon(Icons.photo_library)
                  )
                ],
              ),
              TextField(
                controller: nameController,
                autofocus: true,
                decoration: const InputDecoration(hintText: '名前'),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: descriptionController,
                maxLines: null,
                autofocus: true,
                decoration: const InputDecoration(hintText: '説明'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor
                  ),
                  onPressed: () {
                    ref.read(itemListControllerProvider.notifier)
                      .addItem(
                          name: nameController.text.trim(),
                          description: descriptionController.text.trim(),
                          createdBy: authUserState!.uid,
                          resourceType: ResourceType.photo,
                          content: imageFile
                      );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add')
                )
              ),
            ],
          )
        ),

      )
    );
  }
}