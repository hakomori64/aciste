import 'dart:io';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/screens/dialog_screen.dart';
import 'package:aciste/screens/dialog_screen/dialog_screen_controller.dart';
import 'package:aciste/screens/item_create_screen.dart';
import 'package:aciste/screens/home_screen.dart';
import 'package:aciste/screens/item_create_screen/item_create_screen_controller.dart';
import 'package:aciste/screens/item_detail_screen.dart';
import 'package:aciste/screens/item_detail_screen/item_detail_screen_controller.dart';
import 'package:aciste/screens/item_import_screen.dart';
import 'package:aciste/screens/item_import_screen/item_import_screen_controller.dart';
import 'package:aciste/screens/launch_screen.dart';
import 'package:aciste/screens/logo_screen.dart';
import 'package:aciste/screens/media_screen.dart';
import 'package:aciste/screens/media_screen/media_screen_controller.dart';
import 'package:aciste/screens/profile_screen.dart';
import 'package:aciste/screens/profile_screen/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
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
      initialLocation: Routes.logo.route,
      routes: [
        GoRoute(
          path: Routes.logo.route,
          builder:(context, state) => const LogoScreen(),
          redirect: (state) {
            if (_userId != null) {
              return Routes.home.route;
            } else {
              return Routes.launch.route;
            }
          },
        ),
        GoRoute(
          path: Routes.launch.route,
          builder: (context, state) => const LaunchScreen(),
        ),
        GoRoute(
          path: Routes.home.route,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Routes.media.route,
          builder: (context, state) => const MediaScreen(),
        ),
        GoRoute(
          path: Routes.profile.route,
          pageBuilder:(context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ProfileScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeIn)),
                ),
                child: child
              ),
          ),
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

  Future<void> rebirth() async {
    await Phoenix.rebirth(state!.navigator!.context);
  }

  Future<void> _handleParams({required Routes route, Object? extra}) async {
    switch (route) {
      case Routes.launch:
        break;
      case Routes.login:
        break;
      case Routes.signup:
        break;
      case Routes.home:
        break;
      case Routes.media:
        final params = extra! as MediaRouteParams;
        await _read(mediaScreenControllerProvider.notifier).setResourceType(resourceType: params.resourceType);
        await _read(mediaScreenControllerProvider.notifier).setOnTapFunc(onTapFunc: params.onTapFunc);
        break;
      case Routes.profile:
        final params = extra! as ProfileRouteParams;
        await _read(profileScreenControllerProvider.notifier).setUser(userId: params.userId);
        break;
      case Routes.itemCreate:
        final params = extra! as ItemCreateRouteParams;
        _read(itemCreateScreenControllerProvider.notifier).setResourceType(params.resourceType);
        _read(itemCreateScreenControllerProvider.notifier).setCreateResourceParams(params.params);
        break;
      case Routes.itemDetail:
        final params = extra! as ItemDetailRouteParams;
        _read(itemDetailScreenControllerProvider.notifier).setItem(params.item);
        break;
      case Routes.itemImport:
        final params = extra! as ItemImportRouteParams;
        _read(itemImportScreenControllerProvider.notifier).setItem(params.item);
        break;
      default:
        return;
    }
    return;
  }

  Future<void> go({required Routes route, Object? extra}) async {
    await _handleParams(route: route, extra: extra);
    state!.go(route.route);
  }

  Future<void> push({required Routes route, Object? extra}) async {
    await _handleParams(route: route, extra: extra);
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
  logo,
  launch,
  login,
  signup,
  home,
  profile,
  media,
  itemCreate,
  itemDetail,
  itemImport,
  dialog,
}

extension RoutesExtension on Routes {
  String get route => '/${toString().split(".")[1]}';
}

class MediaRouteParams {
  final ResourceType resourceType;
  final Future<void> Function(File file) onTapFunc;

  const MediaRouteParams({required this.resourceType, required this.onTapFunc});
}

class ProfileRouteParams {
  final String userId;
  const ProfileRouteParams({required this.userId});
}

class ItemCreateRouteParams {
  final ResourceType resourceType;
  final CreateResourceParams? params;
  ItemCreateRouteParams({required this.resourceType, required this.params});
}

class ItemDetailRouteParams {
  final Item item;
  ItemDetailRouteParams({required this.item});
}

class ItemImportRouteParams {
  final Item item;
  ItemImportRouteParams({required this.item});
}