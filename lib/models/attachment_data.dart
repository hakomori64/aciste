abstract class FreezedClass<T> {
  const FreezedClass();
  T get copyWith;
  Map<String, dynamic> toJson();
}

abstract class AttachmentData extends FreezedClass {
  String? get id;
  DateTime? get createdAt;

  factory AttachmentData.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}

abstract class CreateAttachmentDataParams {}