// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaScreenStateTearOff {
  const _$MediaScreenStateTearOff();

  _MediaScreenState call(
      {int currentPage = 0,
      int? lastPage,
      int albumIndex = -1,
      AttachmentType attachmentType = AttachmentType.none,
      AsyncValue<List<AssetPathEntity>>? albums,
      AsyncValue<List<Widget>>? photos,
      Future<void> Function(File)? onTapFunc,
      bool permissionLock = false,
      PermissionState permissionState = PermissionState.notDetermined}) {
    return _MediaScreenState(
      currentPage: currentPage,
      lastPage: lastPage,
      albumIndex: albumIndex,
      attachmentType: attachmentType,
      albums: albums,
      photos: photos,
      onTapFunc: onTapFunc,
      permissionLock: permissionLock,
      permissionState: permissionState,
    );
  }
}

/// @nodoc
const $MediaScreenState = _$MediaScreenStateTearOff();

/// @nodoc
mixin _$MediaScreenState {
  int get currentPage => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;
  int get albumIndex => throw _privateConstructorUsedError;
  AttachmentType get attachmentType => throw _privateConstructorUsedError;
  AsyncValue<List<AssetPathEntity>>? get albums =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Widget>>? get photos => throw _privateConstructorUsedError;
  Future<void> Function(File)? get onTapFunc =>
      throw _privateConstructorUsedError;
  bool get permissionLock => throw _privateConstructorUsedError;
  PermissionState get permissionState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaScreenStateCopyWith<MediaScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaScreenStateCopyWith<$Res> {
  factory $MediaScreenStateCopyWith(
          MediaScreenState value, $Res Function(MediaScreenState) then) =
      _$MediaScreenStateCopyWithImpl<$Res>;
  $Res call(
      {int currentPage,
      int? lastPage,
      int albumIndex,
      AttachmentType attachmentType,
      AsyncValue<List<AssetPathEntity>>? albums,
      AsyncValue<List<Widget>>? photos,
      Future<void> Function(File)? onTapFunc,
      bool permissionLock,
      PermissionState permissionState});
}

/// @nodoc
class _$MediaScreenStateCopyWithImpl<$Res>
    implements $MediaScreenStateCopyWith<$Res> {
  _$MediaScreenStateCopyWithImpl(this._value, this._then);

  final MediaScreenState _value;
  // ignore: unused_field
  final $Res Function(MediaScreenState) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? albumIndex = freezed,
    Object? attachmentType = freezed,
    Object? albums = freezed,
    Object? photos = freezed,
    Object? onTapFunc = freezed,
    Object? permissionLock = freezed,
    Object? permissionState = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      albumIndex: albumIndex == freezed
          ? _value.albumIndex
          : albumIndex // ignore: cast_nullable_to_non_nullable
              as int,
      attachmentType: attachmentType == freezed
          ? _value.attachmentType
          : attachmentType // ignore: cast_nullable_to_non_nullable
              as AttachmentType,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<AssetPathEntity>>?,
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Widget>>?,
      onTapFunc: onTapFunc == freezed
          ? _value.onTapFunc
          : onTapFunc // ignore: cast_nullable_to_non_nullable
              as Future<void> Function(File)?,
      permissionLock: permissionLock == freezed
          ? _value.permissionLock
          : permissionLock // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionState: permissionState == freezed
          ? _value.permissionState
          : permissionState // ignore: cast_nullable_to_non_nullable
              as PermissionState,
    ));
  }
}

/// @nodoc
abstract class _$MediaScreenStateCopyWith<$Res>
    implements $MediaScreenStateCopyWith<$Res> {
  factory _$MediaScreenStateCopyWith(
          _MediaScreenState value, $Res Function(_MediaScreenState) then) =
      __$MediaScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int currentPage,
      int? lastPage,
      int albumIndex,
      AttachmentType attachmentType,
      AsyncValue<List<AssetPathEntity>>? albums,
      AsyncValue<List<Widget>>? photos,
      Future<void> Function(File)? onTapFunc,
      bool permissionLock,
      PermissionState permissionState});
}

/// @nodoc
class __$MediaScreenStateCopyWithImpl<$Res>
    extends _$MediaScreenStateCopyWithImpl<$Res>
    implements _$MediaScreenStateCopyWith<$Res> {
  __$MediaScreenStateCopyWithImpl(
      _MediaScreenState _value, $Res Function(_MediaScreenState) _then)
      : super(_value, (v) => _then(v as _MediaScreenState));

  @override
  _MediaScreenState get _value => super._value as _MediaScreenState;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? albumIndex = freezed,
    Object? attachmentType = freezed,
    Object? albums = freezed,
    Object? photos = freezed,
    Object? onTapFunc = freezed,
    Object? permissionLock = freezed,
    Object? permissionState = freezed,
  }) {
    return _then(_MediaScreenState(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      albumIndex: albumIndex == freezed
          ? _value.albumIndex
          : albumIndex // ignore: cast_nullable_to_non_nullable
              as int,
      attachmentType: attachmentType == freezed
          ? _value.attachmentType
          : attachmentType // ignore: cast_nullable_to_non_nullable
              as AttachmentType,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<AssetPathEntity>>?,
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Widget>>?,
      onTapFunc: onTapFunc == freezed
          ? _value.onTapFunc
          : onTapFunc // ignore: cast_nullable_to_non_nullable
              as Future<void> Function(File)?,
      permissionLock: permissionLock == freezed
          ? _value.permissionLock
          : permissionLock // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionState: permissionState == freezed
          ? _value.permissionState
          : permissionState // ignore: cast_nullable_to_non_nullable
              as PermissionState,
    ));
  }
}

/// @nodoc

class _$_MediaScreenState implements _MediaScreenState {
  const _$_MediaScreenState(
      {this.currentPage = 0,
      this.lastPage,
      this.albumIndex = -1,
      this.attachmentType = AttachmentType.none,
      this.albums,
      this.photos,
      this.onTapFunc,
      this.permissionLock = false,
      this.permissionState = PermissionState.notDetermined});

  @JsonKey()
  @override
  final int currentPage;
  @override
  final int? lastPage;
  @JsonKey()
  @override
  final int albumIndex;
  @JsonKey()
  @override
  final AttachmentType attachmentType;
  @override
  final AsyncValue<List<AssetPathEntity>>? albums;
  @override
  final AsyncValue<List<Widget>>? photos;
  @override
  final Future<void> Function(File)? onTapFunc;
  @JsonKey()
  @override
  final bool permissionLock;
  @JsonKey()
  @override
  final PermissionState permissionState;

  @override
  String toString() {
    return 'MediaScreenState(currentPage: $currentPage, lastPage: $lastPage, albumIndex: $albumIndex, attachmentType: $attachmentType, albums: $albums, photos: $photos, onTapFunc: $onTapFunc, permissionLock: $permissionLock, permissionState: $permissionState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaScreenState &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.lastPage, lastPage) &&
            const DeepCollectionEquality()
                .equals(other.albumIndex, albumIndex) &&
            const DeepCollectionEquality()
                .equals(other.attachmentType, attachmentType) &&
            const DeepCollectionEquality().equals(other.albums, albums) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            (identical(other.onTapFunc, onTapFunc) ||
                other.onTapFunc == onTapFunc) &&
            const DeepCollectionEquality()
                .equals(other.permissionLock, permissionLock) &&
            const DeepCollectionEquality()
                .equals(other.permissionState, permissionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(lastPage),
      const DeepCollectionEquality().hash(albumIndex),
      const DeepCollectionEquality().hash(attachmentType),
      const DeepCollectionEquality().hash(albums),
      const DeepCollectionEquality().hash(photos),
      onTapFunc,
      const DeepCollectionEquality().hash(permissionLock),
      const DeepCollectionEquality().hash(permissionState));

  @JsonKey(ignore: true)
  @override
  _$MediaScreenStateCopyWith<_MediaScreenState> get copyWith =>
      __$MediaScreenStateCopyWithImpl<_MediaScreenState>(this, _$identity);
}

abstract class _MediaScreenState implements MediaScreenState {
  const factory _MediaScreenState(
      {int currentPage,
      int? lastPage,
      int albumIndex,
      AttachmentType attachmentType,
      AsyncValue<List<AssetPathEntity>>? albums,
      AsyncValue<List<Widget>>? photos,
      Future<void> Function(File)? onTapFunc,
      bool permissionLock,
      PermissionState permissionState}) = _$_MediaScreenState;

  @override
  int get currentPage;
  @override
  int? get lastPage;
  @override
  int get albumIndex;
  @override
  AttachmentType get attachmentType;
  @override
  AsyncValue<List<AssetPathEntity>>? get albums;
  @override
  AsyncValue<List<Widget>>? get photos;
  @override
  Future<void> Function(File)? get onTapFunc;
  @override
  bool get permissionLock;
  @override
  PermissionState get permissionState;
  @override
  @JsonKey(ignore: true)
  _$MediaScreenStateCopyWith<_MediaScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
