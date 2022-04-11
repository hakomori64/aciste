import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> resourcesRef() =>
    collection('resources');

  CollectionReference<Map<String, dynamic>> resourceAttachmentsRef(String resourceId) =>
    collection('resources')
    .doc(resourceId)
    .collection('attachments');

  CollectionReference<Map<String, dynamic>> photosRef() =>
    collection('photos');

  CollectionReference<Map<String, dynamic>> videosRef() =>
    collection('videos');


  Query<Map<String, dynamic>> announcementsRef() =>
    collectionGroup('announcements');

  CollectionReference<Map<String, dynamic>> userAnnouncementsRef(String userId) =>
    collection('users').doc(userId).collection('announcements');

  Query<Map<String, dynamic>> cMapsRef() =>
    collectionGroup('cmaps');

  CollectionReference<Map<String, dynamic>> userCMapsRef(String userId) =>
    collection('users').doc(userId).collection('cmaps');

  CollectionReference<Map<String, dynamic>> usersRef() =>
    collection('users');

  DocumentReference<Map<String, dynamic>> userRef(String userId) =>
    collection('users').doc(userId);

  CollectionReference<Map<String, dynamic>> userCachesRef(String userId) =>
    collection('users').doc(userId).collection('caches');

}