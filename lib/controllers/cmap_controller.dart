import 'package:aciste/controllers/auth_controller.dart';
import 'package:aciste/models/cmap.dart';
import 'package:aciste/repositories/cmap_repository.dart';
import 'package:aciste/utils/paging/mixin.dart';
import 'package:aciste/utils/paging/pager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cMapListControllerProvider = StateNotifierProvider<CMapListController, Pager<CMap>>(
  (ref) {
    final user = ref.watch(authControllerProvider);
    return CMapListController(ref.read, user?.uid);
  }
);

class CMapListController extends StateNotifier<Pager<CMap>> with PagingMixin<CMap> {
  final Reader _read;
  final String? _userId;

  CMapListController(this._read, this._userId) : super(const Pager<CMap>()) {
    if (_userId != null) {
      retrievePage();
    }
  }

  @override
  Future<List<CMap>> getPage() async {
    return _read(cMapRepositoryProvider(CMapRepositoryParams(userId: _userId!))).retrievePage();
  }

  @override
  Future<List<CMap>> getBeforePage() async {
    return _read(cMapRepositoryProvider(CMapRepositoryParams(userId: _userId!))).retrieveBeforePage();
  }
}