import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseAnnouncementRepository {}

class ProfileAnnouncementRepositoryParams {
  final String userId;
  const ProfileAnnouncementRepositoryParams({ required this.userId });
}

final profileAnnouncementRepositoryProvider = Provider.family<AnnouncementRepository, ProfileAnnouncementRepositoryParams>((ref, params) => AnnouncementRepository(ref.read, params.userId));

class AnnouncementRepository extends PagingRepository<Announcement> implements BaseAnnouncementRepository {
  final Reader _read;
  final String _userId;
  AnnouncementRepository(this._read, this._userId);

  @override
  Future<void> initState() async {
    baseQuery = _read(firebaseFirestoreProvider)
      .userAnnouncementsRef(_userId)
      .orderBy('createdAt', descending: true);

    converter = ({
      required DocumentSnapshot<Map<String, dynamic>> doc,
    }) async {
      final announcement = Announcement.fromDocumentSnapshot(doc);
      final user = await _read(userRepositoryProvider).getUser(userId: doc.data()!['userId']);
      final announceType = EnumToString.fromString(AnnounceType.values, doc.data()!['announceEvent']);
      return announcement.copyWith(
        user: user,
        announceType: announceType,
      );
    };

    await super.initState();
  }
}