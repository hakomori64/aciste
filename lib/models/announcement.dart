import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';
part 'announcement.g.dart';

enum AnnounceType {
  itemCreate,
  other,
}

extension AnnouceTypeExtension on AnnounceType {
  String get name => toString().split('.')[1];
}


@freezed
abstract class Announcement implements _$Announcement {
  const Announcement._();

  const factory Announcement({
    String? id,
    required String message,
    User? user,
    AnnounceType? announceType,
    @TimestampDateTimeConverter() DateTime? createdAt,
  }) = _Announcement;

  factory Announcement.empty() => Announcement(
    message: "",
    createdAt: DateTime.now(),
  );

  factory Announcement.fromJson(Map<String, dynamic> json) => _$AnnouncementFromJson(json);

  factory Announcement.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Announcement.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    final data = toJson()
      ..remove('id')
      ..remove('user')
      ..remove('announceType');
    data['userId'] = user?.id ?? '';
    data['announceEvent'] = announceType!.name;
    return data;
  }
}