import 'dart:typed_data';
import 'dart:io';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/enums/attachment_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

part 'media_screen_controller.freezed.dart';

@freezed
class MediaScreenState with _$MediaScreenState {
  const factory MediaScreenState({
    @Default(0) int currentPage,
    int? lastPage,
    @Default(-1) int albumIndex,
    @Default(AttachmentType.none) AttachmentType attachmentType, 
    AsyncValue<List<AssetPathEntity>>? albums,
    AsyncValue<List<Widget>>? photos,
    Future<void> Function(File file)? onTapFunc,
    @Default(false) bool permissionLock,
    @Default(PermissionState.notDetermined) PermissionState permissionState,
  }) = _MediaScreenState;
}

final mediaScreenControllerProvider = StateNotifierProvider<MediaScreenController, MediaScreenState>((_) => MediaScreenController());

class MediaScreenController extends StateNotifier<MediaScreenState> {
  MediaScreenController() : super(const MediaScreenState(
    albumIndex: -1,
    albums: AsyncValue.loading(),
    photos: AsyncValue.loading(),
  )) {
    fetchMedia();
  }

  Future<void> handleScrollEvent(ScrollNotification scroll) async {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (state.currentPage != state.lastPage) {
        fetchMedia();
      }
    }
  }

  Future<void> fetchMedia() async {
    state = state.copyWith(
      lastPage: state.currentPage
    );
    var result = PermissionState.notDetermined;
    if (!state.permissionLock) {
      state = state.copyWith(permissionLock: true);
      result = await PhotoManager.requestPermissionExtend();
      state = state.copyWith(
        permissionState: result,
        permissionLock: false
      );
    }
    if (result.isAuth) {
      final albums = await PhotoManager.getAssetPathList(
        hasAll: true,
        type: requestType,
      );
      state = state.copyWith(
        albums: AsyncValue.data(albums),
      );

      if (albums.isNotEmpty) {
        if (state.albumIndex == -1 || state.albumIndex >= albums.length) {
          state = state.copyWith(
            albumIndex: 0
          );
        }
        List<AssetEntity> photos = await albums[state.albumIndex].getAssetListPaged(state.currentPage, 60);

        final widgets = photos.map((asset) => FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: () async {
                    final file = await asset.file;
                    if (file != null) {
                      await state.onTapFunc!(file);
                    }
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data as Uint8List,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (asset.type == AssetType.video)
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5, bottom: 5),
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  )
                );
              }
              return Container();
            },
          ),
        );

        List<Widget> prevPhotos = [GestureDetector(
          onTap: () async {
            final _picker = ImagePicker();
            final photo = await _picker.pickImage(source: ImageSource.camera);
            if (photo == null) {
              return;
            }
            final file = File(photo.path);
            await state.onTapFunc!(file);
          },
          child: Container(
            color: Colors.black45.withOpacity(0.5),
            child: const Center(
              child: Icon(
                Icons.camera_enhance,
                size: 30,
                color: Colors.white,
              )
            )
          )
        )
        ];
        if (state.photos?.asData?.value != null) {
          prevPhotos = state.photos!.asData!.value;
        }
        prevPhotos.addAll(widgets);
        state = state.copyWith(
          photos: AsyncValue.data(prevPhotos),
          currentPage: state.currentPage + 1,
        );
      } else {
        state = state.copyWith(
          albums: const AsyncValue.data([]),
          photos: AsyncValue.data([GestureDetector(
            onTap: () async {
              final _picker = ImagePicker();
              final photo = await _picker.pickImage(source: ImageSource.camera);
              if (photo == null) {
                return;
              }
              final file = File(photo.path);
              await state.onTapFunc!(file);
            },
            child: Container(
              color: Colors.black45.withOpacity(0.5),
              child: const Center(
                child: Icon(
                  Icons.camera_enhance,
                  size: 30,
                  color: Colors.white,
                )
              )
            )
          )
          ]),
          albumIndex: -1,
          lastPage: null,
          currentPage: 0,
        );
      }
    } else {
      //PhotoManager.openSetting();
      state = state.copyWith(
        photos: const AsyncValue.error(CustomException(message: 'Permission Error'))
      );
    }
  }

  Future<void> setIndex({required int index}) async {
    state = state.copyWith(
      albumIndex: index,
      currentPage: 0,
      lastPage: null,
      albums: null,
      photos: null,
    );
    await fetchMedia();
  }

  Future<void> setAttachmentType({required AttachmentType attachmentType}) async {
    state = state.copyWith(
      albumIndex: -1,
      currentPage: 0,
      lastPage: null,
      albums: null,
      photos: null,
      attachmentType: attachmentType,
    );
    await fetchMedia();
  }

  Future<void> setOnTapFunc({required Future<void> Function(File) onTapFunc}) async {
    state = state.copyWith(
      onTapFunc: onTapFunc
    );
  }

  RequestType get requestType {
    switch (state.attachmentType) {
      case AttachmentType.photo:
        return RequestType.image;
      case AttachmentType.none:
        return RequestType.common;
      default:
        throw const CustomException(message: 'メディアに変換できないタイプです');
    }
  }
}