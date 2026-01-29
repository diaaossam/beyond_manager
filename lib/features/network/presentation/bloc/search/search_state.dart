part of 'search_cubit.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class ChangeTPAIndexState extends SearchState {
  final TpaModel tpaModel;

  const ChangeTPAIndexState({required this.tpaModel});
}

class ChangeInsuranceIndexState extends SearchState {
  final int index;

  const ChangeInsuranceIndexState({required this.index});
}

class GetAllTpaLoading extends SearchState {}

class GetAllTpaSuccess extends SearchState {
  final List<TpaModel> tpaList;

  const GetAllTpaSuccess({required this.tpaList});
}

class GetAllTpaError extends SearchState {
  final String errorMsg;

  const GetAllTpaError({required this.errorMsg});
}

class GetAllTiersLoading extends SearchState {}

class GetAllTiersSuccess extends SearchState {}

class GetAllTiersError extends SearchState {
  final String errorMsg;

  const GetAllTiersError({required this.errorMsg});
}


class ClearAreaState extends SearchState{}
class ClearProviderTypeState extends SearchState{}
class ClearSpecialityState extends SearchState{}

class ClearAllDataState extends SearchState{}
