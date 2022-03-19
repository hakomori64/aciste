import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/message.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/models/resource.dart';
import 'package:flutter/material.dart';

class CreateResourceOverView extends StatelessWidget {
  final ResourceType? resourceType;
  final CreateResourceParams? params;

  const CreateResourceOverView({
    Key? key,
    required this.resourceType,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (params == null) {
      return const Text("作成に必要な情報が取得できません");
    }
    switch (resourceType!) {
      case ResourceType.photo:
        final createPhotoParams = params as CreatePhotoParams;
        return Image.file(
          createPhotoParams.file,
          fit: BoxFit.fitWidth,
          isAntiAlias: true,
        );
      case ResourceType.message:
        final createMessageParams = params as CreateMessageParams;
        return SizedBox(
          width: double.infinity,
          child: Text(
            createMessageParams.message,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        );
      case ResourceType.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ResourceType.none:
        return const Center(child: Text("Unknown type"));
    }
  }
}