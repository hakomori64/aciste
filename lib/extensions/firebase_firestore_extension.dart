import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> resourcesRef() =>
    collection('resources');
  
  CollectionReference<Map<String, dynamic>> photosRef() =>
    collection('photos');

  CollectionReference<Map<String, dynamic>> videosRef() =>
    collection('videos');

  CollectionReference<Map<String, dynamic>> messagesRef() =>
    collection('messages');
  
  CollectionReference<Map<String, dynamic>> announcementsRef() =>
    collection('announcements');

  CollectionReference<Map<String, dynamic>> usersRef() =>
    collection('users');
    
  DocumentReference<Map<String, dynamic>> userRef(String userId) =>
    collection('users').doc(userId);

  CollectionReference<Map<String, dynamic>> userItemsRef(String userId) =>
    collection('users').doc(userId).collection('items');
  
}