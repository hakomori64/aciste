import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

enum ResourceType {
  @JsonValue("photo") photo,
  @JsonValue("message") message,
  @JsonValue("none") none
}