import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/models/photo.dart';
import 'package:flutter/material.dart';

class ResourceOverView extends StatelessWidget {
  final Item item;

  const ResourceOverView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item.resource == null) {
      return const Text("リソースが見つかりませんでした");
    }
    switch (item.resourceType!) {
      case ResourceType.photo:
        final photo = item.resource as Photo;
        return Image.network(
          photo.url!,
          fit: BoxFit.fitWidth,
          isAntiAlias: true,
        );
      case ResourceType.none:
        return const Center(child: Text("Unknown type"));
    }
  }
}