// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dynamic_links_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DynamicLinkStateTearOff {
  const _$DynamicLinkStateTearOff();

  _DynamicLinkState call({String? path, Map<String, dynamic>? parameterMap}) {
    return _DynamicLinkState(
      path: path,
      parameterMap: parameterMap,
    );
  }
}

/// @nodoc
const $DynamicLinkState = _$DynamicLinkStateTearOff();

/// @nodoc
mixin _$DynamicLinkState {
  String? get path => throw _privateConstructorUsedError;
  Map<String, dynamic>? get parameterMap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DynamicLinkStateCopyWith<DynamicLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicLinkStateCopyWith<$Res> {
  factory $DynamicLinkStateCopyWith(
          DynamicLinkState value, $Res Function(DynamicLinkState) then) =
      _$DynamicLinkStateCopyWithImpl<$Res>;
  $Res call({String? path, Map<String, dynamic>? parameterMap});
}

/// @nodoc
class _$DynamicLinkStateCopyWithImpl<$Res>
    implements $DynamicLinkStateCopyWith<$Res> {
  _$DynamicLinkStateCopyWithImpl(this._value, this._then);

  final DynamicLinkState _value;
  // ignore: unused_field
  final $Res Function(DynamicLinkState) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? parameterMap = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      parameterMap: parameterMap == freezed
          ? _value.parameterMap
          : parameterMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$DynamicLinkStateCopyWith<$Res>
    implements $DynamicLinkStateCopyWith<$Res> {
  factory _$DynamicLinkStateCopyWith(
          _DynamicLinkState value, $Res Function(_DynamicLinkState) then) =
      __$DynamicLinkStateCopyWithImpl<$Res>;
  @override
  $Res call({String? path, Map<String, dynamic>? parameterMap});
}

/// @nodoc
class __$DynamicLinkStateCopyWithImpl<$Res>
    extends _$DynamicLinkStateCopyWithImpl<$Res>
    implements _$DynamicLinkStateCopyWith<$Res> {
  __$DynamicLinkStateCopyWithImpl(
      _DynamicLinkState _value, $Res Function(_DynamicLinkState) _then)
      : super(_value, (v) => _then(v as _DynamicLinkState));

  @override
  _DynamicLinkState get _value => super._value as _DynamicLinkState;

  @override
  $Res call({
    Object? path = freezed,
    Object? parameterMap = freezed,
  }) {
    return _then(_DynamicLinkState(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      parameterMap: parameterMap == freezed
          ? _value.parameterMap
          : parameterMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_DynamicLinkState implements _DynamicLinkState {
  const _$_DynamicLinkState({this.path, this.parameterMap});

  @override
  final String? path;
  @override
  final Map<String, dynamic>? parameterMap;

  @override
  String toString() {
    return 'DynamicLinkState(path: $path, parameterMap: $parameterMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DynamicLinkState &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality()
                .equals(other.parameterMap, parameterMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(parameterMap));

  @JsonKey(ignore: true)
  @override
  _$DynamicLinkStateCopyWith<_DynamicLinkState> get copyWith =>
      __$DynamicLinkStateCopyWithImpl<_DynamicLinkState>(this, _$identity);
}

abstract class _DynamicLinkState implements DynamicLinkState {
  const factory _DynamicLinkState(
      {String? path, Map<String, dynamic>? parameterMap}) = _$_DynamicLinkState;

  @override
  String? get path;
  @override
  Map<String, dynamic>? get parameterMap;
  @override
  @JsonKey(ignore: true)
  _$DynamicLinkStateCopyWith<_DynamicLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}
