import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/car_service/data/models/company_model.dart';
import 'package:bond/features/car_service/data/models/service_center_model.dart';
import 'package:bond/features/car_service/data/models/service_center_params.dart';
import 'package:bond/features/car_service/domain/usecases/get_insurance_company_use_case.dart';
import 'package:bond/features/car_service/domain/usecases/get_service_centers_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CarServiceCubit extends Cubit<BaseState<List<ServiceCenterModel>>>
    with AsyncHandler<List<ServiceCenterModel>> {
  final GetInsuranceCompanyUseCase getInsuranceCompanyUseCase;
  final GetServiceCentersUseCase getServiceCentersUseCase;

  CarServiceCubit(
    this.getInsuranceCompanyUseCase,
    this.getServiceCentersUseCase,
  ) : super(BaseState.initial());

  List<CompanyModel> insuranceCompany = [];
  List<String> vehicleBrand = [];
  List<String> area = [];
  List<ServiceCenterModel> serviceCenterList = [];

  Future<void> getAllCompanies() async {
    final response = await getInsuranceCompanyUseCase();
    response.fold(
      (l) {},
      (r) {
        insuranceCompany = r;
      },
    );
  }

  Future<void> searchForCenters({
    required ServiceParams params,
    bool isArea = false,
    bool isVehicle = false,
  }) async {
    await handleAsync(
      call: () => getServiceCentersUseCase(params: params),
      onSuccess: (data) {
        serviceCenterList = data;
        _fillFilteredList(
          list: data,
          isArea: isArea,
          isVehicle: isVehicle,
        );
        return data;
      },
      identifier: 'search_centers',
    );
  }

  void _fillFilteredList({
    required List<ServiceCenterModel> list,
    bool isArea = false,
    bool isVehicle = false,
  }) {
    if (!isArea) {
      area = list.map((e) => e.city).whereType<String>().toSet().toList();
    }
    if (!isVehicle) {
      vehicleBrand = list
          .map((e) => e.vehicleBrand)
          .whereType<String>()
          .toSet()
          .toList();
    }
  }

  void resetResultData() {
    serviceCenterList.clear();
    emit(BaseState.initial());
  }
}
