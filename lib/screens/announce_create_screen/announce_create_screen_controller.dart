import 'package:aciste/models/announcement.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announce_create_screen_controller.freezed.dart';

@freezed
class AnnounceCreateScreenState with _$AnnounceCreateScreenState {
  const factory AnnounceCreateScreenState({
    @Default("") String message,
    @Default(AnnounceType.other) AnnounceType announceType,
  }) = _AnnounceCreateState;
}

final announceCreateScreenControllerProvider = StateNotifierProvider<AnnounceCreateScreenController, AnnounceCreateScreenState>((ref) => AnnounceCreateScreenController());

class AnnounceCreateScreenController extends StateNotifier<AnnounceCreateScreenState> {
  AnnounceCreateScreenController() : super(const AnnounceCreateScreenState());

  void setMessage(String message) {
    state = state.copyWith(message: message);
  }

  void setAnnounceType(AnnounceType announceType) {
    state = state.copyWith(announceType: announceType);
  }
}