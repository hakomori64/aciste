import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

abstract class BasePhotoRepository {
  Future<Photo> retrievePhoto({required String photoId});
  Future<Photo> createPhoto({required CreatePhotoParams createPhotoParams});
  Future<Photo> updatePhoto({required Photo photo});
}

final photoRepositoryProvider = Provider<PhotoRepository>((ref) => PhotoRepository(ref.read));

class PhotoRepository implements BasePhotoRepository {
  final Reader _read;

  const PhotoRepository(this._read);

  @override
  Future<Photo> retrievePhoto({required String photoId}) async {
    try {
      final doc = await _read(firebaseFirestoreProvider)
        .photosRef()
        .doc(photoId)
        .get();
      
      return Photo.fromDocumentSnapshot(doc);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Photo> createPhoto({required CreatePhotoParams createPhotoParams}) async {
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
      url: imageUrl,
    );

    final docRef = await _read(firebaseFirestoreProvider)
      .photosRef()
      .add(photo.toDocument());
    
    return photo.copyWith(id: docRef.id);
  }

  @override
  Future<Photo> updatePhoto({required photo}) async {
    await _read(firebaseFirestoreProvider)
      .photosRef()
      .doc(photo.id!)
      .update(photo.toDocument());
    
    return photo;
  }
}