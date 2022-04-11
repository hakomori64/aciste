import 'dart:io';

import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/controllers/dynamic_links_controller.dart';
import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/enums/cmap_type.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/repositories/resource_repository.dart';
import 'package:aciste/screens/announce_create_screen/announce_create_screen.dart';
import 'package:aciste/screens/announce_create_screen/controllers/announce_create_screen_controller.dart';
import 'package:aciste/screens/attachment_detail_screen/controllers/attachment_detail_screen_controller.dart';
import 'package:aciste/screens/cache_edit_screen/controllers/cache_edit_screen_controller.dart';
import 'package:aciste/screens/cmap_create_screen/controllers/cmap_create_screen_controller.dart';
import 'package:aciste/screens/dialog_screen/dialog_screen.dart';
import 'package:aciste/screens/dialog_screen/controllers/dialog_screen_controller.dart';
import 'package:aciste/screens/email_check_screen/email_check_screen.dart';
import 'package:aciste/screens/email_check_screen/controllers/email_check_screen_controller.dart';
import 'package:aciste/screens/follows_screen/follows_screen.dart';
import 'package:aciste/screens/follows_screen/controllers/follows_screen_controller.dart';
import 'package:aciste/screens/cache_create_screen/controllers/cache_create_screen_controller.dart';
import 'package:aciste/screens/cache_create_screen/cache_create_screen.dart';
import 'package:aciste/screens/cache_edit_screen/cache_edit_screen.dart';
import 'package:aciste/screens/cache_import_screen/cache_import_screen.dart';
import 'package:aciste/screens/cache_import_screen/controllers/cache_import_screen_controller.dart';
import 'package:aciste/screens/login_screen/login_screen.dart';
import 'package:aciste/screens/logo_screen/logo_screen.dart';
import 'package:aciste/screens/main_screen/main_screen.dart';
import 'package:aciste/screens/media_screen/media_screen.dart';
import 'package:aciste/screens/media_screen/controllers/media_screen_controller.dart';
import 'package:aciste/screens/profile_edit_screen/profile_edit_screen.dart';
import 'package:aciste/screens/profile_screen/profile_screen.dart';
import 'package:aciste/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:aciste/screens/resource_edit_screen/controllers/resource_edit_screen_controller.dart';
import 'package:aciste/screens/resource_edit_screen/resource_edit_screen.dart';
import 'package:aciste/screens/signup_screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/cache.dart';
import 'screens/attachment_detail_screen/attachment_detail_screen.dart';
import 'screens/cmap_create_screen/cmap_create_screen.dart';


final routerProvider = StateNotifierProvider<RouterController, GoRouter?>((ref) => RouterController(
  ref.read,
  ref.listen,
  ref.watch(authControllerProvider),
));

class RouterController extends StateNotifier<GoRouter?> {
  RouterController(
    this._read,
    this._listen,
    this._user,
  ) : super(null) {
    _init();
  }

  final Reader _read;
  final void Function() Function<T>(AlwaysAliveProviderListenable<T>, void Function(T?, T))  _listen;
  final User? _user;

  void _init() {
    state = GoRouter(
      initialLocation: Routes.logo.route,
      routes: [
        GoRoute(
          path: Routes.logo.route,
          builder:(context, state) => screen(route: Routes.logo),
          redirect: (state) {
            if (_user?.uid != null && _user!.emailVerified) {
              return Routes.main.route;
            } else {
              return Routes.login.route;
            }
          },
        ),
        GoRoute(
          path: Routes.login.route,
          builder: (context, state) => screen(route: Routes.login),
        ),
        GoRoute(
          path: Routes.signup.route,
          builder: (context, state) => screen(route: Routes.signup),
        ),
        GoRoute(
          path: Routes.emailCheck.route,
          builder: (context, state) => screen(route: Routes.emailCheck),
        ),
        GoRoute(
          path: Routes.main.route,
          builder: (context, state) => screen(route: Routes.main),
        ),
        GoRoute(
          path: Routes.media.route,
          builder: (context, state) => screen(route: Routes.media),
        ),
        GoRoute(
          path: Routes.profile.route,
          pageBuilder:(context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: screen(route: Routes.profile),
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
          path: Routes.follows.route,
          builder: (context, state) => screen(route: Routes.follows),
        ),
        GoRoute(
          path: Routes.profileEdit.route,
          builder: (context, state) => screen(route: Routes.profileEdit),
        ),
        GoRoute(
          path: Routes.cacheCreate.route,
          builder: (context, state) => screen(route: Routes.cacheCreate),
        ),
        GoRoute(
          path: Routes.cMapCreate.route,
          builder: (context, state) => screen(route: Routes.cMapCreate),
        ),
        GoRoute(
          path: Routes.attachmentDetail.route,
          builder: (context, state) => screen(route: Routes.attachmentDetail),
        ),
        GoRoute(
          path: Routes.cacheImport.route,
          builder: (context, state) => screen(route: Routes.cacheImport),
        ),
        GoRoute(
          path: Routes.resourceEdit.route,
          builder: (context, state) => screen(route: Routes.resourceEdit),
        ),
        GoRoute(
          path: Routes.announceCreate.route,
          builder: (context, state) => screen(route: Routes.announceCreate),
        ),
        GoRoute(
          path: Routes.dialog.route,
          pageBuilder: (context, state) => CustomTransitionPage(
            opaque: false,
            barrierColor: Colors.black.withOpacity(0.5),
            barrierDismissible: true,
            fullscreenDialog: true,
            child: screen(route: Routes.dialog),
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          )
        ),
      ],
    );

    _listen(dynamicLinksControllerProvider, (DynamicLinkState? previous, DynamicLinkState current) async {
      if (current.path != null && current.parameterMap != null && _user != null) {
        final path = current.path;
        final parameterMap = current.parameterMap;
        switch (path) {
          case '/import':
            final resourceId = parameterMap!['resourceId'] as String;
            final resource = await _read(resourceRepositoryProvider).retrieveResource(
              resourceId: resourceId,
            );
            final cache = Cache.empty().copyWith(
              resource: resource,
            );
            await refresh();
            await push(route: Routes.cacheImport, extra: CacheImportRouteParams(cache: cache, resource: resource));
            break;
          case '/profile':
            final userId = parameterMap!['userId'] as String;
            await refresh();
            await push(route: Routes.profile, extra: ProfileRouteParams(userId: userId));
            break;
          default:
            break;
        }
        _read(dynamicLinksControllerProvider.notifier).clear();
      }
    });
  }

  Future<void> showDialogRoute({required Routes route, Object? extra, Routes? baseScreenRoute, Object? baseScreenExtra}) async {
    if (baseScreenRoute != null) {
      await _handleParams(route: baseScreenRoute, extra: baseScreenExtra);
      if (state!.location != Routes.dialog.route) {
        state!.push(baseScreenRoute.route);
      }
    }
    await _handleParams(route: route, extra: extra);
    _read(dialogScreenControllerProvider.notifier).setChild(screen(route: route));
    if (state!.location != Routes.dialog.route) {
      state!.push(Routes.dialog.route);
    }
  }

  Future<void> showDialog({required Widget child, Routes? baseScreenRoute, Object? baseScreenExtra}) async {
    if (baseScreenRoute != null) {
      await _handleParams(route: baseScreenRoute, extra: baseScreenExtra);
      if (state!.location != Routes.dialog.route) {
        state!.push(baseScreenRoute.route);
      }
    }
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
      case Routes.login:
        break;
      case Routes.main:
        break;
      case Routes.media:
        final params = extra! as MediaRouteParams;
        await _read(mediaScreenControllerProvider.notifier).setAttachmentType(attachmentType: params.attachmentType);
        await _read(mediaScreenControllerProvider.notifier).setOnTapFunc(onTapFunc: params.onTapFunc);
        break;
      case Routes.emailCheck:
        final params = extra! as EmailCheckRouteParams;
        _read(emailCheckScreenControllerProvider.notifier).setEmail(email: params.email);
        _read(emailCheckScreenControllerProvider.notifier).setPassword(password: params.password);
        _read(emailCheckScreenControllerProvider.notifier).setFrom(from: params.from);
        break;
      case Routes.profile:
        final params = extra! as ProfileRouteParams;
        await _read(profileScreenControllerProvider.notifier).setUser(userId: params.userId);
        break;
      case Routes.follows:
        final params = extra! as FollowsRouteParams;
        _read(followsScreenControllerProvider.notifier).setFollows(follows: params.follows);
        break;
      case Routes.profileEdit:
        break;
      case Routes.cacheCreate:
        _read(cacheCreateScreenControllerProvider.notifier).setAttachments([]);
        break;
      case Routes.cMapCreate:
        final params = extra! as CMapCreateRouteParams;
        _read(cMapCreateScreenControllerProvider.notifier).setPage(0);
        _read(cMapCreateScreenControllerProvider.notifier).setMessage(params.message);
        _read(cMapCreateScreenControllerProvider.notifier).setPassword(params.password);
        _read(cMapCreateScreenControllerProvider.notifier).setLink(params.link);
        _read(cMapCreateScreenControllerProvider.notifier).setType(params.cMapType);
        _read(cMapCreateScreenControllerProvider.notifier).setCache(params.cache);
        _read(cMapCreateScreenControllerProvider.notifier).setAttachments([]);
        break;
      case Routes.cacheEdit:
        final params = extra! as CacheEditRouteParams;
        _read(cacheEditScreenControllerProvider.notifier).setCache(params.cache);
        break;
      case Routes.resourceEdit:
        final params = extra! as ResourceEditRouteParams;
        _read(resourceEditScreenControllerProvider.notifier).setCache(params.cache);
        break;
      case Routes.attachmentDetail:
        final params = extra! as AttachmentDetailRouteParams;
        _read(attachmentDetailScreenControllerProvider.notifier).setAttachment(params.attachment);
        break;
      case Routes.cacheImport:
        final params = extra! as CacheImportRouteParams;
        _read(cacheImportScreenControllerProvider.notifier).setCache(params.cache);
        break;
      case Routes.announceCreate:
        final params = extra! as AnnounceCreateRouteParams;
        _read(announceCreateScreenControllerProvider.notifier).setMessage(params.message);
        _read(announceCreateScreenControllerProvider.notifier).setAnnounceType(params.announceType);
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

  Future<void> refresh() async {
    state!.refresh();
    await push(route: Routes.logo);
  }

  Widget screen({required Routes route}) {
    switch (route) {
      case Routes.logo:
        return const LogoScreen();
      case Routes.login:
        return const LoginScreen();
      case Routes.signup:
        return const SignupScreen();
      case Routes.emailCheck:
        return const EmailCheckScreen();
      case Routes.main:
        return const MainScreen();
      case Routes.media:
        return const MediaScreen();
      case Routes.profile:
        return const ProfileScreen();
      case Routes.follows:
        return const FollowsScreen();
      case Routes.profileEdit:
        return const ProfileEditScreen();
      case Routes.cacheCreate:
        return const CacheCreateScreen();
      case Routes.cacheEdit:
        return const CacheEditScreen();
      case Routes.cMapCreate:
        return const CMapCreateScreen();
      case Routes.resourceEdit:
        return const ResourceEditScreen();
      case Routes.attachmentDetail:
        return const AttachmentDetailScreen();
      case Routes.cacheImport:
        return const CacheImportScreen();
      case Routes.announceCreate:
        return const AnnounceCreateScreen();
      case Routes.dialog:
        return const DialogScreen();
    }
  }
}

enum Routes {
  logo,
  login,
  signup,
  emailCheck,
  main,
  profile,
  follows,
  profileEdit,
  media,
  cacheCreate,
  cacheEdit,
  cMapCreate,
  resourceEdit,
  attachmentDetail,
  cacheImport,
  announceCreate,
  dialog,
}

extension RoutesExtension on Routes {
  String get route => '/${toString().split(".")[1]}';
}

class MediaRouteParams {
  final AttachmentType attachmentType;
  final Future<void> Function(File file) onTapFunc;

  const MediaRouteParams({required this.attachmentType, required this.onTapFunc});
}

class EmailCheckRouteParams {
  final String email;
  final String password;
  final Routes from;
  const EmailCheckRouteParams({required this.email, required this.password, required this.from});
}

class ProfileRouteParams {
  final String userId;
  const ProfileRouteParams({required this.userId});
}

class FollowsRouteParams {
  final List<String> follows;
  const FollowsRouteParams({required this.follows});
}

class CacheEditRouteParams {
  final Cache cache;
  CacheEditRouteParams({required this.cache});
}

class CMapCreateRouteParams {
  final String message;
  final String password;
  final String link;
  final CMapType cMapType;
  final Cache? cache;

  const CMapCreateRouteParams({ required this.message, required this.password, required this.link, required this.cMapType, this.cache });
}

class ResourceEditRouteParams {
  final Cache cache;
  ResourceEditRouteParams({required this.cache});
}

class AttachmentDetailRouteParams {
  final Attachment attachment;
  AttachmentDetailRouteParams({required this.attachment});
}

class CacheImportRouteParams {
  final Cache cache;
  final Resource resource;
  CacheImportRouteParams({required this.cache, required this.resource});
}

class AnnounceCreateRouteParams {
  final String message;
  final AnnounceType announceType;
  AnnounceCreateRouteParams({required this.message, required this.announceType});
}