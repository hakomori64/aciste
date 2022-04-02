abstract class FreezedClass<T> {
  const FreezedClass();
  T get copyWith;
  Map<String, dynamic> toJson();
}