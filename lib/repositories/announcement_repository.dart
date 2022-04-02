import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:aciste/utils/paging/repository.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseAnnouncementRepository {
  Future<void> notifyToFollowers({required String message, required AnnounceType announceType});
}

class AnnouncementRepositoryParams {
  final String userId;
  const AnnouncementRepositoryParams({ required this.userId });
}

final announcementRepositoryProvider = Provider.family<AnnouncementRepository, AnnouncementRepositoryParams>((ref, params) => AnnouncementRepository(ref.read, params.userId));

class AnnouncementRepository extends PagingRepository<Announcement> implements BaseAnnouncementRepository {
  final Reader _read;
  final String _userId;
  AnnouncementRepository(this._read, this._userId);

  @override
  Future<void> initState() async {
    final user = await _read(userRepositoryProvider).getUser(userId: _userId);
    baseQuery = _read(firebaseFirestoreProvider)
      .announcementsRef()
      .where('userId', whereIn: [user!.id!, ...user.following])
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

  @override
  Future<void> notifyToFollowers({required message, required announceType}) async {
    final result = await _read(firebaseFunctionsProvider)
      .httpsCallable('notifyToFollowers')
      .call({
        'userId': _userId,
        'message': message,
        'announcementEvent': announceType.name,
      });
    if (result.data['status']) {
      return;
    } else {
      throw const CustomException(message: '通知に失敗しました');
    }
  }
}