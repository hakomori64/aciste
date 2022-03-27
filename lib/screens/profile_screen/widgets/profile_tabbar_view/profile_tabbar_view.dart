import 'package:flutter/material.dart';
import './widgets/profile_item_list/profile_item_list.dart';
import './widgets/profile_announce_list/profile_announce_list.dart';

class ProfileTabBarView extends StatelessWidget {
  const ProfileTabBarView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        ProfileItemList(),
        ProfileAnnounceList(),
      ],
    );
  }
}