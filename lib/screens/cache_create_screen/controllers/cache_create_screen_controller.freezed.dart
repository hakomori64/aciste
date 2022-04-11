// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache_create_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CacheCreateScreenStateTearOff {
  const _$CacheCreateScreenStateTearOff();

  _CacheCreateScreenState call(
      {String title = "",
      String body = "",
      List<AsyncValue<Attachment>> attachments = const []}) {
    return _CacheCreateScreenState(
      title: title,
      body: body,
      attachments: attachments,
    );
  }
}

/// @nodoc
const $CacheCreateScreenState = _$CacheCreateScreenStateTearOff();

/// @nodoc
mixin _$CacheCreateScreenState {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  List<AsyncValue<Attachment>> get attachments =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CacheCreateScreenStateCopyWith<CacheCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheCreateScreenStateCopyWith<$Res> {
  factory $CacheCreateScreenStateCopyWith(CacheCreateScreenState value,
          $Res Function(CacheCreateScreenState) then) =
      _$CacheCreateScreenStateCopyWithImpl<$Res>;
  $Res call(
      {String title, String body, List<AsyncValue<Attachment>> attachments});
}

/// @nodoc
class _$CacheCreateScreenStateCopyWithImpl<$Res>
    implements $CacheCreateScreenStateCopyWith<$Res> {
  _$CacheCreateScreenStateCopyWithImpl(this._value, this._then);

  final CacheCreateScreenState _value;
  // ignore: unused_field
  final $Res Function(CacheCreateScreenState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AsyncValue<Attachment>>,
    ));
  }
}

/// @nodoc
abstract class _$CacheCreateScreenStateCopyWith<$Res>
    implements $CacheCreateScreenStateCopyWith<$Res> {
  factory _$CacheCreateScreenStateCopyWith(_CacheCreateScreenState value,
          $Res Function(_CacheCreateScreenState) then) =
      __$CacheCreateScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title, String body, List<AsyncValue<Attachment>> attachments});
}

/// @nodoc
class __$CacheCreateScreenStateCopyWithImpl<$Res>
    extends _$CacheCreateScreenStateCopyWithImpl<$Res>
    implements _$CacheCreateScreenStateCopyWith<$Res> {
  __$CacheCreateScreenStateCopyWithImpl(_CacheCreateScreenState _value,
      $Res Function(_CacheCreateScreenState) _then)
      : super(_value, (v) => _then(v as _CacheCreateScreenState));

  @override
  _CacheCreateScreenState get _value => super._value as _CacheCreateScreenState;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_CacheCreateScreenState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AsyncValue<Attachment>>,
    ));
  }
}

/// @nodoc

class _$_CacheCreateScreenState implements _CacheCreateScreenState {
  const _$_CacheCreateScreenState(
      {this.title = "", this.body = "", this.attachments = const []});

  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final String body;
  @JsonKey()
  @override
  final List<AsyncValue<Attachment>> attachments;

  @override
  String toString() {
    return 'CacheCreateScreenState(title: $title, body: $body, attachments: $attachments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CacheCreateScreenState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(attachments));

  @JsonKey(ignore: true)
  @override
  _$CacheCreateScreenStateCopyWith<_CacheCreateScreenState> get copyWith =>
      __$CacheCreateScreenStateCopyWithImpl<_CacheCreateScreenState>(
          this, _$identity);
}

abstract class _CacheCreateScreenState implements CacheCreateScreenState {
  const factory _CacheCreateScreenState(
      {String title,
      String body,
      List<AsyncValue<Attachment>> attachments}) = _$_CacheCreateScreenState;

  @override
  String get title;
  @override
  String get body;
  @override
  List<AsyncValue<Attachment>> get attachments;
  @override
  @JsonKey(ignore: true)
  _$CacheCreateScreenStateCopyWith<_CacheCreateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
