import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/enums/resource_type.dart';
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
  ref.watch(dynamicLinksControllerProvider).parameterMap,
));

class RouterController extends StateNotifier<GoRouter?> {
  RouterController(
    this._read,
    this._userId,
    this._path,
    this._parameterMap,
  ) : super(null) {
    _init();
  }

  final Reader _read;
  final String? _userId;
  final String? _path;
  final Map<String, dynamic>? _parameterMap;

  void _init() {
    state = GoRouter(
      initialLocation: Routes.home.route,
      routes: [
        GoRoute(
          path: Routes.home.route,
          builder: (context, state) => const HomeScreen(),
          redirect: (state) {
            print("path: $_path");
            print("parameter map: $_parameterMap");

            switch (_path) {
              case '/import':
                return Routes.itemImport.route;
              default:
                return null;
            }
          },
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
        )
      ]
    );
  }

  void showDialog({required Widget child}) {
    //TODO dialog screen
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
}

enum Routes {
  home,
  itemCreate,
  itemDetail,
  itemImport,
}

extension RoutesExtension on Routes {
  String get route => '/${toString().split(".")[1]}';
}