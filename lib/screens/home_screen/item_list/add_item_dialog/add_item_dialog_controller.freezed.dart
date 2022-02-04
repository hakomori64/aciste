// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_item_dialog_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddItemDialogStateTearOff {
  const _$AddItemDialogStateTearOff();

  _AddItemDialogState call({File? imageFile}) {
    return _AddItemDialogState(
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $AddItemDialogState = _$AddItemDialogStateTearOff();

/// @nodoc
mixin _$AddItemDialogState {
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddItemDialogStateCopyWith<AddItemDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddItemDialogStateCopyWith<$Res> {
  factory $AddItemDialogStateCopyWith(
          AddItemDialogState value, $Res Function(AddItemDialogState) then) =
      _$AddItemDialogStateCopyWithImpl<$Res>;
  $Res call({File? imageFile});
}

/// @nodoc
class _$AddItemDialogStateCopyWithImpl<$Res>
    implements $AddItemDialogStateCopyWith<$Res> {
  _$AddItemDialogStateCopyWithImpl(this._value, this._then);

  final AddItemDialogState _value;
  // ignore: unused_field
  final $Res Function(AddItemDialogState) _then;

  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$AddItemDialogStateCopyWith<$Res>
    implements $AddItemDialogStateCopyWith<$Res> {
  factory _$AddItemDialogStateCopyWith(
          _AddItemDialogState value, $Res Function(_AddItemDialogState) then) =
      __$AddItemDialogStateCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile});
}

/// @nodoc
class __$AddItemDialogStateCopyWithImpl<$Res>
    extends _$AddItemDialogStateCopyWithImpl<$Res>
    implements _$AddItemDialogStateCopyWith<$Res> {
  __$AddItemDialogStateCopyWithImpl(
      _AddItemDialogState _value, $Res Function(_AddItemDialogState) _then)
      : super(_value, (v) => _then(v as _AddItemDialogState));

  @override
  _AddItemDialogState get _value => super._value as _AddItemDialogState;

  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_AddItemDialogState(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_AddItemDialogState implements _AddItemDialogState {
  const _$_AddItemDialogState({this.imageFile});

  @override
  final File? imageFile;

  @override
  String toString() {
    return 'AddItemDialogState(imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddItemDialogState &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  _$AddItemDialogStateCopyWith<_AddItemDialogState> get copyWith =>
      __$AddItemDialogStateCopyWithImpl<_AddItemDialogState>(this, _$identity);
}

abstract class _AddItemDialogState implements AddItemDialogState {
  const factory _AddItemDialogState({File? imageFile}) = _$_AddItemDialogState;

  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$AddItemDialogStateCopyWith<_AddItemDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}
