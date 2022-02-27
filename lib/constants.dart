import 'package:aciste/custom_exception.dart';
import 'package:flutter/material.dart';

const defaultUserPhotoUrl = 'https://storage.googleapis.com/aciste-100b9.appspot.com/default_user.png';
const defaultUserBackgroundImageUrl = 'https://storage.googleapis.com/aciste-100b9.appspot.com/default_background.png';
const flavor = String.fromEnvironment('FLAVOR');

String getDynamicLinkUriPrefix() {

  switch (flavor) {
    case 'dev':
      return 'https://hakomori.page.link';
    case 'prod':
      return 'https://aciste.page.link';
    default:
      throw const CustomException(message: 'FLAVORがおかしいです');
  }
}

String getPackageName() {

  switch (flavor) {
    case 'dev':
      return 'com.hakomori.aciste.dev';
    case 'prod':
      return 'com.hakomori.aciste';
    default:
      throw const CustomException(message: 'FLAVORがおかしいです');
  }
}

String getPlayStoreUrl() {
  //TODO(hakomori64): replace url
  return 'https://google.com';
}

String getAppStoreUrl() {
  //TODO(hakomori64): replace url
  return 'https://google.com';
}

String getAppStoreId() {
  return 'com.hakomori.aciste';
}

class AppColor {
  static const MaterialColor gold = MaterialColor(0xffd4af37, {
    100: Color(0xffd4af37),
    200: Color(0xffd4af37),
    300: Color(0xffd4af37),
    400: Color(0xffd4af37),
  });

  static const MaterialColor silver = MaterialColor(0xffc0c0c0, {
    100: Color(0xffc0c0c0),
    200: Color(0xffc0c0c0),
    300: Color(0xffc0c0c0),
    400: Color(0xffc0c0c0),
  });

  static const MaterialColor blond = MaterialColor(0xfffaf0be, {
    100: Color(0xfffaf0be),
    200: Color(0xfffaf0be),
    300: Color(0xfffaf0be),
    400: Color(0xfffaf0be),
  });
}

Color getRankColor(int rank) {
  switch (rank) {
    case 1:
      return AppColor.gold;
    case 2:
      return AppColor.silver;
    case 3:
      return AppColor.blond;
  }
  return Colors.transparent;
}