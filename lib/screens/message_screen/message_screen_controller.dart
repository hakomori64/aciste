import 'package:aciste/enums/resource_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'message_screen_controller.freezed.dart';

@freezed
class MessageScreenState with _$MessageScreenState {
  const factory MessageScreenState({
    ResourceType? resourceType,
    @Default("") String text,
    Future<void> Function(String text)? onTapFunc,
  }) = _MessageScreenState;
}

final messageScreenControllerProvider = StateNotifierProvider<MessageScreenController, MessageScreenState>((_) => MessageScreenController());

class MessageScreenController extends StateNotifier<MessageScreenState> {
  MessageScreenController() : super(const MessageScreenState());

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

  void setText(String text) {
    state = state.copyWith(
      text: text
    );
  }
}