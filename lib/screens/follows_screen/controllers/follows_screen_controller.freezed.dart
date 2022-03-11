// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follows_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowsScreenStateTearOff {
  const _$FollowsScreenStateTearOff();

  _FollowsScreenState call(
      {bool isLoading = true,
      List<String> follows = const [],
      List<User> data = const []}) {
    return _FollowsScreenState(
      isLoading: isLoading,
      follows: follows,
      data: data,
    );
  }
}

/// @nodoc
const $FollowsScreenState = _$FollowsScreenStateTearOff();

/// @nodoc
mixin _$FollowsScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get follows => throw _privateConstructorUsedError;
  List<User> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowsScreenStateCopyWith<FollowsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowsScreenStateCopyWith<$Res> {
  factory $FollowsScreenStateCopyWith(
          FollowsScreenState value, $Res Function(FollowsScreenState) then) =
      _$FollowsScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<String> follows, List<User> data});
}

/// @nodoc
class _$FollowsScreenStateCopyWithImpl<$Res>
    implements $FollowsScreenStateCopyWith<$Res> {
  _$FollowsScreenStateCopyWithImpl(this._value, this._then);

  final FollowsScreenState _value;
  // ignore: unused_field
  final $Res Function(FollowsScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? follows = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
abstract class _$FollowsScreenStateCopyWith<$Res>
    implements $FollowsScreenStateCopyWith<$Res> {
  factory _$FollowsScreenStateCopyWith(
          _FollowsScreenState value, $Res Function(_FollowsScreenState) then) =
      __$FollowsScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<String> follows, List<User> data});
}

/// @nodoc
class __$FollowsScreenStateCopyWithImpl<$Res>
    extends _$FollowsScreenStateCopyWithImpl<$Res>
    implements _$FollowsScreenStateCopyWith<$Res> {
  __$FollowsScreenStateCopyWithImpl(
      _FollowsScreenState _value, $Res Function(_FollowsScreenState) _then)
      : super(_value, (v) => _then(v as _FollowsScreenState));

  @override
  _FollowsScreenState get _value => super._value as _FollowsScreenState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? follows = freezed,
    Object? data = freezed,
  }) {
    return _then(_FollowsScreenState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$_FollowsScreenState implements _FollowsScreenState {
  const _$_FollowsScreenState(
      {this.isLoading = true, this.follows = const [], this.data = const []});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final List<String> follows;
  @JsonKey()
  @override
  final List<User> data;

  @override
  String toString() {
    return 'FollowsScreenState(isLoading: $isLoading, follows: $follows, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowsScreenState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.follows, follows) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(follows),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$FollowsScreenStateCopyWith<_FollowsScreenState> get copyWith =>
      __$FollowsScreenStateCopyWithImpl<_FollowsScreenState>(this, _$identity);
}

abstract class _FollowsScreenState implements FollowsScreenState {
  const factory _FollowsScreenState(
      {bool isLoading,
      List<String> follows,
      List<User> data}) = _$_FollowsScreenState;

  @override
  bool get isLoading;
  @override
  List<String> get follows;
  @override
  List<User> get data;
  @override
  @JsonKey(ignore: true)
  _$FollowsScreenStateCopyWith<_FollowsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
