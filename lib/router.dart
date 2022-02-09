import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/screens/dialog_screen.dart';
import 'package:aciste/screens/dialog_screen/dialog_screen_controller.dart';
import 'package:aciste/screens/item_create_screen.dart';
import 'package:aciste/screens/home_screen.dart';
import 'package:aciste/screens/item_create_screen/item_create_screen_controller.dart';
import 'package:aciste/screens/item_detail_screen.dart';
import 'package:aciste/screens/item_detail_screen/item_detail_screen_controller.dart';
import 'package:aciste/screens/item_import_screen.dart';
import 'package:aciste/screens/item_import_screen/item_import_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/item.dart';


final routerProvider = StateNotifierProvider<RouterController, GoRouter?>((ref) => RouterController(
  ref.read,
  ref.watch(authControllerProvider)?.uid,
  ref.watch(dynamicLinksControllerProvider).path,
));

class RouterController extends StateNotifier<GoRouter?> {
  RouterController(
    this._read,
    this._userId,
    this._path,
  ) : super(null) {
    _init();
  }

  final Reader _read;
  final String? _userId;
  final String? _path;

  void _init() {
    state = GoRouter(
      initialLocation: Routes.home.route,
      routes: [
        GoRoute(
          path: Routes.home.route,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Routes.itemCreate.route,
          //builder: (context, state) => ItemCreateScreen(resourceType: state.extra! as ResourceType),
          builder: (context, state) => const ItemCreateScreen()
        ),
        GoRoute(
          path: Routes.itemDetail.route,
          //builder: (context, state) => ItemDetailScreen(item: state.extra! as Item),
          builder: (context, state) => const ItemDetailScreen()
        ),
        GoRoute(
          path: Routes.itemImport.route,
          //builder:(context, state) => ItemImportScreen(item: state.extra! as Item),
          builder: (context, state) => const ItemImportScreen()
        ),
        GoRoute(
          path: Routes.dialog.route,
          pageBuilder: (context, state) => CustomTransitionPage(
            opaque: false,
            barrierColor: Colors.black.withOpacity(0.5),
            barrierDismissible: true,
            fullscreenDialog: true,
            child: const DialogScreen(),
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          )
        ),
      ],
      redirect: (state) {
        switch (_path) {
          case '/import':
            if (state.location != Routes.itemImport.route) {
              return Routes.itemImport.route;
            }
            return null;
          default:
            return null;
        }
      },
    );
  }

  void showDialog({required Widget child}) {
    _read(dialogScreenControllerProvider.notifier).setChild(child);
    if (state!.location != Routes.dialog.route) {
      state!.push(Routes.dialog.route);
    }
  }

  void closeDialog() {
    if (state!.location == Routes.dialog.route) {
      state!.pop();
    }
  }

  Future<void> showBottomSheet({required Widget child}) async {
    await showModalBottomSheet(context: state!.navigator!.context, builder: (context) {
      return child;
    });
  }

  void closeBottomSheet() {
    state!.navigator!.pop();
  }

  Future<void> push({required Routes route, Object? extra}) async {
    switch (route) {
      case Routes.home:
        break;
      case Routes.itemCreate:
        _read(itemCreateScreenControllerProvider.notifier).setResourceType(extra! as ResourceType);
        break;
      case Routes.itemDetail:
        _read(itemDetailScreenControllerProvider.notifier).setItem(extra as Item);
        break;
      case Routes.itemImport:
        _read(itemImportScreenControllerProvider.notifier).setItem(extra as Item);
        break;
      default:
        return;
    }
    await Future.delayed(const Duration(microseconds: 200));
    state!.push(route.route);
  }

  void pop() {
    state!.pop();
  }

  void clear() {
    state!.go(Routes.home.route);
    _read(dynamicLinksControllerProvider.notifier).clear();
  }
}

enum Routes {
  home,
  itemCreate,
  itemDetail,
  itemImport,
  dialog,
}

extension RoutesExtension on Routes {
  String get route => '/${toString().split(".")[1]}';
}