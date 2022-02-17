import 'package:aciste/models/user.dart';

abstract class Resource {
  final String? id;
  final User? createdBy;
  final DateTime? createdAt;
  const Resource({this.id, this.createdAt, this.createdBy});

  factory Resource.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
abstract class CreateResourceParams {}