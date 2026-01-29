part of 'network_bloc.dart';

abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class GetAllTpaLoading extends NetworkState {}

class GetAllTpaSuccess extends NetworkState {
  final List<TpaModel> tpaList;

  GetAllTpaSuccess({required this.tpaList});
}

class GetAllTpaError extends NetworkState {
  final String errorMsg;

  GetAllTpaError({required this.errorMsg});
}

class SelectTpaModelState extends NetworkState {
  final TpaModel tpaModel;
  final bool isAdd;
  final List<Company> companiesList;

  SelectTpaModelState(
      {required this.tpaModel,
      required this.isAdd,
      required this.companiesList});
}

class SelectCompanyState extends NetworkState {
  final Company company;
  final bool isAdd;

  SelectCompanyState({required this.company, required this.isAdd});
}

class SelectTiersState extends NetworkState {
  final Tiers tiers;
  final bool isAdd;

  SelectTiersState({required this.tiers, required this.isAdd});
}

class SelectCitiesState extends NetworkState {
  final MainTiersModel model;
  final List<MainTiersModel> list;

  SelectCitiesState({required this.model, required this.list});
}

class SelectAreaState extends NetworkState {
  final MainTiersModel model;
  final List<MainTiersModel> list;

  SelectAreaState({required this.model, required this.list});
}
class SelectSpecialtyState extends NetworkState {
  final MainTiersModel model;
  final List<MainTiersModel> list;

  SelectSpecialtyState({required this.model, required this.list});
}

class GetAllTiersLoading extends NetworkState {}

class GetAllTiersSuccess extends NetworkState {
  final TiersModel tiersModel;

  GetAllTiersSuccess({required this.tiersModel});
}

class GetAllTiersError extends NetworkState {
  final String errorMsg;

  GetAllTiersError({required this.errorMsg});
}
