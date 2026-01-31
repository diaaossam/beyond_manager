import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../car_service_helper.dart';
import '../../data/models/company_model.dart';
import '../../data/models/service_center_params.dart';
import '../cubit/car_service_cubit.dart';
import '../pages/car_service_result.dart';
import 'expanded_title_design.dart';

class CarServiceBody extends StatefulWidget {
  const CarServiceBody({super.key});

  @override
  State<CarServiceBody> createState() => _CarServiceBodyState();
}

class _CarServiceBodyState extends State<CarServiceBody> {
  String? company, brand, area, city, centerType;
  CompanyModel? selectedCompany;
  ServiceParams params = ServiceParams();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarServiceCubit, BaseState<CarServiceData>>(
      builder: (context, state) {
        final cubit = context.read<CarServiceCubit>();
        final data = state.data ?? CarServiceData();
        return Container(
          padding: screenPadding(),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              ExpandedTitleDesign(
                onPressed: () => showBottomSheetChoose(
                  titleText: context.localizations.insuranceCompany,
                  onPressed: (indices) {
                    setState(() {
                      company = (indices as CompanyModel).insuranceCompany;
                      selectedCompany = indices;
                      brand = null;
                      area = null;
                    });
                    params = params.copyWith(
                      company: (indices as CompanyModel).insuranceCompany,
                      resetArea: true,
                      resetBrand: true,
                    );
                    cubit.searchForCenters(params: params);
                  },
                  context: context,
                  data: [],
                  dataCompany: data.insuranceCompany,
                  initCompany: selectedCompany,
                ),
                icon: Assets.icons.insurance,
                isChangeSubTitleColor: company != null,
                title: context.localizations.insuranceCompany,
                subTitle: company ?? context.localizations.selectCompany,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              ExpandedTitleDesign(
                onPressed: () {
                  if (company == null) {
                    AppConstant.showCustomSnakeBar(
                      context,
                      context.localizations.pleaseSelectTheInsuranceCompany,
                      false,
                    );
                    return;
                  }
                  showBottomSheetChoose(
                    titleText: context.localizations.vehicleBrand,
                    onPressed: (indices) {
                      setState(() => brand = indices);
                      params = params.copyWith(brand: indices);
                      cubit.searchForCenters(params: params, isVehicle: true);
                    },
                    context: context,
                    data: data.vehicleBrand,
                  );
                },
                icon: Assets.icons.vihecleBrand,
                isChangeSubTitleColor: brand != null,
                title: context.localizations.vehicleBrand,
                subTitle: brand ?? context.localizations.selectBranch,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              ExpandedTitleDesign(
                onPressed: () {
                  if (company == null) {
                    AppConstant.showCustomSnakeBar(
                      context,
                      context.localizations.pleaseSelectTheInsuranceCompany,
                      false,
                    );
                    return;
                  }
                  showBottomSheetChoose(
                    titleText: context.localizations.cityBody,
                    onPressed: (indices) {
                      setState(() => area = indices);
                      params = params.copyWith(city: indices);
                      cubit.searchForCenters(params: params, isArea: true);
                    },
                    context: context,
                    data: data.area,
                  );
                },
                icon: Assets.icons.city,
                isChangeSubTitleColor: area != null,
                title: context.localizations.city,
                subTitle: area ?? context.localizations.selectCity,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.06),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      backgroundColor: Colors.transparent,
                      textColor: context.colorScheme.primary,
                      text: context.localizations.resetDetails,
                      press: () {
                        setState(() {
                          company = null;
                          brand = null;
                          area = null;
                          centerType = null;
                        });
                        cubit.resetResultData();
                      },
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth * .04),
                  Expanded(
                    child: CustomButton(
                      text: data.serviceCenterList.isEmpty
                          ? context.localizations.search
                          : "${context.localizations.showResult} (${data.serviceCenterList.length})",
                      press: () {
                        if (data.serviceCenterList.isEmpty) {
                          AppConstant.showCustomSnakeBar(
                            context,
                            context.localizations.noServiceCenterFound,
                            false,
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarServiceResult(
                              list: data.serviceCenterList,
                              companyModel: selectedCompany!,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
