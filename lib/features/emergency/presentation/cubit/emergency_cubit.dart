import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:bond/features/emergency/data/repositories/emergency_repo_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';

import '../../../../core/utils/app_strings.dart';

@injectable
class EmergencyCubit extends Cubit<BaseState<List<EmergencyModel>>>
    with AsyncHandler<List<EmergencyModel>> {
  final EmergencyRepositoryImpl emergencyRepositoryImpl;

  late final PagingController<int, EmergencyModel> pagingController;

  EmergencyCubit(this.emergencyRepositoryImpl) : super(BaseState()) {
    pagingController = _buildPagingController();
  }

  Future<List<EmergencyModel>> _getMyEmergencies({int page = 1}) async {
    final response = await emergencyRepositoryImpl.getMyEmergencies(page: page);
    return response.getOrElse(() => []);
  }

  PagingController<int, EmergencyModel> _buildPagingController() {
    late final PagingController<int, EmergencyModel> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        final newItems = await _getMyEmergencies(page: pageKey);
        final isLastPage = newItems.length < pageSize;
        if (isLastPage) {
          controller.value = controller.value.copyWith(hasNextPage: false);
        }
        return newItems;
      },
    );
    return controller;
  }

  int _nextIntPageKey(
    PagingState<int, EmergencyModel> state, {
    required int firstPageKey,
  }) {
    final keys = state.keys;
    if (keys == null || keys.isEmpty) {
      return firstPageKey;
    }
    return keys.last + 1;
  }
}
