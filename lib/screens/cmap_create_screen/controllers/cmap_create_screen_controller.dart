import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/enums/cmap_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/attachment_data.dart';
import 'package:aciste/models/item.dart';
import 'package:aciste/repositories/attachment_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

part 'cmap_create_screen_controller.freezed.dart';

@freezed
class CMapCreateScreenState with _$CMapCreateScreenState {
  const factory CMapCreateScreenState({
    @Default(0) int page,
    @Default('') String message,
    @Default('') String password,
    @Default('') String link,
    @Default(CMapType.password) type,
    Item? item,
    @Default([]) List<AsyncValue<Attachment>> attachments,
  }) = _CMapCreateScreenState;
}

final cMapCreateScreenControllerProvider = StateNotifierProvider<CMapCreateScreenController, CMapCreateScreenState>((ref) => CMapCreateScreenController(ref.read));

class CMapCreateScreenController extends StateNotifier<CMapCreateScreenState> {
  final Reader _read;

  CMapCreateScreenController(this._read) : super(const CMapCreateScreenState());

  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  void setMessage(String message) {
    state = state.copyWith(message: message);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setLink(String link) {
    state = state.copyWith(link: link);
  }

  void setType(CMapType mapType) {
    state = state.copyWith(type: mapType);
  }

  void setItem(Item? item) {
    state = state.copyWith(
      item: item
    );
  }

  void setAttachments(List<Attachment> attachments) {
    state = state.copyWith(
      attachments: attachments.map((attachment) => AsyncValue.data(attachment)).toList()
    );
  }

  Future<void> addAttachment({
    required AttachmentType attachmentType,
    required CreateAttachmentDataParams data,
  }) async {
    final oldAttachments = state.attachments;
    state = state.copyWith(
      attachments: [...state.attachments, const AsyncValue.loading()],
    );
    final attachment = await _read(attachmentRepositoryProvider)
      .craftAttachment(attachmentType: attachmentType, createAttachmentDataParams: data);

    final uid = const Uuid().v4();

    state = state.copyWith(
      attachments: [...oldAttachments, AsyncValue.data(attachment.copyWith(id: uid))]
    );
  }

  Future<void> updateAttachment({
    required String oldAttachmentId,
    required AttachmentType attachmentType,
    required CreateAttachmentDataParams data,
  }) async {
    final newAttachment = await _read(attachmentRepositoryProvider)
      .craftAttachment(attachmentType: attachmentType, createAttachmentDataParams: data);

    final uid = const Uuid().v4();

    state = state.copyWith(
      attachments: [
        for (final attachment in state.attachments)
          if (attachment.asData?.value.id == oldAttachmentId) AsyncValue.data(newAttachment.copyWith(id: uid)) else attachment
      ]
    );
  }

  Future<void> deleteAttachment({
    required String attachmentId,
  }) async {
    state = state.copyWith(
      attachments: state.attachments..removeWhere((attachment) => attachment.asData?.value.id == attachmentId)
    );
  }
}