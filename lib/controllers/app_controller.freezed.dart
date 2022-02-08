// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppControllerStateTearOff {
  const _$AppControllerStateTearOff();

  _AppControllerState call({bool loading = false}) {
    return _AppControllerState(
      loading: loading,
    );
  }
}

/// @nodoc
const $AppControllerState = _$AppControllerStateTearOff();

/// @nodoc
mixin _$AppControllerState {
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppControllerStateCopyWith<AppControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppControllerStateCopyWith<$Res> {
  factory $AppControllerStateCopyWith(
          AppControllerState value, $Res Function(AppControllerState) then) =
      _$AppControllerStateCopyWithImpl<$Res>;
  $Res call({bool loading});
}

/// @nodoc
class _$AppControllerStateCopyWithImpl<$Res>
    implements $AppControllerStateCopyWith<$Res> {
  _$AppControllerStateCopyWithImpl(this._value, this._then);

  final AppControllerState _value;
  // ignore: unused_field
  final $Res Function(AppControllerState) _then;

  @override
  $Res call({
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AppControllerStateCopyWith<$Res>
    implements $AppControllerStateCopyWith<$Res> {
  factory _$AppControllerStateCopyWith(
          _AppControllerState value, $Res Function(_AppControllerState) then) =
      __$AppControllerStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading});
}

/// @nodoc
class __$AppControllerStateCopyWithImpl<$Res>
    extends _$AppControllerStateCopyWithImpl<$Res>
    implements _$AppControllerStateCopyWith<$Res> {
  __$AppControllerStateCopyWithImpl(
      _AppControllerState _value, $Res Function(_AppControllerState) _then)
      : super(_value, (v) => _then(v as _AppControllerState));

  @override
  _AppControllerState get _value => super._value as _AppControllerState;

  @override
  $Res call({
    Object? loading = freezed,
  }) {
    return _then(_AppControllerState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppControllerState
    with DiagnosticableTreeMixin
    implements _AppControllerState {
  const _$_AppControllerState({this.loading = false});

  @JsonKey()
  @override
  final bool loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppControllerState(loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppControllerState'))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppControllerState &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$AppControllerStateCopyWith<_AppControllerState> get copyWith =>
      __$AppControllerStateCopyWithImpl<_AppControllerState>(this, _$identity);
}

abstract class _AppControllerState implements AppControllerState {
  const factory _AppControllerState({bool loading}) = _$_AppControllerState;

  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$AppControllerStateCopyWith<_AppControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}
