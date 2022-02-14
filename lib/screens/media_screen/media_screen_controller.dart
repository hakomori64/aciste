import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

part 'media_screen_controller.freezed.dart';

@freezed
class MediaScreenState with _$MediaScreenState {
  const factory MediaScreenState({
    @Default(0) int currentPage,
    int? lastPage,
    @Default(-1) int albumIndex,
    AsyncValue<List<AssetPathEntity>>? albums,
    AsyncValue<List<Widget>>? photos,
  }) = _MediaScreenState;
}

final mediaScreenControllerProvider = StateNotifierProvider.autoDispose<MediaScreenController, MediaScreenState>((ref) => MediaScreenController(ref.read));

class MediaScreenController extends StateNotifier<MediaScreenState> {
  MediaScreenController(this._read) : super(const MediaScreenState(
    albumIndex: -1,
    albums: AsyncValue.loading(),
    photos: AsyncValue.loading(),
  )) {
    _fetchMedia();
  }
  final Reader _read;

  Future<void> handleScrollEvent(ScrollNotification scroll) async {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (state.currentPage != state.lastPage) {
        _fetchMedia();
      }
    }
  }

  Future<void> _fetchMedia() async {
    state = state.copyWith(
      lastPage: state.currentPage
    );
    final result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      final albums = await PhotoManager.getAssetPathList(hasAll: true);
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
                return Stack(
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
                );
              }
              return Container();
            },
          ),
        );

        List<Widget> prevPhotos = [Container()];
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
          photos: AsyncValue.data([Container()]),
          albumIndex: -1,
          lastPage: null,
          currentPage: 0,
        );
      }
    } else {
      PhotoManager.openSetting();
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
    await _fetchMedia();
  }
}