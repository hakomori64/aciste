// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache_import_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CacheImportScreenStateTearOff {
  const _$CacheImportScreenStateTearOff();

  _CacheImportScreenState call({Cache? cache}) {
    return _CacheImportScreenState(
      cache: cache,
    );
  }
}

/// @nodoc
const $CacheImportScreenState = _$CacheImportScreenStateTearOff();

/// @nodoc
mixin _$CacheImportScreenState {
  Cache? get cache => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CacheImportScreenStateCopyWith<CacheImportScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheImportScreenStateCopyWith<$Res> {
  factory $CacheImportScreenStateCopyWith(CacheImportScreenState value,
          $Res Function(CacheImportScreenState) then) =
      _$CacheImportScreenStateCopyWithImpl<$Res>;
  $Res call({Cache? cache});

  $CacheCopyWith<$Res>? get cache;
}

/// @nodoc
class _$CacheImportScreenStateCopyWithImpl<$Res>
    implements $CacheImportScreenStateCopyWith<$Res> {
  _$CacheImportScreenStateCopyWithImpl(this._value, this._then);

  final CacheImportScreenState _value;
  // ignore: unused_field
  final $Res Function(CacheImportScreenState) _then;

  @override
  $Res call({
    Object? cache = freezed,
  }) {
    return _then(_value.copyWith(
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache?,
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
abstract class _$CacheImportScreenStateCopyWith<$Res>
    implements $CacheImportScreenStateCopyWith<$Res> {
  factory _$CacheImportScreenStateCopyWith(_CacheImportScreenState value,
          $Res Function(_CacheImportScreenState) then) =
      __$CacheImportScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({Cache? cache});

  @override
  $CacheCopyWith<$Res>? get cache;
}

/// @nodoc
class __$CacheImportScreenStateCopyWithImpl<$Res>
    extends _$CacheImportScreenStateCopyWithImpl<$Res>
    implements _$CacheImportScreenStateCopyWith<$Res> {
  __$CacheImportScreenStateCopyWithImpl(_CacheImportScreenState _value,
      $Res Function(_CacheImportScreenState) _then)
      : super(_value, (v) => _then(v as _CacheImportScreenState));

  @override
  _CacheImportScreenState get _value => super._value as _CacheImportScreenState;

  @override
  $Res call({
    Object? cache = freezed,
  }) {
    return _then(_CacheImportScreenState(
      cache: cache == freezed
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as Cache?,
    ));
  }
}

/// @nodoc

class _$_CacheImportScreenState implements _CacheImportScreenState {
  const _$_CacheImportScreenState({this.cache});

  @override
  final Cache? cache;

  @override
  String toString() {
    return 'CacheImportScreenState(cache: $cache)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CacheImportScreenState &&
            const DeepCollectionEquality().equals(other.cache, cache));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cache));

  @JsonKey(ignore: true)
  @override
  _$CacheImportScreenStateCopyWith<_CacheImportScreenState> get copyWith =>
      __$CacheImportScreenStateCopyWithImpl<_CacheImportScreenState>(
          this, _$identity);
}

abstract class _CacheImportScreenState implements CacheImportScreenState {
  const factory _CacheImportScreenState({Cache? cache}) =
      _$_CacheImportScreenState;

  @override
  Cache? get cache;
  @override
  @JsonKey(ignore: true)
  _$CacheImportScreenStateCopyWith<_CacheImportScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
