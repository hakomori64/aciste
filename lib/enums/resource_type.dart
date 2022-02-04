import 'package:json_annotation/json_annotation.dart';

enum ResourceType {
  @JsonValue("photo") photo,
  @JsonValue("none") none
}