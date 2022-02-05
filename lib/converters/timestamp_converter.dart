import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:cloud_firestore/cloud_firestore.dart';

class TimestampDateTimeConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampDateTimeConverter();
  @override
  DateTime? fromJson(Timestamp? stamp) => stamp?.toDate();
  @override
  Timestamp? toJson(DateTime? time) {
    if (time == null) {
      return null;
    }
    return Timestamp.fromDate(time);
  }
}
