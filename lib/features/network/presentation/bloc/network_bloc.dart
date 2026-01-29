import 'dart:async';

import 'package:bond/features/network/data/models/tiers_model.dart';
import 'package:bond/features/network/data/models/tpa_model.dart';
import 'package:bond/features/network/domain/usecases/get_all_tiers_use_case.dart';
import 'package:bond/features/network/domain/usecases/get_all_tpa_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';

part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final GetAllTpaUseCase getAllTpaUseCase;
  final GetAllTiersUseCase getAllTiersUseCase;
  List<TpaModel> tpaList = [];
  List<Company> comapnyList = [];
  TpaModel? selectedTpaModel;
  Company? selectedComapny;
  Tiers ? selectedTiers;
  List<Tiers> tiers = [];
  List<MainTiersModel> cities = [];
  List<MainTiersModel> selectedCities = [];
  List<MainTiersModel> area = [];
  List<MainTiersModel> selectedArea = [];
  List<MainTiersModel> providerType = [];
  List<MainTiersModel> selectedProviderType = [];

  List<MainTiersModel> specialty = [];
  List<MainTiersModel> selectedSpecialty = [];
  TiersModel ?  tiersModel;

  NetworkBloc(this.getAllTpaUseCase, this.getAllTiersUseCase)
      : super(NetworkInitial()) {
    on<GetAllTpaEvent>(_getAllTpa);
    on<SelectedTpaUserEvent>((event, emit) {
      if (event.isAdd) {
        selectedTpaModel = event.tpaModel;
        comapnyList = event.tpaModel.companies ?? [];
      } else {
        selectedTpaModel = null;
        selectedComapny = null;
        comapnyList.clear();
      }
      emit(SelectTpaModelState(
          tpaModel: event.tpaModel,
          isAdd: event.isAdd,
          companiesList: comapnyList));
    });
    on<SelectedCompanyEvent>(
      (event, emit) {
        if (event.isAdd) {
          selectedComapny = event.company;
          add(GetAllTiersEvent(
              tpaModel: selectedTpaModel, company: selectedComapny));
        } else {
          selectedComapny = null;
        }
        emit(SelectCompanyState(company: event.company, isAdd: event.isAdd));
      },
    );
    on<GetAllTiersEvent>(
      (event, emit) async {
        emit(GetAllTiersLoading());
        final response = await getAllTiersUseCase(
            tpaId: selectedTpaModel!.tpaId!.toInt(),
            companyId: selectedComapny!.id);
        emit(response.fold((l) => GetAllTiersError(errorMsg: l.message), (r) {
          tiersModel = r;
          tiers = r.tiers ?? [];
          cities = r.cities ?? [];
          return GetAllTiersSuccess(tiersModel: r);
        }));
      },
    );

    on<SelectedTiersEvent>((event, emit) {
      if (event.isAdd) {
        selectedTiers = event.tiers;
      } else {
        selectedComapny = null;
      }
      emit(SelectTiersState(tiers: event.tiers, isAdd: event.isAdd));
    },);
    on<SelectCitiesEvent>((event, emit) {
      if(selectedCities.contains(event.model)){
        selectedCities.remove(event.model);
        List<MainTiersModel> allArea = tiersModel?.areas??[];
        for (var ele in allArea) {
          if (ele.cityId == event.model.id) {
            area.remove(ele);
          }
        }

      }
      else{
        selectedCities.add(event.model);
        List<MainTiersModel> allArea = tiersModel?.areas??[];
          for (var ele in allArea) {
            if (ele.cityId == event.model.id) {
              area.add(ele);
          }
        }

      }
      emit(SelectCitiesState(list: selectedCities,model: event.model));
    },);
    on<SelectAreaEvent>((event, emit) {
      if(selectedArea.contains(event.model)){
        selectedArea.remove(event.model);
        List<MainTiersModel> allProviderType = tiersModel?.providerTypes??[];
        for (var element in allProviderType) {
          if (element.areaId == event.model.id) {
            providerType.remove(element);
          }
        }
      }else{
        selectedArea.add(event.model);
        List<MainTiersModel> allProviderType = tiersModel?.providerTypes??[];
        for (var element in allProviderType) {
          if (element.areaId == event.model.id) {
            providerType.add(element);
          }
        }
      }
      emit(SelectAreaState(list: selectedArea,model: event.model));
    },);
    on<SelectProviderTypeEvent>((event, emit) {
      if(selectedProviderType.contains(event.model)){
        selectedProviderType.remove(event.model);
        List<MainTiersModel> allSpeciality = tiersModel?.specialties??[];
        for (var element in allSpeciality) {
          if (element.providerTypeId == event.model.id) {
            specialty.remove(element);
          }
        }
      }
      else{
        selectedProviderType.add(event.model);
        List<MainTiersModel> allSpeciality = tiersModel?.specialties??[];
        for (var element in allSpeciality) {
          if (element.providerTypeId == event.model.id) {
            specialty.add(element);
          }
        }
      }
      emit(SelectSpecialtyState(list: selectedProviderType,model: event.model));
    },);
    on<SelectSpecialityEvent>((event, emit) {
      if(selectedSpecialty.contains(event.model)){
        selectedSpecialty.remove(event.model);
      }
      else{
        selectedSpecialty.add(event.model);
      }
      emit(SelectSpecialtyState(list: selectedSpecialty,model: event.model));
    },);
  }

  FutureOr<void> _getAllTpa(
      GetAllTpaEvent event, Emitter<NetworkState> emit) async {
    emit(GetAllTpaLoading());
    final response = await getAllTpaUseCase();
    response.fold((l) => emit(GetAllTpaError(errorMsg: l.message)), (r) async {
      tpaList = r;
      emit(GetAllTpaSuccess(tpaList: r));
    });
  }
}
