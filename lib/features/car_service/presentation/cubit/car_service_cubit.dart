import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/helper/async_handler.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../data/models/company_model.dart';
import '../../data/models/service_center_model.dart';
import '../../data/models/service_center_params.dart';
import '../../data/repositories/car_service_repository_impl.dart';

class CarServiceData {
  final List<CompanyModel> insuranceCompany;
  final List<String> vehicleBrand;
  final List<String> area;
  final List<ServiceCenterModel> serviceCenterList;

  CarServiceData({
    this.insuranceCompany = const [],
    this.vehicleBrand = const [],
    this.area = const [],
    this.serviceCenterList = const [],
  });

  CarServiceData copyWith({
    List<CompanyModel>? insuranceCompany,
    List<String>? vehicleBrand,
    List<String>? area,
    List<ServiceCenterModel>? serviceCenterList,
  }) {
    return CarServiceData(
      insuranceCompany: insuranceCompany ?? this.insuranceCompany,
      vehicleBrand: vehicleBrand ?? this.vehicleBrand,
      area: area ?? this.area,
      serviceCenterList: serviceCenterList ?? this.serviceCenterList,
    );
  }
}

@injectable
class CarServiceCubit extends Cubit<BaseState<CarServiceData>>
    with AsyncHandler<CarServiceData> {
  final CarServiceRepositoryImpl repository;

  CarServiceCubit(this.repository)
      : super(BaseState.initial(data: CarServiceData())) {
    getAllCompanies();
  }

  Future<void> searchForCenters({
    required ServiceParams params,
    bool isArea = false,
    bool isVehicle = false,
  }) async {
    await handleAsync(
      call: () => repository.getServiceCenters(params: params),
      onSuccess: (serviceCenters) {
        _fillFilteredList(
          list: serviceCenters,
          isArea: isArea,
          isVehicle: isVehicle,
        );
        return state.data!.copyWith(serviceCenterList: serviceCenters);
      },
      identifier: 'search_service_centers',
    );
  }

  void _fillFilteredList({
    required List<ServiceCenterModel> list,
    bool isArea = false,
    bool isVehicle = false,
  }) {
    List<String>? newArea;
    List<String>? newVehicleBrand;

    if (!isArea) {
      newArea = list.map((e) => e.city).whereType<String>().toSet().toList();
    }
    if (!isVehicle) {
      newVehicleBrand =
          list.map((e) => e.vehicleBrand).whereType<String>().toSet().toList();
    }

    if (newArea != null || newVehicleBrand != null) {
      emit(state.copyWith(
        data: state.data!.copyWith(
          area: newArea,
          vehicleBrand: newVehicleBrand,
        ),
      ));
    }
  }

  void resetResultData() {
    emit(state.copyWith(
      data: state.data!.copyWith(serviceCenterList: []),
    ));
  }

  Future<void> getAllCompanies() async {
    await handleAsync(
      call: () => repository.getInsuranceCompany(),
      onSuccess: (companies) =>
          state.data!.copyWith(insuranceCompany: companies),
      identifier: 'get_companies',
    );
  }
}
