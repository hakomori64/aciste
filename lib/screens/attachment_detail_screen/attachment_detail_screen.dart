import 'package:aciste/router.dart';
import 'package:aciste/screens/attachment_detail_screen/controllers/attachment_detail_screen_controller.dart';
import 'package:aciste/widgets/attachment_view/attachment_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttachmentDetailScreen extends HookConsumerWidget {

  const AttachmentDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachmentDetailScreenState = ref.watch(attachmentDetailScreenControllerProvider);
    if (attachmentDetailScreenState.attachment == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => ref.read(routerProvider.notifier).pop(),
        ),
      ),
      body: AttachmentView(attachment: attachmentDetailScreenState.attachment!,)
    );
  }
}