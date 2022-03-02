import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseAnnouncementRepository {
  Future<Stream<List<Announcement>>> streamAnnouncement({required String userId});
  Future<void> notifyToFollowers({required String userId, required AnnounceType announceType});
}

final announcementRepositoryProvider = Provider<AnnouncementRepository>((ref) => AnnouncementRepository(ref.read));

class AnnouncementRepository implements BaseAnnouncementRepository {
  final Reader _read;
  const AnnouncementRepository(this._read);

  Future<Announcement> _getAnnouncement({
    required DocumentSnapshot<Map<String, dynamic>> doc,
  }) async {
    final announcement = Announcement.fromDocumentSnapshot(doc);
    final user = await _read(userRepositoryProvider).getUser(userId: doc.data()!['userId']);
    final announceType = EnumToString.fromString(AnnounceType.values, doc.data()!['announceEvent']);
    return announcement.copyWith(
      user: user,
      announceType: announceType,
    );
  }

  @override
  Future<Stream<List<Announcement>>> streamAnnouncement({required String userId}) async {
    try {
      return _read(firebaseFirestoreProvider)
        .userAnnouncementsRef(userId)
        .where('createdAt', isGreaterThan: Timestamp.fromDate(DateTime.now().add(const Duration(days: -30))))
        .orderBy('createdAt', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
          return Future.wait(snapshot.docs.map((doc) => _getAnnouncement(
            doc: doc,
          )));
        });
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> notifyToFollowers({required userId, required announceType}) async {
    final result = await _read(firebaseFunctionsProvider)
      .httpsCallable('notifyToFollowers')
      .call({
        'userId': userId,
        'announcementEvent': announceType.name,
      });
    if (result.data['status']) {
      return;
    } else {
      throw const CustomException(message: '通知に失敗しました');
    }
  }
}