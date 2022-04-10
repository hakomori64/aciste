// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainScreenStateTearOff {
  const _$MainScreenStateTearOff();

  _MainScreenState call(
      {BottomItem page = BottomItem.cmap, bool isSelecting = false}) {
    return _MainScreenState(
      page: page,
      isSelecting: isSelecting,
    );
  }
}

/// @nodoc
const $MainScreenState = _$MainScreenStateTearOff();

/// @nodoc
mixin _$MainScreenState {
  BottomItem get page => throw _privateConstructorUsedError;
  bool get isSelecting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) then) =
      _$MainScreenStateCopyWithImpl<$Res>;
  $Res call({BottomItem page, bool isSelecting});
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  final MainScreenState _value;
  // ignore: unused_field
  final $Res Function(MainScreenState) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? isSelecting = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as BottomItem,
      isSelecting: isSelecting == freezed
          ? _value.isSelecting
          : isSelecting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MainScreenStateCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$MainScreenStateCopyWith(
          _MainScreenState value, $Res Function(_MainScreenState) then) =
      __$MainScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({BottomItem page, bool isSelecting});
}

/// @nodoc
class __$MainScreenStateCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res>
    implements _$MainScreenStateCopyWith<$Res> {
  __$MainScreenStateCopyWithImpl(
      _MainScreenState _value, $Res Function(_MainScreenState) _then)
      : super(_value, (v) => _then(v as _MainScreenState));

  @override
  _MainScreenState get _value => super._value as _MainScreenState;

  @override
  $Res call({
    Object? page = freezed,
    Object? isSelecting = freezed,
  }) {
    return _then(_MainScreenState(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as BottomItem,
      isSelecting: isSelecting == freezed
          ? _value.isSelecting
          : isSelecting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MainScreenState implements _MainScreenState {
  const _$_MainScreenState(
      {this.page = BottomItem.cmap, this.isSelecting = false});

  @JsonKey()
  @override
  final BottomItem page;
  @JsonKey()
  @override
  final bool isSelecting;

  @override
  String toString() {
    return 'MainScreenState(page: $page, isSelecting: $isSelecting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainScreenState &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality()
                .equals(other.isSelecting, isSelecting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(isSelecting));

  @JsonKey(ignore: true)
  @override
  _$MainScreenStateCopyWith<_MainScreenState> get copyWith =>
      __$MainScreenStateCopyWithImpl<_MainScreenState>(this, _$identity);
}

abstract class _MainScreenState implements MainScreenState {
  const factory _MainScreenState({BottomItem page, bool isSelecting}) =
      _$_MainScreenState;

  @override
  BottomItem get page;
  @override
  bool get isSelecting;
  @override
  @JsonKey(ignore: true)
  _$MainScreenStateCopyWith<_MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
