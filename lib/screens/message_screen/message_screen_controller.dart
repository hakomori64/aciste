import 'package:aciste/enums/resource_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'message_screen_controller.freezed.dart';

@freezed
class MessageScreenState with _$MessageScreenState {
  const factory MessageScreenState({
    ResourceType? resourceType,
    Future<void> Function(String text)? onTapFunc,
  }) = _MessageScreenState;
}

final messageScreenControllerProvider = StateNotifierProvider<MessageScreenController, MessageScreenState>((ref) => MessageScreenController(ref.read));

class MessageScreenController extends StateNotifier<MessageScreenState> {
  final Reader _read;
  MessageScreenController(this._read) : super(const MessageScreenState());

  void setResourceType({required ResourceType? resourceType}) {
    state = state.copyWith(
      resourceType: resourceType
    );
  }

  void setOnTapFunc({required Future<void> Function(String) onTapFunc}) {
    state = state.copyWith(
      onTapFunc: onTapFunc,
    );
  }
}