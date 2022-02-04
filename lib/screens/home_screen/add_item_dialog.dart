import 'package:aciste/screens/home_screen/item_list/add_item_dialog/add_item_dialog_controller.dart';
import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/item_controller.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddItemDialog extends HookConsumerWidget {
  static void show(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(item: item),
    );
  }

  final Item item;

  const AddItemDialog({Key? key, required this.item}) : super(key: key);

  bool get isUpdating => item.id != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: item.name);
    final descriptionController = useTextEditingController(text: item.description);
    final imageFile = ref.watch(addItemDialogControllerProvider).imageFile;
    final authUserState = ref.watch(authControllerProvider);

    final dialogWidth = MediaQuery.of(context).size.width * 3 / 4;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: dialogWidth,
                child: imageFile == null
                  ? const Text('No image selected')
                  : Image.file(imageFile)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                      ref.read(addItemDialogControllerProvider.notifier).pickImage(pickedFile);
                    },
                    tooltip: 'Pick Image From Camera',
                    child: const Icon(Icons.add_a_photo),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      ref.read(addItemDialogControllerProvider.notifier).pickImage(pickedFile);
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
                    primary: isUpdating ? Colors.orange : Theme.of(context).primaryColor
                  ),
                  onPressed: () {
                    isUpdating ?
                      ref.read(itemListControllerProvider.notifier)
                        .updateItem(
                          updatedItem: item.copyWith(
                            name: nameController.text.trim(),
                            description: descriptionController.text.trim(),
                          ),
                        )
                      : ref.read(itemListControllerProvider.notifier)
                        .addItem(
                            name: nameController.text.trim(),
                            description: descriptionController.text.trim(),
                            createdBy: authUserState!.uid,
                            resourceType: ResourceType.photo,
                            content: imageFile
                        );
                    Navigator.of(context).pop();
                  },
                  child: Text(isUpdating ? 'Update' : 'Add')
                )
              ),
            ],
          )
        ),

      )
    );
  }
}