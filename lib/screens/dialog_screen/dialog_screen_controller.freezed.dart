// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dialog_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DialogScreenStateTearOff {
  const _$DialogScreenStateTearOff();

  _DialogScreenState call({Widget? child}) {
    return _DialogScreenState(
      child: child,
    );
  }
}

/// @nodoc
const $DialogScreenState = _$DialogScreenStateTearOff();

/// @nodoc
mixin _$DialogScreenState {
  Widget? get child => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DialogScreenStateCopyWith<DialogScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogScreenStateCopyWith<$Res> {
  factory $DialogScreenStateCopyWith(
          DialogScreenState value, $Res Function(DialogScreenState) then) =
      _$DialogScreenStateCopyWithImpl<$Res>;
  $Res call({Widget? child});
}

/// @nodoc
class _$DialogScreenStateCopyWithImpl<$Res>
    implements $DialogScreenStateCopyWith<$Res> {
  _$DialogScreenStateCopyWithImpl(this._value, this._then);

  final DialogScreenState _value;
  // ignore: unused_field
  final $Res Function(DialogScreenState) _then;

  @override
  $Res call({
    Object? child = freezed,
  }) {
    return _then(_value.copyWith(
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc
abstract class _$DialogScreenStateCopyWith<$Res>
    implements $DialogScreenStateCopyWith<$Res> {
  factory _$DialogScreenStateCopyWith(
          _DialogScreenState value, $Res Function(_DialogScreenState) then) =
      __$DialogScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({Widget? child});
}

/// @nodoc
class __$DialogScreenStateCopyWithImpl<$Res>
    extends _$DialogScreenStateCopyWithImpl<$Res>
    implements _$DialogScreenStateCopyWith<$Res> {
  __$DialogScreenStateCopyWithImpl(
      _DialogScreenState _value, $Res Function(_DialogScreenState) _then)
      : super(_value, (v) => _then(v as _DialogScreenState));

  @override
  _DialogScreenState get _value => super._value as _DialogScreenState;

  @override
  $Res call({
    Object? child = freezed,
  }) {
    return _then(_DialogScreenState(
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

class _$_DialogScreenState implements _DialogScreenState {
  const _$_DialogScreenState({this.child});

  @override
  final Widget? child;

  @override
  String toString() {
    return 'DialogScreenState(child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DialogScreenState &&
            const DeepCollectionEquality().equals(other.child, child));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(child));

  @JsonKey(ignore: true)
  @override
  _$DialogScreenStateCopyWith<_DialogScreenState> get copyWith =>
      __$DialogScreenStateCopyWithImpl<_DialogScreenState>(this, _$identity);
}

abstract class _DialogScreenState implements DialogScreenState {
  const factory _DialogScreenState({Widget? child}) = _$_DialogScreenState;

  @override
  Widget? get child;
  @override
  @JsonKey(ignore: true)
  _$DialogScreenStateCopyWith<_DialogScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
