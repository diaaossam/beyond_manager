import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/network/data/models/response/tiers_model.dart';
import 'package:bond/features/network/data/models/response/tpa_model.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/network_repository.dart';

@injectable
class SearchCubit extends Cubit<BaseState<List<TpaModel>>>
    with AsyncHandler<List<TpaModel>> {
  final NetworkRepositoryImpl _networkRepository;

  SearchCubit(this._networkRepository) : super(BaseState.initial());

  // ============================================================================
  // Data Properties
  // ============================================================================

  List<TpaModel> tpaList = [];
  List<Company> companyList = [];
  TpaModel? selectedTpa;
  Company? selectedCompany;

  List<MainTiersModel> _allAreas = [];
  List<MainTiersModel> areas = [];
  List<MainTiersModel> cities = [];

  List<MainTiersModel> _allProviderTypes = [];
  List<MainTiersModel> providerTypes = [];

  List<MainTiersModel> _allSpecialties = [];
  List<MainTiersModel> specialties = [];

  List<Tiers> tiers = [];

  // ============================================================================
  // TPA Operations
  // ============================================================================

  Future<void> getAllTpa() async {
    await handleAsync(
      call: () => _networkRepository.getAllTpa(),
      onSuccess: (data) {
        tpaList = data;
        return data;
      },
      identifier: 'get_all_tpa',
    );
  }

  void selectTpa(TpaModel tpaModel) {
    selectedCompany = null;
    tiers.clear();
    selectedTpa = tpaModel;
    companyList = tpaModel.companies ?? [];
    emit(state.copyWith(data: tpaList,identifier: "select_tpa"));
  }

  void clearAllData() {
    selectedCompany = null;
    selectedTpa = null;
    tpaList.clear();
    companyList.clear();
    tiers.clear();
    areas.clear();
    cities.clear();
    providerTypes.clear();
    specialties.clear();
    emit(BaseState.initial());
  }

  // ============================================================================
  // Tiers Operations
  // ============================================================================

  Future<void> getAllTiers({required Company company}) async {
    tiers.clear();
    selectedCompany = company;

    emit(state.loading(identifier: 'get_all_tiers'));

    final response = await _networkRepository.getAllTiers(
      tpaId: selectedTpa!.tpaId!.toInt(),
      companyId: company.id,
    );

    response.fold(
      (failure) {
        emit(BaseState.failure(
          error: failure.message,
          identifier: 'get_all_tiers',
        ));
      },
      (tiersModel) {
        tiers = tiersModel.tiers ?? [];
        cities = tiersModel.cities ?? [];
        _allAreas = tiersModel.areas ?? [];
        _allProviderTypes = tiersModel.providerTypes ?? [];
        _allSpecialties = tiersModel.specialties ?? [];
        emit(BaseState.success(data: tpaList, identifier: 'get_all_tiers'));
      },
    );
  }

  // ============================================================================
  // Filter Operations
  // ============================================================================

  void filterAreasByCities(List<MainTiersModel> selectedCities) {
    areas.clear();
    for (var city in selectedCities) {
      for (var area in _allAreas) {
        if (area.cityId == city.id) {
          areas.add(area);
        }
      }
    }
  }

  void filterProviderTypesByAreas(List<MainTiersModel> selectedAreas) {
    providerTypes.clear();
    for (var area in selectedAreas) {
      for (var providerType in _allProviderTypes) {
        if (providerType.areaId == area.id) {
          providerTypes.add(providerType);
        }
      }
    }
  }

  void filterSpecialtiesByProviderTypes(
    List<MainTiersModel> selectedProviderTypes,
  ) {
    specialties.clear();
    for (var providerType in selectedProviderTypes) {
      for (var specialty in _allSpecialties) {
        if (specialty.providerTypeId == providerType.id) {
          specialties.add(specialty);
        }
      }
    }
  }

  // ============================================================================
  // Clear Filter Operations
  // ============================================================================

  void clearAreas() {
    areas.clear();
    providerTypes.clear();
    specialties.clear();
    emit(state.copyWith(data: tpaList));
  }

  void clearProviderTypes() {
    providerTypes.clear();
    specialties.clear();
    emit(state.copyWith(data: tpaList));
  }

  void clearSpecialties() {
    specialties.clear();
    emit(state.copyWith(data: tpaList));
  }
}
