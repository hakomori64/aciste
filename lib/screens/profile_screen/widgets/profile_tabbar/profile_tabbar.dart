import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../profile_screen.dart';

class ProfileTabBar extends HookConsumerWidget {
  const ProfileTabBar({Key? key }) : super(key: key);

  @override
  Widget build(context, ref) {

    return SliverPersistentHeader(
      pinned: true,
      delegate: _StickyTabBarDelegate(
        TabBar(
          labelColor: Theme.of(context).primaryColor,
          tabs: Tabs.values.map((tab) {
            switch (tab) {
              case Tabs.caches:
                return const Tab(
                  child: ImageIcon(AssetImage('assets/images/logo.png'))
                );
              case Tabs.announcements:
                return const Tab(
                  child: FaIcon(FontAwesomeIcons.comment),
                );
            }
          }).toList(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar, { this.backgroundColor = Colors.white });

  final TabBar tabBar;
  final Color backgroundColor;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: backgroundColor, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}