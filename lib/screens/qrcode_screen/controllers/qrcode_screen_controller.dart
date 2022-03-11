import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'qrcode_screen_controller.freezed.dart';

@freezed
class QRCodeScreenState with _$QRCodeScreenState {
  const factory QRCodeScreenState({
    String? url,
  }) = _QRCodeScreenState;
}

final qrCodeScreenControllerProvider = StateNotifierProvider<QRCodeScreenController, QRCodeScreenState>((ref) {
  return QRCodeScreenController();
});

class QRCodeScreenController extends StateNotifier<QRCodeScreenState> {

  QRCodeScreenController(
  ) : super(const QRCodeScreenState());

  void setUrl(String? url) {
    state = state.copyWith(url: url);
  }
}