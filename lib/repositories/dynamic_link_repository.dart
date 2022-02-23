import 'package:aciste/constants.dart';
import 'package:aciste/enums/resource_type.dart';
import 'package:aciste/providers.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseDynamicLinkRepository {
  Future<Uri> createItemImportDynamicLink({required String resourceId, required ResourceType resourceType});
}

final dynamicLinksRepositoryProvider = Provider<DynamicLinksRepository>((ref) => DynamicLinksRepository(ref.read));

class DynamicLinksRepository implements BaseDynamicLinkRepository {
  final Reader _read;

  const DynamicLinksRepository(this._read);

  @override
  Future<Uri> createItemImportDynamicLink({required String resourceId, required ResourceType resourceType}) async {

    final parameters = DynamicLinkParameters(
      uriPrefix: getDynamicLinkUriPrefix(),
      link: Uri.parse(getDynamicLinkUriPrefix() + '/import?resourceId=$resourceId&resourceType=${EnumToString.convertToString(resourceType)}'),
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
}