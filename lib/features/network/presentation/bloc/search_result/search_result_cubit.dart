import 'package:bloc/bloc.dart';
import 'package:bond/features/network/data/models/hospital_model.dart';
import 'package:bond/features/network/data/models/search_params.dart';
import 'package:bond/features/network/domain/usecases/search_for_tpa_use_case.dart';
import 'package:injectable/injectable.dart';

part 'search_result_state.dart';

@injectable
class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchForTpaUseCase) : super(SearchResultInitial());
  final SearchForTpaUseCase searchForTpaUseCase;
  List<HospitalModel> hospitalList = [];
  String count = "1";

  Future<List<HospitalModel>> searchForTpa({
    required SearchParamsModel searchParamsModel,
  }) async {
    emit(GetAllTpaResultLoading());
    List<HospitalModel> data = [];
    final response = await searchForTpaUseCase(
      searchParamsModel: searchParamsModel,
    );
    response.fold(
      (l) {
        data = [];
        emit(GetAllTpaResultFailure(errorMsg: l.message));
      },
      (r) {
        if (searchParamsModel.pageNumber == 1) {
          count = r['count']?.toString() ?? '1';
          final hospitals = r['hospitals'] as List<HospitalModel>;
          hospitalList = hospitals;
          emit(GetAllTpaResultSuccess(
            list: hospitals,
            searchParamsModel: searchParamsModel,
          ));
        }
        data = r['hospitals'] as List<HospitalModel>;
      },
    );
    return data;
  }

  void resetSearch() {
    hospitalList = [];
    count = "1";
    emit(SearchResultInitial());
  }
}
