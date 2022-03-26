import 'package:aciste/models/attachment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'attachment_detail_screen_controller.freezed.dart';

@freezed
class AttachmentDetailScreenState with _$AttachmentDetailScreenState {
  const factory AttachmentDetailScreenState({
    Attachment? attachment,
  }) = _AttachmentDetailScreenState;
}

final attachmentDetailScreenControllerProvider = StateNotifierProvider<AttachmentDetailScreenController, AttachmentDetailScreenState>((ref) => AttachmentDetailScreenController());

class AttachmentDetailScreenController extends StateNotifier<AttachmentDetailScreenState> {
  AttachmentDetailScreenController() : super(const AttachmentDetailScreenState());

  void setAttachment(Attachment attachment) {
    state = state.copyWith(attachment: attachment);
  }
}