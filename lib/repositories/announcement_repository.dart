import 'package:aciste/constants.dart';
import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/announcement.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:tuple/tuple.dart';

abstract class BaseAnnouncementRepository {
  Future<Tuple3<List<Announcement>, DocumentSnapshot?, DocumentSnapshot?>> retrieveAnnouncementsPage({required String userId, int pageSize, DocumentSnapshot? startAfterDoc });
  Future<Tuple3<List<Announcement>, DocumentSnapshot?, DocumentSnapshot?>> retrieveAnnouncementsBeforePage({required String userId, int pageSize, DocumentSnapshot? endBeforeDoc });
  Future<void> notifyToFollowers({required String userId, required String message, required AnnounceType announceType});
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
  Future<Tuple3<List<Announcement>, DocumentSnapshot?, DocumentSnapshot?>> retrieveAnnouncementsPage({required String userId, int pageSize = defaultPageSize, DocumentSnapshot? startAfterDoc }) async {
    try {
      final user = await _read(userRepositoryProvider).getUser(userId: userId);
      if (startAfterDoc != null) {
        final snapshot = await _read(firebaseFirestoreProvider)
          .announcementsRef()
          .where('userId', whereIn: [user!.id!, ...user.following])
          .orderBy('createdAt', descending: true)
          .startAfterDocument(startAfterDoc)
          .limit(pageSize)
          .get();

        final announcements = await Future.wait(snapshot.docs.map((doc) => _getAnnouncement(doc: doc)).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(announcements, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(announcements, null, null);
        }
      } else {
        final snapshot = await _read(firebaseFirestoreProvider)
          .announcementsRef()
          .where('userId', whereIn: [user!.id!, ...user.following])
          .orderBy('createdAt', descending: true)
          .limit(pageSize)
          .get();

        final announcements = await Future.wait(snapshot.docs.map((doc) => _getAnnouncement(doc: doc)).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(announcements, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(announcements, null, null);
        }
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Tuple3<List<Announcement>, DocumentSnapshot?, DocumentSnapshot?>> retrieveAnnouncementsBeforePage({required String userId, int pageSize = defaultPageSize, DocumentSnapshot? endBeforeDoc }) async {
    try {
      final user = await _read(userRepositoryProvider).getUser(userId: userId);
      if (endBeforeDoc != null) {
        final snapshot = await _read(firebaseFirestoreProvider)
          .announcementsRef()
          .where('userId', whereIn: [user!.id!, ...user.following])
          .orderBy('createdAt', descending: true)
          .endBeforeDocument(endBeforeDoc)
          .limit(pageSize)
          .get();

        final announcements = await Future.wait(snapshot.docs.map((doc) => _getAnnouncement(doc: doc)).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(announcements, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(announcements, null, null);
        }
      } else {
        final snapshot = await _read(firebaseFirestoreProvider)
          .announcementsRef()
          .where('userId', whereIn: [user!.id!, ...user.following])
          .orderBy('createdAt', descending: true)
          .limit(pageSize)
          .get();

        final announcements = await Future.wait(snapshot.docs.map((doc) => _getAnnouncement(doc: doc)).toList());

        if (snapshot.docs.isNotEmpty) {
          return Tuple3(announcements, snapshot.docs.first, snapshot.docs.last);
        } else {
          return Tuple3(announcements, null, null);
        }
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> notifyToFollowers({required userId, required message, required announceType}) async {
    final result = await _read(firebaseFunctionsProvider)
      .httpsCallable('notifyToFollowers')
      .call({
        'userId': userId,
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