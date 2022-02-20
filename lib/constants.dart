import 'package:aciste/custom_exception.dart';

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