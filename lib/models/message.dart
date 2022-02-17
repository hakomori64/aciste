import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/resource.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message extends Resource implements _$Message {
  const Message._();

  const factory Message({
    String? id,
    User? createdBy,
    String? text,
    @TimestampDateTimeConverter() DateTime? createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  factory Message.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Message.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('createdBy');
    
    data['createdById'] = createdBy?.id ?? '';

    return data;
  }
}