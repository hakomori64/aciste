import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttachmentView extends HookConsumerWidget {

  final Attachment attachment;

  const AttachmentView({Key? key, required this.attachment}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    switch (attachment.type) {
      case AttachmentType.photo:
        return Container();
      case AttachmentType.none:
        return const Text('unrecognized type');
    }
  }
}