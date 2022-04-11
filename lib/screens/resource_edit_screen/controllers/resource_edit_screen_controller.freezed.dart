// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resource_edit_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResourceEditScreenStateTearOff {
  const _$ResourceEditScreenStateTearOff();

  _ResourceEditScreenState call(
      {required Cache cache,
      required String title,
      required String body,
      List<AsyncValue<Attachment>> attachments = const []}) {
    return _ResourceEditScreenState(
      cache: cache,
      title: title,
      body: body,
      attachments: attachments,
    );
  }
}

/// @nodoc
const $ResourceEditScreenState = _$ResourceEditScreenStateTearOff();

/// @nodoc
mixin _$ResourceEditScreenState {
  Cache get cache => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  List<AsyncValue<Attachment>> get attachments =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResourceEditScreenStateCopyWith<ResourceEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceEditScreenStateCopyWith<$Res> {
  factory $ResourceEditScreenStateCopyWith(ResourceEditScreenState value,
          $Res Function(ResourceEditScreenState) then) =
      _$ResourceEditScreenStateCopyWithImpl<$Res>;
  $Res call(
      {Cache cache,
      String title,
      String body,
      List<AsyncValue<Attachment>> attachments});

  $CacheCopyWith<$Res> get cache;
}

/// @nodoc
class _$ResourceEditScreenStateCopyWithImpl<$Res>
    implements $ResourceEditScreenStateCopyWith<$Res> {
  _$ResourceEditScreenStateCopyWithImpl(this._value, this._then);

  final ResourceEditScreenState _value;
  // ignore: unused_field
  final $Res Function(ResourceEditScreenState) _then;

  @override
  $Res call({
    Object? cache = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache,
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

  @override
  $CacheCopyWith<$Res> get cache {
    return $CacheCopyWith<$Res>(_value.cache, (value) {
      return _then(_value.copyWith(cache: value));
    });
  }
}

/// @nodoc
abstract class _$ResourceEditScreenStateCopyWith<$Res>
    implements $ResourceEditScreenStateCopyWith<$Res> {
  factory _$ResourceEditScreenStateCopyWith(_ResourceEditScreenState value,
          $Res Function(_ResourceEditScreenState) then) =
      __$ResourceEditScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Cache cache,
      String title,
      String body,
      List<AsyncValue<Attachment>> attachments});

  @override
  $CacheCopyWith<$Res> get cache;
}

/// @nodoc
class __$ResourceEditScreenStateCopyWithImpl<$Res>
    extends _$ResourceEditScreenStateCopyWithImpl<$Res>
    implements _$ResourceEditScreenStateCopyWith<$Res> {
  __$ResourceEditScreenStateCopyWithImpl(_ResourceEditScreenState _value,
      $Res Function(_ResourceEditScreenState) _then)
      : super(_value, (v) => _then(v as _ResourceEditScreenState));

  @override
  _ResourceEditScreenState get _value =>
      super._value as _ResourceEditScreenState;

  @override
  $Res call({
    Object? cache = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_ResourceEditScreenState(
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache,
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

class _$_ResourceEditScreenState implements _ResourceEditScreenState {
  const _$_ResourceEditScreenState(
      {required this.cache,
      required this.title,
      required this.body,
      this.attachments = const []});

  @override
  final Cache cache;
  @override
  final String title;
  @override
  final String body;
  @JsonKey()
  @override
  final List<AsyncValue<Attachment>> attachments;

  @override
  String toString() {
    return 'ResourceEditScreenState(cache: $cache, title: $title, body: $body, attachments: $attachments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResourceEditScreenState &&
            const DeepCollectionEquality().equals(other.cache, cache) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cache),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(attachments));

  @JsonKey(ignore: true)
  @override
  _$ResourceEditScreenStateCopyWith<_ResourceEditScreenState> get copyWith =>
      __$ResourceEditScreenStateCopyWithImpl<_ResourceEditScreenState>(
          this, _$identity);
}

abstract class _ResourceEditScreenState implements ResourceEditScreenState {
  const factory _ResourceEditScreenState(
      {required Cache cache,
      required String title,
      required String body,
      List<AsyncValue<Attachment>> attachments}) = _$_ResourceEditScreenState;

  @override
  Cache get cache;
  @override
  String get title;
  @override
  String get body;
  @override
  List<AsyncValue<Attachment>> get attachments;
  @override
  @JsonKey(ignore: true)
  _$ResourceEditScreenStateCopyWith<_ResourceEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
