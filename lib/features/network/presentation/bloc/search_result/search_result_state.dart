part of 'search_result_cubit.dart';

abstract class SearchResultState  {
  const SearchResultState();
}

class SearchResultInitial extends SearchResultState {
}
class InitHospitalList extends SearchResultState {
  final List<HospitalModel> value;

  const InitHospitalList({required this.value});
}
class SearchHospitalList extends SearchResultState {
  final List<HospitalModel> value;

  const SearchHospitalList({required this.value});
}

class ClearSearchList extends SearchResultState {
  final List<HospitalModel> value;

  const ClearSearchList({required this.value});
}


class GetAllTpaResultLoading extends SearchResultState {}

class GetAllTpaResultSuccess extends SearchResultState {
  final List<HospitalModel> list;
  final SearchParamsModel searchParamsModel;

  const GetAllTpaResultSuccess(
      {required this.list, required this.searchParamsModel});
}

class GetAllTpaResultFailure extends SearchResultState {
  final String errorMsg;

  const GetAllTpaResultFailure({required this.errorMsg});
}