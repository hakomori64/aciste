// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {String? id,
      String name = "",
      String description = "",
      User? createdBy,
      String? text,
      @TimestampDateTimeConverter() DateTime? createdAt}) {
    return _Message(
      id: id,
      name: name,
      description: description,
      createdBy: createdBy,
      text: text,
      createdAt: createdAt,
    );
  }

  Message fromJson(Map<String, Object?> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  User? get createdBy => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String description,
      User? createdBy,
      String? text,
      @TimestampDateTimeConverter() DateTime? createdAt});

  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value));
    });
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String description,
      User? createdBy,
      String? text,
      @TimestampDateTimeConverter() DateTime? createdAt});

  @override
  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Message(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message extends _Message {
  const _$_Message(
      {this.id,
      this.name = "",
      this.description = "",
      this.createdBy,
      this.text,
      @TimestampDateTimeConverter() this.createdAt})
      : super._();

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String? id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String description;
  @override
  final User? createdBy;
  @override
  final String? text;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Message(id: $id, name: $name, description: $description, createdBy: $createdBy, text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(this);
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {String? id,
      String name,
      String description,
      User? createdBy,
      String? text,
      @TimestampDateTimeConverter() DateTime? createdAt}) = _$_Message;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  User? get createdBy;
  @override
  String? get text;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
