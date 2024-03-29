import 'package:aciste/constants.dart';
import 'package:aciste/providers.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseDynamicLinkRepository {
  Future<Uri> createCacheImportDynamicLink({required String resourceId});
  Future<Uri> createProfileDynamicLink({required String userId});
}

final dynamicLinksRepositoryProvider = Provider<DynamicLinksRepository>((ref) => DynamicLinksRepository(ref.read));

class DynamicLinksRepository implements BaseDynamicLinkRepository {
  final Reader _read;

  const DynamicLinksRepository(this._read);

  @override
  Future<Uri> createCacheImportDynamicLink({required String resourceId}) async {

    final parameters = DynamicLinkParameters(
      uriPrefix: getDynamicLinkUriPrefix(),
      link: Uri.parse(getDynamicLinkUriPrefix() + '/import?resourceId=$resourceId'),
      androidParameters: AndroidParameters(
        packageName: getPackageName(),
        minimumVersion: 1,
        fallbackUrl: Uri.parse(getPlayStoreUrl()),
      ),
      iosParameters: IOSParameters(
        bundleId: getPackageName(),
        minimumVersion: '1',
        appStoreId: getAppStoreId(),
        fallbackUrl: Uri.parse(getAppStoreUrl()),
      ),
    );
    final dynamicUrl = await _read(firebaseDynamicLinksProvider).buildShortLink(parameters);
    return dynamicUrl.shortUrl;
  }

  @override
  Future<Uri> createProfileDynamicLink({required String userId}) async {
    final parameters = DynamicLinkParameters(
      uriPrefix: getDynamicLinkUriPrefix(),
      link: Uri.parse(getDynamicLinkUriPrefix() + '/profile?userId=$userId'),
      androidParameters: AndroidParameters(
        packageName: getPackageName(),
        minimumVersion: 1,
        fallbackUrl: Uri.parse(getPlayStoreUrl()),
      ),
      iosParameters: IOSParameters(
        bundleId: getPackageName(),
        minimumVersion: '1',
        appStoreId: getAppStoreId(),
        fallbackUrl: Uri.parse(getAppStoreUrl())
      )
    );
    final dynamicUrl = await _read(firebaseDynamicLinksProvider).buildShortLink(parameters);
    return dynamicUrl.shortUrl;
  }
}