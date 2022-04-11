// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache_edit_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CacheEditScreenStateTearOff {
  const _$CacheEditScreenStateTearOff();

  _CacheEditScreenState call(
      {Cache? cache,
      bool isNameEditing = false,
      bool isDescriptionEditing = false,
      String description = ""}) {
    return _CacheEditScreenState(
      cache: cache,
      isNameEditing: isNameEditing,
      isDescriptionEditing: isDescriptionEditing,
      description: description,
    );
  }
}

/// @nodoc
const $CacheEditScreenState = _$CacheEditScreenStateTearOff();

/// @nodoc
mixin _$CacheEditScreenState {
  Cache? get cache => throw _privateConstructorUsedError;
  bool get isNameEditing => throw _privateConstructorUsedError;
  bool get isDescriptionEditing => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CacheEditScreenStateCopyWith<CacheEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheEditScreenStateCopyWith<$Res> {
  factory $CacheEditScreenStateCopyWith(CacheEditScreenState value,
          $Res Function(CacheEditScreenState) then) =
      _$CacheEditScreenStateCopyWithImpl<$Res>;
  $Res call(
      {Cache? cache,
      bool isNameEditing,
      bool isDescriptionEditing,
      String description});

  $CacheCopyWith<$Res>? get cache;
}

/// @nodoc
class _$CacheEditScreenStateCopyWithImpl<$Res>
    implements $CacheEditScreenStateCopyWith<$Res> {
  _$CacheEditScreenStateCopyWithImpl(this._value, this._then);

  final CacheEditScreenState _value;
  // ignore: unused_field
  final $Res Function(CacheEditScreenState) _then;

  @override
  $Res call({
    Object? cache = freezed,
    Object? isNameEditing = freezed,
    Object? isDescriptionEditing = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache?,
      isNameEditing: isNameEditing == freezed
          ? _value.isNameEditing
          : isNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isDescriptionEditing: isDescriptionEditing == freezed
          ? _value.isDescriptionEditing
          : isDescriptionEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $CacheCopyWith<$Res>? get cache {
    if (_value.cache == null) {
      return null;
    }

    return $CacheCopyWith<$Res>(_value.cache!, (value) {
      return _then(_value.copyWith(cache: value));
    });
  }
}

/// @nodoc
abstract class _$CacheEditScreenStateCopyWith<$Res>
    implements $CacheEditScreenStateCopyWith<$Res> {
  factory _$CacheEditScreenStateCopyWith(_CacheEditScreenState value,
          $Res Function(_CacheEditScreenState) then) =
      __$CacheEditScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Cache? cache,
      bool isNameEditing,
      bool isDescriptionEditing,
      String description});

  @override
  $CacheCopyWith<$Res>? get cache;
}

/// @nodoc
class __$CacheEditScreenStateCopyWithImpl<$Res>
    extends _$CacheEditScreenStateCopyWithImpl<$Res>
    implements _$CacheEditScreenStateCopyWith<$Res> {
  __$CacheEditScreenStateCopyWithImpl(
      _CacheEditScreenState _value, $Res Function(_CacheEditScreenState) _then)
      : super(_value, (v) => _then(v as _CacheEditScreenState));

  @override
  _CacheEditScreenState get _value => super._value as _CacheEditScreenState;

  @override
  $Res call({
    Object? cache = freezed,
    Object? isNameEditing = freezed,
    Object? isDescriptionEditing = freezed,
    Object? description = freezed,
  }) {
    return _then(_CacheEditScreenState(
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache?,
      isNameEditing: isNameEditing == freezed
          ? _value.isNameEditing
          : isNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isDescriptionEditing: isDescriptionEditing == freezed
          ? _value.isDescriptionEditing
          : isDescriptionEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CacheEditScreenState implements _CacheEditScreenState {
  const _$_CacheEditScreenState(
      {this.cache,
      this.isNameEditing = false,
      this.isDescriptionEditing = false,
      this.description = ""});

  @override
  final Cache? cache;
  @JsonKey()
  @override
  final bool isNameEditing;
  @JsonKey()
  @override
  final bool isDescriptionEditing;
  @JsonKey()
  @override
  final String description;

  @override
  String toString() {
    return 'CacheEditScreenState(cache: $cache, isNameEditing: $isNameEditing, isDescriptionEditing: $isDescriptionEditing, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CacheEditScreenState &&
            const DeepCollectionEquality().equals(other.cache, cache) &&
            const DeepCollectionEquality()
                .equals(other.isNameEditing, isNameEditing) &&
            const DeepCollectionEquality()
                .equals(other.isDescriptionEditing, isDescriptionEditing) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cache),
      const DeepCollectionEquality().hash(isNameEditing),
      const DeepCollectionEquality().hash(isDescriptionEditing),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$CacheEditScreenStateCopyWith<_CacheEditScreenState> get copyWith =>
      __$CacheEditScreenStateCopyWithImpl<_CacheEditScreenState>(
          this, _$identity);
}

abstract class _CacheEditScreenState implements CacheEditScreenState {
  const factory _CacheEditScreenState(
      {Cache? cache,
      bool isNameEditing,
      bool isDescriptionEditing,
      String description}) = _$_CacheEditScreenState;

  @override
  Cache? get cache;
  @override
  bool get isNameEditing;
  @override
  bool get isDescriptionEditing;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$CacheEditScreenStateCopyWith<_CacheEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
