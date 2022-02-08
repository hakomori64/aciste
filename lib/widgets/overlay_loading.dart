import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  const OverlayLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))
          ],
        ));
  }
}
