import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/models/user.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

abstract class BasePhotoRepository {
  Future<Photo> retrievePhoto({required String userId, required String photoId});
  Future<Photo> createPhoto({required String userId, required CreatePhotoParams createPhotoParams});
}

final photoRepositoryProvider = Provider<PhotoRepository>((ref) => PhotoRepository(ref.read));

class PhotoRepository implements BasePhotoRepository {
  final Reader _read;

  const PhotoRepository(this._read);

  Future<Photo> _fillUser({required Photo photo, required String userId}) async {
    final user = await _read(userRepositoryProvider).getUser(userId: userId);
    return photo.copyWith(createdBy: user);
  }

  @override
  Future<Photo> retrievePhoto({required String userId, required String photoId}) async {
    try {
      final doc = await _read(firebaseFirestoreProvider)
        .photosRef()
        .doc(photoId)
        .get();
      
      final photo = Photo.fromDocumentSnapshot(doc);
      return _fillUser(photo: photo, userId: userId);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Photo> createPhoto({required String userId, required CreatePhotoParams createPhotoParams}) async {
    final file = createPhotoParams.file;

    final mimeType = lookupMimeType(file.path);
    if (mimeType != 'image/jpeg' && mimeType != 'image/png') {
      throw const CustomException(message: 'Unrecognized type');
    }

    final extension = extensionFromMime(mimeType!);
    const uuid = Uuid();
    final id = uuid.v4();
    final filename = '$id.$extension';
    final imageRef = _read(firebaseStorageProvider).ref("photos")
      .child(filename);
    final snapshot = await imageRef.putFile(file);
    final imageUrl = await snapshot.ref.getDownloadURL();
    final photo = Photo.empty().copyWith(
      createdBy: User.empty().copyWith(id: userId),
      url: imageUrl,
    );

    final docRef = await _read(firebaseFirestoreProvider)
      .photosRef()
      .add(photo.toDocument());
    
    return _fillUser(
      photo: photo.copyWith(id: docRef.id),
      userId: userId);
  }
}