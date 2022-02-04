import 'package:aciste/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required String photoUrl,
  }) = _User;

  factory User.empty() => const User(
    email: "",
    displayName: "",
    photoUrl: defaultUserPhotoUrl,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return User.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
