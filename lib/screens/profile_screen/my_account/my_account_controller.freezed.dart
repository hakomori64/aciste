// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_account_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyAccountStateTearOff {
  const _$MyAccountStateTearOff();

  _MyAccountState call(
      {Item? item,
      bool isDisplayNameEditing = false,
      bool isBioEditing = false}) {
    return _MyAccountState(
      item: item,
      isDisplayNameEditing: isDisplayNameEditing,
      isBioEditing: isBioEditing,
    );
  }
}

/// @nodoc
const $MyAccountState = _$MyAccountStateTearOff();

/// @nodoc
mixin _$MyAccountState {
  Item? get item => throw _privateConstructorUsedError;
  bool get isDisplayNameEditing => throw _privateConstructorUsedError;
  bool get isBioEditing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAccountStateCopyWith<MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountStateCopyWith<$Res> {
  factory $MyAccountStateCopyWith(
          MyAccountState value, $Res Function(MyAccountState) then) =
      _$MyAccountStateCopyWithImpl<$Res>;
  $Res call({Item? item, bool isDisplayNameEditing, bool isBioEditing});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$MyAccountStateCopyWithImpl<$Res>
    implements $MyAccountStateCopyWith<$Res> {
  _$MyAccountStateCopyWithImpl(this._value, this._then);

  final MyAccountState _value;
  // ignore: unused_field
  final $Res Function(MyAccountState) _then;

  @override
  $Res call({
    Object? item = freezed,
    Object? isDisplayNameEditing = freezed,
    Object? isBioEditing = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      isDisplayNameEditing: isDisplayNameEditing == freezed
          ? _value.isDisplayNameEditing
          : isDisplayNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isBioEditing: isBioEditing == freezed
          ? _value.isBioEditing
          : isBioEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$MyAccountStateCopyWith<$Res>
    implements $MyAccountStateCopyWith<$Res> {
  factory _$MyAccountStateCopyWith(
          _MyAccountState value, $Res Function(_MyAccountState) then) =
      __$MyAccountStateCopyWithImpl<$Res>;
  @override
  $Res call({Item? item, bool isDisplayNameEditing, bool isBioEditing});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$MyAccountStateCopyWithImpl<$Res>
    extends _$MyAccountStateCopyWithImpl<$Res>
    implements _$MyAccountStateCopyWith<$Res> {
  __$MyAccountStateCopyWithImpl(
      _MyAccountState _value, $Res Function(_MyAccountState) _then)
      : super(_value, (v) => _then(v as _MyAccountState));

  @override
  _MyAccountState get _value => super._value as _MyAccountState;

  @override
  $Res call({
    Object? item = freezed,
    Object? isDisplayNameEditing = freezed,
    Object? isBioEditing = freezed,
  }) {
    return _then(_MyAccountState(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      isDisplayNameEditing: isDisplayNameEditing == freezed
          ? _value.isDisplayNameEditing
          : isDisplayNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isBioEditing: isBioEditing == freezed
          ? _value.isBioEditing
          : isBioEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MyAccountState implements _MyAccountState {
  const _$_MyAccountState(
      {this.item,
      this.isDisplayNameEditing = false,
      this.isBioEditing = false});

  @override
  final Item? item;
  @JsonKey()
  @override
  final bool isDisplayNameEditing;
  @JsonKey()
  @override
  final bool isBioEditing;

  @override
  String toString() {
    return 'MyAccountState(item: $item, isDisplayNameEditing: $isDisplayNameEditing, isBioEditing: $isBioEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyAccountState &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.isDisplayNameEditing, isDisplayNameEditing) &&
            const DeepCollectionEquality()
                .equals(other.isBioEditing, isBioEditing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(isDisplayNameEditing),
      const DeepCollectionEquality().hash(isBioEditing));

  @JsonKey(ignore: true)
  @override
  _$MyAccountStateCopyWith<_MyAccountState> get copyWith =>
      __$MyAccountStateCopyWithImpl<_MyAccountState>(this, _$identity);
}

abstract class _MyAccountState implements MyAccountState {
  const factory _MyAccountState(
      {Item? item,
      bool isDisplayNameEditing,
      bool isBioEditing}) = _$_MyAccountState;

  @override
  Item? get item;
  @override
  bool get isDisplayNameEditing;
  @override
  bool get isBioEditing;
  @override
  @JsonKey(ignore: true)
  _$MyAccountStateCopyWith<_MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
