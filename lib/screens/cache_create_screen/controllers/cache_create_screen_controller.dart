import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/attachment_data.dart';
import 'package:aciste/repositories/attachment_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

part 'cache_create_screen_controller.freezed.dart';

@freezed
class CacheCreateScreenState with _$CacheCreateScreenState {
  const factory CacheCreateScreenState({
    @Default("") String title,
    @Default("") String body,
    @Default([]) List<AsyncValue<Attachment>> attachments,
  }) = _CacheCreateScreenState;
}

final cacheCreateScreenControllerProvider = StateNotifierProvider<CacheCreateScreenController, CacheCreateScreenState>((ref) => CacheCreateScreenController(ref.read));

class CacheCreateScreenController extends StateNotifier<CacheCreateScreenState> {
  CacheCreateScreenController(this._read) : super(const CacheCreateScreenState());

  final Reader _read;

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setBody(String body) {
    state = state.copyWith(body: body);
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