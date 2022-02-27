import 'package:aciste/constants.dart';
import 'package:aciste/router.dart';
import 'package:aciste/screens/item_import_screen/widgets/item_import_celebrate_dialog/item_import_celebrate_dialog_controller.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemImportCelebrateDialog extends HookConsumerWidget {
  const ItemImportCelebrateDialog({Key? key, required this.rank}) : super(key: key);
  final int rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final controller = ref.watch(itemImportCelebrateDialogControllerProvider).controller; 
    useEffect(() {
      if (controller != null) {
        controller.play();
      }
    }, [controller]);

    if (controller == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controller,
            blastDirectionality: BlastDirectionality.explosive,
          )
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.trophy,
                  color: getRankColor(rank),
                  size: 60,
                ),
                const SizedBox(height: 10,),
                const Text(
                  'おめでとうございます！',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'あなたは$rank番目の発見者です',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                RawMaterialButton(
                  onPressed: () {
                    ref.read(routerProvider.notifier).closeDialog();
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: const Icon(
                    Icons.close,
                    size: 30.0,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                )
              ],
            )
          )
        )
      ]
    );
  }
}