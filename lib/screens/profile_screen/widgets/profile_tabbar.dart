import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_announce_list.dart';
import 'package:aciste/screens/profile_screen/widgets/profile_tabbar/widgets/profile_item_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Tabs {
  items,
  announcements,
}

class ProfileTabBar extends HookConsumerWidget {
  const ProfileTabBar({Key? key }) : super(key: key);

  @override
  Widget build(context, ref) {

    return DefaultTabController(
      length: Tabs.values.length,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              tabs: Tabs.values.map((tab) {
                switch (tab) {
                  case Tabs.items:
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 50,
            child: const TabBarView(
              children: [
                SingleChildScrollView(
                  child: ProfileItemList(),
                ),
                SingleChildScrollView(
                  child: ProfileAnnounceList(),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}