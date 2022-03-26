import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/attachment_data.dart';
import 'package:aciste/models/photo.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/photo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseAttachmentRepository {
  Future<List<Attachment>> retrieveResourceAttachments({
    required String resourceId,
  });
  Future<Attachment> craftAttachment({
    required AttachmentType attachmentType,
    required CreateAttachmentDataParams createAttachmentDataParams,
  });
  Future<Attachment> saveAttachmentToResource({
    required String resourceId,
    required Attachment attachment
  });
  Future<Attachment> createResourceAttachment({
    required String resourceId,
    required AttachmentType attachmentType,
    required CreateAttachmentDataParams createAttachmentDataParams,
  });
}

final attachmentRepositoryProvider = Provider<AttachmentRepository>((ref) => AttachmentRepository(ref.read));

class AttachmentRepository implements BaseAttachmentRepository {
  final Reader _read;

  const AttachmentRepository(this._read);

  Future<Attachment> _getAttachment({
    required DocumentSnapshot<Map<String, dynamic>> doc,
  }) async {
    final attachment = Attachment.fromDocumentSnapshot(doc);
    final attachmentType = attachment.type;
    final dataId = doc.data()!['dataId'];

    final data = await (() async {
      switch (attachmentType) {
        case AttachmentType.photo:
          final doc = await _read(firebaseFirestoreProvider) 
            .photosRef()
            .doc(dataId)
            .get();
          return Photo.fromDocumentSnapshot(doc);
        case AttachmentType.none:
          throw const CustomException(message: 'unrecognized attachment type');
      }
    })();

    return attachment.copyWith(data: data);
  }

  @override
  Future<List<Attachment>> retrieveResourceAttachments({ required String resourceId }) async {
    final snapshot = await _read(firebaseFirestoreProvider)
      .resourceAttachmentsRef(resourceId)
      .orderBy('createdAt', descending: true)
      .get();
    
    return Future.wait(snapshot.docs.map((doc) => _getAttachment(
      doc: doc
    )));
  }

  @override
  Future<Attachment> craftAttachment({
    required AttachmentType attachmentType,
    required CreateAttachmentDataParams createAttachmentDataParams
  }) async {
    switch (attachmentType) {
      case AttachmentType.photo:
        final params = createAttachmentDataParams as CreatePhotoParams;
        final photo = await _read(photoRepositoryProvider).createPhoto(createPhotoParams: params);
        return Attachment(
          type: AttachmentType.photo,
          data: photo,
        );
      case AttachmentType.none:
        throw const CustomException(message: 'unrecognized attachment type');
    }
  }

  @override
  Future<Attachment> saveAttachmentToResource({
    required String resourceId,
    required Attachment attachment,
  }) async {
    final docRef = await _read(firebaseFirestoreProvider)
      .resourceAttachmentsRef(resourceId)
      .add(attachment.toDocument());

    return attachment.copyWith(id: docRef.id);
  }

  @override
  Future<Attachment> createResourceAttachment({
    required String resourceId,
    required AttachmentType attachmentType,
    required CreateAttachmentDataParams createAttachmentDataParams, 
  }) async {
    final attachment = await craftAttachment(
      attachmentType: attachmentType,
      createAttachmentDataParams: createAttachmentDataParams
    );
    return saveAttachmentToResource(resourceId: resourceId, attachment: attachment);
  }
}
