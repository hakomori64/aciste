import 'package:flutter/material.dart';
import './widgets/profile_item_list/profile_item_list.dart';
import './widgets/profile_announce_list/profile_announce_list.dart';

class ProfileTabBarView extends StatelessWidget {
  const ProfileTabBarView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        const ProfileItemList(),
        const ProfileAnnounceList(),
      ].map((widget) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                key: PageStorageKey<String>(widget.toString()),
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
                  ),
                  widget,
                ],
              );
            }
          )
        );
      }).toList(),
    );
  }
}