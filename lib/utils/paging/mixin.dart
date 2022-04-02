import 'package:aciste/custom_exception.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ### PagingMixin
/// **Please Implement**
/// - Future<List<T>> getPage()
/// - Future<List<T>> getBeforePage()
mixin PagingMixin<T extends PagingItem> on StateNotifier<Pager<T>> {


  void managePage() {
    state.data.whenData((data) => state = state.copyWith(
      firstDoc: data.isNotEmpty ? data.first.doc : null,
      lastDoc: data.isNotEmpty ? data.last.doc : null,
    ));
  }

  // override this method
  Future<List<T>> getPage() async {
    throw UnimplementedError();
  }

  // override this method
  Future<List<T>> getBeforePage() async {
    throw UnimplementedError();
  }

  Future<void> retrievePage() async {
    try {
      final items = await getPage();

      state = state.copyWith(
        data: AsyncValue.data([
          ...(state.data.asData?.value ?? []),
          ...items
        ])
      );

      managePage();
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }

  Future<void> retrieveBeforePage() async {
    try {
      final items = await getBeforePage();

      state = state.copyWith(
        data: AsyncValue.data([
          ...items,
          ...(state.data.asData?.value ?? [])
        ])
      );

      managePage();
    } on CustomException catch (e, st) {
      state = state.copyWith(
        data: AsyncValue.error(e, stackTrace: st)
      );
    }
  }
}