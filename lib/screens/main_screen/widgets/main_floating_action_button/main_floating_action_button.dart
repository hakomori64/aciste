import 'package:aciste/models/announcement.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/main_screen/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainFloatingActionButton extends HookConsumerWidget {
  const MainFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final mainScreenControllerState = ref.watch(mainScreenControllerProvider);
    switch (mainScreenControllerState.page) {
      case BottomItem.home:
        return mainScreenControllerState.isSelecting ? Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: RawMaterialButton(
                onPressed: () async {
                  ref.read(mainScreenControllerProvider.notifier).setIsSelecting(value: false);
                },
                elevation: 2.0,
                fillColor: Theme.of(context).primaryColor,
                child: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5.0),
                  child: const Center(child: Icon(Icons.arrow_back_ios, size: 40.0, color: Colors.white)),
                ),
                shape: const CircleBorder(),
              )
            )
          ],
        ) : Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: RawMaterialButton(
                onPressed: () async {
                  await ref.read(routerProvider.notifier).push(route: Routes.itemCreate);
                },
                elevation: 2.0,
                fillColor: Theme.of(context).primaryColor,
                child: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: const Center(child: Icon(Icons.add, size: 40.0, color: Colors.white)),
                ),
                shape: const CircleBorder(),
              )
            )
          ],
        );
      case BottomItem.announcement:
        return Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: RawMaterialButton(
                onPressed: () async {
                  await ref.read(routerProvider.notifier).push(route: Routes.announceCreate, extra: AnnounceCreateRouteParams(message: '', announceType: AnnounceType.other));
                },
                elevation: 2.0,
                fillColor: Theme.of(context).primaryColor,
                child: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5.0),
                  child: const Center(child: FaIcon(FontAwesomeIcons.commentMedical, size: 32.0, color: Colors.white)),
                ),
                shape: const CircleBorder(),
              ),
            )
          ],
        );
    }
  }
}