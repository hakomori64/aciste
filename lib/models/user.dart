import 'package:aciste/constants.dart';
import 'package:aciste/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User implements _$User {
  const User._();

  const factory User({
    String? id,
    required String email,
    required String displayName,
    required String bio,
    required String photoUrl,
    required String backgroundImageUrl,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
    @Default([]) List<String> following,
    @Default([]) List<String> followedBy,
    @Default(false) notifyToFollowersDefault,
  }) = _User;

  factory User.empty() => User(
    email: "",
    displayName: "",
    bio: "",
    photoUrl: defaultUserPhotoUrl,
    backgroundImageUrl: defaultUserBackgroundImageUrl,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    following: [],
    followedBy: []
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return User.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
