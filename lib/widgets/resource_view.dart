import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/item.dart';
import 'package:flutter/material.dart';

class ResourceView extends StatelessWidget {
  final Item item;

  const ResourceView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (item.resourceType) {
      case ResourceType.photo:
        return Image.network(item.resourceUrl);
      case ResourceType.none:
        return const Center(child: Text("Unknown type"));
    }
  }
}