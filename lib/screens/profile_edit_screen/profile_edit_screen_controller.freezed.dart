// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_edit_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileEditScreenStateTearOff {
  const _$ProfileEditScreenStateTearOff();

  _ProfileEditScreenState call({String displayName = "", String bio = ""}) {
    return _ProfileEditScreenState(
      displayName: displayName,
      bio: bio,
    );
  }
}

/// @nodoc
const $ProfileEditScreenState = _$ProfileEditScreenStateTearOff();

/// @nodoc
mixin _$ProfileEditScreenState {
  String get displayName => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditScreenStateCopyWith<ProfileEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditScreenStateCopyWith<$Res> {
  factory $ProfileEditScreenStateCopyWith(ProfileEditScreenState value,
          $Res Function(ProfileEditScreenState) then) =
      _$ProfileEditScreenStateCopyWithImpl<$Res>;
  $Res call({String displayName, String bio});
}

/// @nodoc
class _$ProfileEditScreenStateCopyWithImpl<$Res>
    implements $ProfileEditScreenStateCopyWith<$Res> {
  _$ProfileEditScreenStateCopyWithImpl(this._value, this._then);

  final ProfileEditScreenState _value;
  // ignore: unused_field
  final $Res Function(ProfileEditScreenState) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfileEditScreenStateCopyWith<$Res>
    implements $ProfileEditScreenStateCopyWith<$Res> {
  factory _$ProfileEditScreenStateCopyWith(_ProfileEditScreenState value,
          $Res Function(_ProfileEditScreenState) then) =
      __$ProfileEditScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String displayName, String bio});
}

/// @nodoc
class __$ProfileEditScreenStateCopyWithImpl<$Res>
    extends _$ProfileEditScreenStateCopyWithImpl<$Res>
    implements _$ProfileEditScreenStateCopyWith<$Res> {
  __$ProfileEditScreenStateCopyWithImpl(_ProfileEditScreenState _value,
      $Res Function(_ProfileEditScreenState) _then)
      : super(_value, (v) => _then(v as _ProfileEditScreenState));

  @override
  _ProfileEditScreenState get _value => super._value as _ProfileEditScreenState;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? bio = freezed,
  }) {
    return _then(_ProfileEditScreenState(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileEditScreenState implements _ProfileEditScreenState {
  const _$_ProfileEditScreenState({this.displayName = "", this.bio = ""});

  @JsonKey()
  @override
  final String displayName;
  @JsonKey()
  @override
  final String bio;

  @override
  String toString() {
    return 'ProfileEditScreenState(displayName: $displayName, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileEditScreenState &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.bio, bio));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(bio));

  @JsonKey(ignore: true)
  @override
  _$ProfileEditScreenStateCopyWith<_ProfileEditScreenState> get copyWith =>
      __$ProfileEditScreenStateCopyWithImpl<_ProfileEditScreenState>(
          this, _$identity);
}

abstract class _ProfileEditScreenState implements ProfileEditScreenState {
  const factory _ProfileEditScreenState({String displayName, String bio}) =
      _$_ProfileEditScreenState;

  @override
  String get displayName;
  @override
  String get bio;
  @override
  @JsonKey(ignore: true)
  _$ProfileEditScreenStateCopyWith<_ProfileEditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
