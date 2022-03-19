import 'package:aciste/router.dart';
import 'package:aciste/widgets/overlay_loading/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
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

    const primaryColor = Color(0xfff7c873);
    const secondaryColor = Color(0xffea9215);
    const primaryColorLight = Color(0xfff8dbb2);

    return MaterialApp.router(
      title: 'aciste',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        splashColor: primaryColor,
        colorScheme: const ColorScheme.light().copyWith(secondary: primaryColor),
        indicatorColor: primaryColor,
        highlightColor: primaryColor,
        primaryColorDark: secondaryColor,
        primaryColorLight: primaryColorLight,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: primaryColor
        ),
        platform: Theme.of(context).platform,
        androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
        secondaryHeaderColor: secondaryColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: primaryColor,
          selectionHandleColor: primaryColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color?>(primaryColor),
          )
        ),
        appBarTheme: const AppBarTheme(
          color: primaryColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xffea9215)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffea9215)
            )
          )
        )
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
