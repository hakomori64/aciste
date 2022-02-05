import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/screens/item_create_screen.dart';
import 'package:aciste/screens/home_screen.dart';
import 'package:aciste/screens/item_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/item.dart';


final routerProvider = Provider<GoRouter>((ref) => GoRouter(
  initialLocation: Routes.home.route,
  routes: [
    GoRoute(
      path: Routes.home.route,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.itemCreate.route,
      builder: (context, state) => ItemCreateScreen(resourceType: state.extra! as ResourceType),
    ),
    GoRoute(
      path: Routes.itemDetail.route,
      builder: (context, state) => ItemDetailScreen(item: state.extra! as Item),
    )
  ]
));

enum Routes {
  home,
  itemCreate,
  itemDetail,
}

extension RoutesExtension on Routes {
  String get route => '/${toString()}';
}