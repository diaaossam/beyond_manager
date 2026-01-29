import 'package:bond/features/network/data/models/tiers_model.dart';
import 'package:bond/features/network/data/models/tpa_model.dart';
import 'package:bond/features/network/domain/usecases/get_all_tiers_use_case.dart';
import 'package:bond/features/network/domain/usecases/get_all_tpa_use_case.dart';
import 'package:bloc/bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetAllTpaUseCase getAllTpaUseCase;
  final GetAllTiersUseCase getAllTiersUseCase;

  List<TpaModel> tpaList = [];
  List<Company> comapnyList = [];
  TpaModel? chosenTpaModel;
  Company? chosenComapny;
  List<MainTiersModel> _allArea = [];
  List<MainTiersModel> area = [];
  List<MainTiersModel> cities = [];
  List<MainTiersModel> _allProviderType = [];
  List<MainTiersModel> providerType = [];
  List<MainTiersModel> _allSpecialty = [];
  List<MainTiersModel> specialty = [];
  List<Tiers> tiers = [];

  SearchCubit(this.getAllTpaUseCase, this.getAllTiersUseCase)
      : super(SearchInitial());

  Future<void> changeTPAIndex(TpaModel tpaModel) async {
    chosenComapny = null;
    tiers.clear();
    chosenTpaModel = tpaModel;
    comapnyList = tpaModel.companies ?? [];
    emit(ChangeTPAIndexState(tpaModel: tpaModel));
  }


  void clearData(){
    chosenComapny = null;
    chosenTpaModel = null;
    tpaList.clear();
    emit(ClearAllDataState());
  }
  Future<void> getAllTpa() async {
    emit(GetAllTpaLoading());
    final response = await getAllTpaUseCase();
    response.fold((l) => emit(GetAllTpaError(errorMsg: l.message)), (r) async {
      tpaList = r;
      emit(GetAllTpaSuccess(tpaList: r));
    });
  }

  Future<void> getAllTiers({required Company selectedCompany}) async {
    tiers.clear();
    emit(GetAllTiersLoading());
    chosenComapny = selectedCompany;
    final response = await getAllTiersUseCase(
        tpaId: chosenTpaModel!.tpaId!.toInt(), companyId: selectedCompany.id);
    emit(response.fold((l) => GetAllTiersError(errorMsg: l.message), (r) {
      tiers = r.tiers ?? [];
      cities = r.cities ?? [];
      _allArea = r.areas ?? [];
      _allProviderType = r.providerTypes ?? [];
      _allSpecialty = r.specialties ?? [];
      return GetAllTiersSuccess();
    }));
  }

  void chooseAreaFromCities(List<MainTiersModel> cities) {
    area.clear();
    for (var element in cities) {

      for (var ele in _allArea) {
        if (ele.cityId == element.id) {
          area.add(ele);
        }
      }
    }
  }

  void chooseProviderTypeFromArea(List<MainTiersModel> selectedArea) {
    providerType.clear();
    for (var element in selectedArea) {
      for (var ele in _allProviderType) {
        if (ele.areaId == element.id) {
          providerType.add(ele);
        }
      }
    }

  }

  void chooseSpecialtyFromProviderType(List<MainTiersModel> selectedProviderType) {
    specialty.clear();
    for (var element in selectedProviderType) {
      for (var ele in _allSpecialty) {
        if (ele.providerTypeId == element.id) {
          specialty.add(ele);
        }
      }
    }
  }

  void clearArea() {
    area.clear();
    providerType.clear();
    specialty.clear();
    emit(ClearAreaState());
  }

  void clearProviderType() {
    providerType.clear();
    specialty.clear();
    emit(ClearProviderTypeState());
  }

  void clearSpeciality() {
    specialty.clear();
    emit(ClearSpecialityState());
  }
}
