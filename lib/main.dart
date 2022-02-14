import 'package:aciste/router.dart';
import 'package:aciste/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/app_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: const ProviderScope(child: MyApp())));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final router = ref.watch(routerProvider);
    final appControllerState = ref.watch(appControllerProvider);

    if (router == null) {
      return MaterialApp(
        builder: (context, child) => const CircularProgressIndicator(),
      );
    }

    return MaterialApp.router(
      title: 'aciste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      builder: (context, child) => Stack(
        children: [
          child!,
          Visibility(
            visible: appControllerState.loading,
            child: const OverlayLoading(),
          )
        ],
      ),
    );
  }
}
