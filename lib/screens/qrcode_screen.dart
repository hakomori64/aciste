import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:aciste/custom_exception.dart';
import 'package:aciste/screens/qrcode_screen/qrcode_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class QRCodeScreen extends HookConsumerWidget {
  const QRCodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _key = useMemoized(() => GlobalKey());
    final url = ref.watch(qrCodeScreenControllerProvider).url;
    final boxSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    ) / 2;
    if (url == null) {
      return const CircularProgressIndicator();
    }
    return Column(
      children: [
        RepaintBoundary(
          key: _key,
          child: QrImage(
            data: url,
            size: boxSize,
            version: QrVersions.auto,
            embeddedImage: const AssetImage(
              'assets/images/logo.png'
            ),
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size(boxSize / 4, boxSize / 4),
              color: const Color(0xfff7c873),
            ),
            backgroundColor: Colors.white,
          )
        ),
        TextButton(
          child: const Text('画像として共有'),
          onPressed: () async {
            try {
              final boundary = _key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
              if (boundary != null) {
                final image = await boundary.toImage(pixelRatio: 3.0);
                final data = await image.toByteData(format: ImageByteFormat.png);
                final pngBytes = data!.buffer.asUint8List();

                final tempDir = await getTemporaryDirectory();
                final file = await File('${tempDir.path}/image.png').create();
                await file.writeAsBytes(pngBytes);

                final box = context.findRenderObject() as RenderBox?;
                await Share.shareFiles(
                  [file.path],
                  mimeTypes: ['image/png'],
                  text: 'QRコードの共有',
                  subject: 'QRコードの共有',
                  sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
                );
              }
            } catch (exception) {
              throw const CustomException(message: 'QRコードのシェアができませんでした');
            }
          },
        )
      ],
    );
  }
}