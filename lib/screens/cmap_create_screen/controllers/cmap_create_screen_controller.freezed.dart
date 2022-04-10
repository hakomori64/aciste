// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cmap_create_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CMapCreateScreenStateTearOff {
  const _$CMapCreateScreenStateTearOff();

  _CMapCreateScreenState call(
      {int page = 0,
      String message = '',
      String password = '',
      String link = '',
      dynamic type = CMapType.password,
      Item? item,
      List<AsyncValue<Attachment>> attachments = const []}) {
    return _CMapCreateScreenState(
      page: page,
      message: message,
      password: password,
      link: link,
      type: type,
      item: item,
      attachments: attachments,
    );
  }
}

/// @nodoc
const $CMapCreateScreenState = _$CMapCreateScreenStateTearOff();

/// @nodoc
mixin _$CMapCreateScreenState {
  int get page => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;
  Item? get item => throw _privateConstructorUsedError;
  List<AsyncValue<Attachment>> get attachments =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CMapCreateScreenStateCopyWith<CMapCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CMapCreateScreenStateCopyWith<$Res> {
  factory $CMapCreateScreenStateCopyWith(CMapCreateScreenState value,
          $Res Function(CMapCreateScreenState) then) =
      _$CMapCreateScreenStateCopyWithImpl<$Res>;
  $Res call(
      {int page,
      String message,
      String password,
      String link,
      dynamic type,
      Item? item,
      List<AsyncValue<Attachment>> attachments});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$CMapCreateScreenStateCopyWithImpl<$Res>
    implements $CMapCreateScreenStateCopyWith<$Res> {
  _$CMapCreateScreenStateCopyWithImpl(this._value, this._then);

  final CMapCreateScreenState _value;
  // ignore: unused_field
  final $Res Function(CMapCreateScreenState) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? message = freezed,
    Object? password = freezed,
    Object? link = freezed,
    Object? type = freezed,
    Object? item = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AsyncValue<Attachment>>,
    ));
  }

  @override
  $ItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$CMapCreateScreenStateCopyWith<$Res>
    implements $CMapCreateScreenStateCopyWith<$Res> {
  factory _$CMapCreateScreenStateCopyWith(_CMapCreateScreenState value,
          $Res Function(_CMapCreateScreenState) then) =
      __$CMapCreateScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      String message,
      String password,
      String link,
      dynamic type,
      Item? item,
      List<AsyncValue<Attachment>> attachments});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$CMapCreateScreenStateCopyWithImpl<$Res>
    extends _$CMapCreateScreenStateCopyWithImpl<$Res>
    implements _$CMapCreateScreenStateCopyWith<$Res> {
  __$CMapCreateScreenStateCopyWithImpl(_CMapCreateScreenState _value,
      $Res Function(_CMapCreateScreenState) _then)
      : super(_value, (v) => _then(v as _CMapCreateScreenState));

  @override
  _CMapCreateScreenState get _value => super._value as _CMapCreateScreenState;

  @override
  $Res call({
    Object? page = freezed,
    Object? message = freezed,
    Object? password = freezed,
    Object? link = freezed,
    Object? type = freezed,
    Object? item = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_CMapCreateScreenState(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed ? _value.type : type,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AsyncValue<Attachment>>,
    ));
  }
}

/// @nodoc

class _$_CMapCreateScreenState implements _CMapCreateScreenState {
  const _$_CMapCreateScreenState(
      {this.page = 0,
      this.message = '',
      this.password = '',
      this.link = '',
      this.type = CMapType.password,
      this.item,
      this.attachments = const []});

  @JsonKey()
  @override
  final int page;
  @JsonKey()
  @override
  final String message;
  @JsonKey()
  @override
  final String password;
  @JsonKey()
  @override
  final String link;
  @JsonKey()
  @override
  final dynamic type;
  @override
  final Item? item;
  @JsonKey()
  @override
  final List<AsyncValue<Attachment>> attachments;

  @override
  String toString() {
    return 'CMapCreateScreenState(page: $page, message: $message, password: $password, link: $link, type: $type, item: $item, attachments: $attachments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CMapCreateScreenState &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(attachments));

  @JsonKey(ignore: true)
  @override
  _$CMapCreateScreenStateCopyWith<_CMapCreateScreenState> get copyWith =>
      __$CMapCreateScreenStateCopyWithImpl<_CMapCreateScreenState>(
          this, _$identity);
}

abstract class _CMapCreateScreenState implements CMapCreateScreenState {
  const factory _CMapCreateScreenState(
      {int page,
      String message,
      String password,
      String link,
      dynamic type,
      Item? item,
      List<AsyncValue<Attachment>> attachments}) = _$_CMapCreateScreenState;

  @override
  int get page;
  @override
  String get message;
  @override
  String get password;
  @override
  String get link;
  @override
  dynamic get type;
  @override
  Item? get item;
  @override
  List<AsyncValue<Attachment>> get attachments;
  @override
  @JsonKey(ignore: true)
  _$CMapCreateScreenStateCopyWith<_CMapCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
