import 'package:aciste/enums/attachment_type.dart';
import 'package:aciste/models/attachment.dart';
import 'package:aciste/models/attachment_data.dart';
import 'package:aciste/models/cache.dart';
import 'package:aciste/repositories/attachment_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

part 'resource_edit_screen_controller.freezed.dart';

@freezed
class ResourceEditScreenState with _$ResourceEditScreenState {
  const factory ResourceEditScreenState({
    required Cache cache,
    required String title,
    required String body,
    @Default([]) List<AsyncValue<Attachment>> attachments,
  }) = _ResourceEditScreenState;
}

final resourceEditScreenControllerProvider = StateNotifierProvider<ResourceEditScreenController, ResourceEditScreenState>((ref) => ResourceEditScreenController(ref.read));

class ResourceEditScreenController extends StateNotifier<ResourceEditScreenState> {
  final Reader _read;

  ResourceEditScreenController(this._read) : super(ResourceEditScreenState(
    cache: Cache.empty(),
    title: '',
    body: '',
  ));

  void setCache(Cache cache) {
    state = state.copyWith(
      cache: cache,
      title: cache.resource!.title,
      body: cache.resource!.body,
      attachments: (cache.resource?.attachments ?? []).map((attachment) => AsyncValue.data(attachment)).toList()
    );
  }

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