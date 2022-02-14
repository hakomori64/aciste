import 'package:aciste/screens/media_screen/media_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MediaScreen extends HookConsumerWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaScreenState = ref.watch(mediaScreenControllerProvider);
    final photos = mediaScreenState.photos;
    final albums = mediaScreenState.albums;
    final albumIndex = mediaScreenState.albumIndex;

    return Scaffold(
      appBar: AppBar(
        leading: albums == null ? const Center(
          child: CircularProgressIndicator(),
        ) : albums.when(
          data: (data) => PopupMenuButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0)
              )
            ),
            onSelected: (int index) async {
              await ref.read(mediaScreenControllerProvider.notifier).setIndex(index: index);
            },
            child: Container(
              child: Text(
                data[albumIndex].name
              )
            ),
            itemBuilder: (context) => data.asMap().entries.map((entry) => PopupMenuItem<int>(
              value: entry.key,
              child: Text(entry.value.name)
            )).toList()
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  error.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            )
          ),
        )
      ),
      body: photos == null ? const Center(
        child: CircularProgressIndicator(),
      ) : photos.when(
        data: (data) => NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            ref.read(mediaScreenControllerProvider.notifier).handleScrollEvent(scroll);
            return true;
          },
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => data[index],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          )
        ),
      )
    );
  }
}