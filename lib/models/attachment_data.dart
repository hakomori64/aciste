import 'package:aciste/base.dart';

abstract class AttachmentData extends FreezedClass {
  String? get id;
  DateTime? get createdAt;

  factory AttachmentData.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}

abstract class CreateAttachmentDataParams {}