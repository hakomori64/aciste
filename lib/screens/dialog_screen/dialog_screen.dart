import 'package:aciste/router.dart';
import 'package:aciste/screens/dialog_screen/controllers/dialog_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DialogScreen extends HookConsumerWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = ref.watch(dialogScreenControllerProvider).child;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        ref.read(routerProvider.notifier).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.55),
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 3 * 2,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 15 + MediaQuery.of(context).padding.top,
                  bottom: 15,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: child!
                      ),
                    )
                  ],
                )
              ),
            ),
            
          )
        ),
      )
    );
  }
}
