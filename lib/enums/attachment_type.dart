import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

enum AttachmentType {
  @JsonValue("photo") photo,
  @JsonValue("none") none,
}