import 'package:aciste/models/user.dart';

abstract class FreezedClass<T> {
  const FreezedClass();
  T get copyWith;
  Map<String, dynamic> toJson();
}

abstract class Resource extends FreezedClass {
  String? get id;
  String? get name;
  String? get description;
  User? get createdBy;
  DateTime? get createdAt;
  int get viewCount;

  factory Resource.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
abstract class CreateResourceParams {}