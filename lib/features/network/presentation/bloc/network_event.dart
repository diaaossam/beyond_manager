part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class GetAllTpaEvent extends NetworkEvent {
  @override
  List<Object> get props => [];
}

class SelectedTpaUserEvent extends NetworkEvent {
  final TpaModel tpaModel;
  final bool isAdd;

  const SelectedTpaUserEvent({required this.tpaModel, required this.isAdd});

  @override
  List<Object> get props => [tpaModel, isAdd];
}

class SelectedCompanyEvent extends NetworkEvent {
  final Company company;
  final bool isAdd;

  const SelectedCompanyEvent({required this.company, required this.isAdd});

  @override
  List<Object> get props => [company, isAdd];
}

class GetAllTiersEvent extends NetworkEvent {
  final TpaModel? tpaModel;
  final Company? company;

  const GetAllTiersEvent({this.tpaModel, this.company});

  @override
  List<Object> get props => [tpaModel!, company!];
}

class SelectedTiersEvent extends NetworkEvent {
  final Tiers tiers;
  final bool isAdd;

  const SelectedTiersEvent({required this.tiers, required this.isAdd});

  @override
  List<Object> get props => [tiers, isAdd];
}

class SelectCitiesEvent extends NetworkEvent {
  final MainTiersModel model;
  final List<MainTiersModel> selectedList;

  const SelectCitiesEvent({required this.model, required this.selectedList});

  @override
  List<Object> get props => [model, selectedList];
}
class SelectAreaEvent extends NetworkEvent {
  final MainTiersModel model;
  final List<MainTiersModel> selectedList;

  const SelectAreaEvent({required this.model, required this.selectedList});

  @override
  List<Object> get props => [model, selectedList];
}

class SelectProviderTypeEvent extends NetworkEvent {
  final MainTiersModel model;
  final List<MainTiersModel> selectedList;

  const SelectProviderTypeEvent({required this.model, required this.selectedList});

  @override
  List<Object> get props => [model, selectedList];
}
class SelectSpecialityEvent extends NetworkEvent {
  final MainTiersModel model;
  final List<MainTiersModel> selectedList;

  const SelectSpecialityEvent({required this.model, required this.selectedList});

  @override
  List<Object> get props => [model, selectedList];
}
