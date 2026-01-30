import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/features/network/data/models/response/search_params.dart';
import 'package:bond/features/network/data/repositories/network_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

const int _pageSize = 10;

@injectable
class SearchResultCubit extends Cubit<BaseState<List<HospitalModel>>> {
  final NetworkRepositoryImpl _networkRepository;

  SearchResultCubit(this._networkRepository) : super(BaseState.initial());

  PagingController<int, HospitalModel>? pagingController;
  String totalCount = "0";
  SearchParamsModel? _currentSearchParams;

  // ============================================================================
  // Initialization
  // ============================================================================

  void initPagingController({required SearchParamsModel searchParams}) {
    _currentSearchParams = searchParams;
    pagingController = _buildPagingController(searchParams: searchParams);
  }

  void updateSearchParams(SearchParamsModel searchParams) {
    _currentSearchParams = searchParams;
    pagingController?.refresh();
  }

  PagingController<int, HospitalModel> _buildPagingController({
    required SearchParamsModel searchParams,
  }) {
    late final PagingController<int, HospitalModel> controller;
    controller = PagingController(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final newItems = await _searchForHospitals(
          searchParams: (_currentSearchParams ?? searchParams).copyWith(pageNumber: pageKey),
        );
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          controller.value = controller.value.copyWith(hasNextPage: false);
        }
        return newItems;
      },
    );
    return controller;
  }

  // ============================================================================
  // Search Operations
  // ============================================================================

  Future<List<HospitalModel>> _searchForHospitals({
    required SearchParamsModel searchParams,
  }) async {
    final response = await _networkRepository.searchForTpa(
      searchParamsModel: searchParams,
    );

    return response.fold((failure) => [], (paginationData) {
      if (searchParams.pageNumber == 1) {
        totalCount = paginationData.totalRecords.toString();
        emit(BaseState.success(data: paginationData.data));
      }
      return paginationData.data;
    });
  }

  // ============================================================================
  // Cleanup
  // ============================================================================

  @override
  Future<void> close() {
    pagingController?.dispose();
    return super.close();
  }
}
