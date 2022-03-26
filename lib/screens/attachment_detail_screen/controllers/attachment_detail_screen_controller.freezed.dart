// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attachment_detail_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttachmentDetailScreenStateTearOff {
  const _$AttachmentDetailScreenStateTearOff();

  _AttachmentDetailScreenState call({Attachment? attachment}) {
    return _AttachmentDetailScreenState(
      attachment: attachment,
    );
  }
}

/// @nodoc
const $AttachmentDetailScreenState = _$AttachmentDetailScreenStateTearOff();

/// @nodoc
mixin _$AttachmentDetailScreenState {
  Attachment? get attachment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttachmentDetailScreenStateCopyWith<AttachmentDetailScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentDetailScreenStateCopyWith<$Res> {
  factory $AttachmentDetailScreenStateCopyWith(
          AttachmentDetailScreenState value,
          $Res Function(AttachmentDetailScreenState) then) =
      _$AttachmentDetailScreenStateCopyWithImpl<$Res>;
  $Res call({Attachment? attachment});

  $AttachmentCopyWith<$Res>? get attachment;
}

/// @nodoc
class _$AttachmentDetailScreenStateCopyWithImpl<$Res>
    implements $AttachmentDetailScreenStateCopyWith<$Res> {
  _$AttachmentDetailScreenStateCopyWithImpl(this._value, this._then);

  final AttachmentDetailScreenState _value;
  // ignore: unused_field
  final $Res Function(AttachmentDetailScreenState) _then;

  @override
  $Res call({
    Object? attachment = freezed,
  }) {
    return _then(_value.copyWith(
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as Attachment?,
    ));
  }

  @override
  $AttachmentCopyWith<$Res>? get attachment {
    if (_value.attachment == null) {
      return null;
    }

    return $AttachmentCopyWith<$Res>(_value.attachment!, (value) {
      return _then(_value.copyWith(attachment: value));
    });
  }
}

/// @nodoc
abstract class _$AttachmentDetailScreenStateCopyWith<$Res>
    implements $AttachmentDetailScreenStateCopyWith<$Res> {
  factory _$AttachmentDetailScreenStateCopyWith(
          _AttachmentDetailScreenState value,
          $Res Function(_AttachmentDetailScreenState) then) =
      __$AttachmentDetailScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({Attachment? attachment});

  @override
  $AttachmentCopyWith<$Res>? get attachment;
}

/// @nodoc
class __$AttachmentDetailScreenStateCopyWithImpl<$Res>
    extends _$AttachmentDetailScreenStateCopyWithImpl<$Res>
    implements _$AttachmentDetailScreenStateCopyWith<$Res> {
  __$AttachmentDetailScreenStateCopyWithImpl(
      _AttachmentDetailScreenState _value,
      $Res Function(_AttachmentDetailScreenState) _then)
      : super(_value, (v) => _then(v as _AttachmentDetailScreenState));

  @override
  _AttachmentDetailScreenState get _value =>
      super._value as _AttachmentDetailScreenState;

  @override
  $Res call({
    Object? attachment = freezed,
  }) {
    return _then(_AttachmentDetailScreenState(
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as Attachment?,
    ));
  }
}

/// @nodoc

class _$_AttachmentDetailScreenState implements _AttachmentDetailScreenState {
  const _$_AttachmentDetailScreenState({this.attachment});

  @override
  final Attachment? attachment;

  @override
  String toString() {
    return 'AttachmentDetailScreenState(attachment: $attachment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttachmentDetailScreenState &&
            const DeepCollectionEquality()
                .equals(other.attachment, attachment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(attachment));

  @JsonKey(ignore: true)
  @override
  _$AttachmentDetailScreenStateCopyWith<_AttachmentDetailScreenState>
      get copyWith => __$AttachmentDetailScreenStateCopyWithImpl<
          _AttachmentDetailScreenState>(this, _$identity);
}

abstract class _AttachmentDetailScreenState
    implements AttachmentDetailScreenState {
  const factory _AttachmentDetailScreenState({Attachment? attachment}) =
      _$_AttachmentDetailScreenState;

  @override
  Attachment? get attachment;
  @override
  @JsonKey(ignore: true)
  _$AttachmentDetailScreenStateCopyWith<_AttachmentDetailScreenState>
      get copyWith => throw _privateConstructorUsedError;
}
