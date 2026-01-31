import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/response/search_params.dart';
import 'package:bond/features/network/data/models/response/tiers_model.dart';
import 'package:bond/features/network/data/models/response/tpa_model.dart';
import 'package:bond/features/network/network_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search/search_cubit.dart';
import 'expnaned_title_design.dart';

class MainExpandedFilterDesign extends StatefulWidget {
  const MainExpandedFilterDesign({super.key});

  @override
  State<MainExpandedFilterDesign> createState() =>
      _MainExpandedFilterDesignState();
}

class _MainExpandedFilterDesignState extends State<MainExpandedFilterDesign> {
  Tiers? tiers;
  List<MainTiersModel> city = [];
  List<MainTiersModel> area = [];
  List<MainTiersModel> providerType = [];
  List<MainTiersModel> speciality = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, BaseState<List<TpaModel>>>(
      builder: (context, state) {
        SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
        return Container(
          padding: screenPadding(),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              ExpandedTitleDesign(
                onPressed: () => NetworkHelper().showTpaBottomSheet(
                  context: context,
                  onPressed: (indices) {},
                  tpaModel: state.data ?? [],
                  title: context.localizations.tpa,
                ),
                icon: Assets.icons.tpa,
                isChangeSubTitleColor: bloc.selectedTpa != null,
                title: context.localizations.tpa,
                subTitle: bloc.selectedTpa != null
                    ? bloc.selectedTpa!.tpaName.toString()
                    : context.localizations.tpa,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              ExpandedTitleDesign(
                onPressed: () {
                  if (bloc.selectedTpa == null) {
                    AppConstant.showCustomSnakeBar(
                      context,
                      context.localizations.pleaseSelectTpa,
                      false,
                    );
                    return;
                  }
                  NetworkHelper().showCompanyBottomSheet(
                    title: context.localizations.insuranceCompany,
                    context: context,
                    company: bloc.companyList,
                  );
                },
                icon: Assets.icons.insurance,
                isChangeSubTitleColor: bloc.selectedCompany != null,
                title: context.localizations.insuranceCompany,
                subTitle: bloc.selectedCompany != null
                    ? bloc.selectedCompany!.name.toString()
                    : context.localizations.insuranceCompany,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              ExpandedTitleDesign(
                onPressed: () => bloc.tiers.isEmpty
                    ? AppConstant.showToast(
                        msg: context.localizations.thereIsNoCategory,
                      )
                    : NetworkHelper().showBottomSheet(
                        title: NetworkHelper().tiers,
                        isWithConcatenated: false,
                        onPressed: (indices) => setState(() => tiers = indices),
                        context: context,
                        isSingleChoose: true,
                        data: [],
                        initData: [],
                        initTiersData: tiers,
                        tiersData: bloc.tiers,
                      ),
                icon:Assets.icons.category,
                isChangeSubTitleColor: tiers != null,
                title: context.localizations.category,
                subTitle: tiers != null
                    ? tiers!.value.toString()
                    : context.localizations.categoryBody,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              ExpandedTitleDesign(
                onPressed: () => NetworkHelper().showBottomSheet(
                  title: NetworkHelper().city,
                  initData: city,
                  isWithConcatenated: false,
                  initTiersData: null,
                  onPressed: (indices) {
                    if (indices.isNotEmpty) {
                      bloc.filterAreasByCities(indices);
                      setState(() => city = indices);
                    } else {
                      bloc.clearAreas();
                      setState(() {
                        city.clear();
                        area.clear();
                        providerType.clear();
                        speciality.clear();
                      });
                    }
                  },
                  context: context,
                  isSingleChoose: false,
                  data: bloc.cities,
                  tiersData: [],
                ),
                icon: Assets.icons.city,
                isChangeSubTitleColor: city.isNotEmpty,
                title: context.localizations.city,
                subTitle: city.isNotEmpty
                    ? NetworkHelper().handleMainTierModelToString(list: city)
                    : context.localizations.cityBody,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              ExpandedTitleDesign(
                onPressed: () => NetworkHelper().showBottomSheet(
                  title: NetworkHelper().area,
                  initData: area,
                  isWithConcatenated: city.length >= 2,
                  initTiersData: null,
                  onPressed: (indices) {
                    if (indices.isNotEmpty) {
                      bloc.filterProviderTypesByAreas(indices);
                      setState(() => area = indices);
                    } else {
                      bloc.clearProviderTypes();
                      setState(() {
                        area.clear();
                        providerType.clear();
                        speciality.clear();
                      });
                    }
                  },
                  context: context,
                  isSingleChoose: false,
                  data: bloc.areas,
                  tiersData: [],
                ),
                icon: Assets.icons.area,
                isChangeSubTitleColor: area.isNotEmpty,
                title: context.localizations.area,
                subTitle: area.isNotEmpty
                    ? NetworkHelper().handleMainTierModelToString(list: area)
                    : context.localizations.areaBody,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              ExpandedTitleDesign(
                onPressed: () => NetworkHelper().showBottomSheet(
                  title: NetworkHelper().providerType,
                  initData: providerType,
                  initTiersData: null,
                  isWithConcatenated: area.length >= 2,
                  onPressed: (indices) {
                    if (indices.isNotEmpty) {
                      bloc.filterSpecialtiesByProviderTypes(indices);
                      setState(() => providerType = indices);
                    } else {
                      bloc.clearSpecialties();
                      setState(() {
                        providerType.clear();
                        speciality.clear();
                      });
                    }
                  },
                  context: context,
                  isSingleChoose: false,
                  data: bloc.providerTypes,
                  tiersData: [],
                ),
                icon: Assets.icons.providerType,
                title: context.localizations.providerType,
                isChangeSubTitleColor: providerType.isNotEmpty,
                subTitle: providerType.isNotEmpty
                    ? NetworkHelper().handleMainTierModelToString(
                        list: providerType,
                      )
                    : context.localizations.providerTypeBody,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              ExpandedTitleDesign(
                onPressed: () => NetworkHelper().showBottomSheet(
                  title: NetworkHelper().specialty,
                  initData: speciality,
                  isWithConcatenated: providerType.length >= 2,
                  initTiersData: null,
                  onPressed: (indices) => indices.isNotEmpty
                      ? setState(() => speciality = indices)
                      : setState(() => speciality.clear()),
                  context: context,
                  isSingleChoose: false,
                  data: bloc.specialties,
                  tiersData: [],
                ),
                icon:Assets.icons.specialty,
                isChangeSubTitleColor: speciality.isNotEmpty,
                title: context.localizations.specialty,
                subTitle: speciality.isNotEmpty
                    ? NetworkHelper().handleMainTierModelToString(
                        list: speciality,
                      )
                    : context.localizations.specialtyBody,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.1),
              Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                child: CustomButton(
                  text: context.localizations.search,
                  press: () {
                    if (tiers == null) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        context.localizations.tiersValidation,
                        false,
                      );
                      return;
                    }
                    if (city.isEmpty) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        "Please select city first",
                        false,
                      );
                      return;
                    }
                    SearchParamsModel searchParams = SearchParamsModel(
                      company: bloc.selectedCompany!.id.toString(),
                      tpa: bloc.selectedTpa!.tpaId.toString(),
                      area: NetworkHelper().handleMainTierModelToListOfString(
                        list: area,
                      ),
                      city: NetworkHelper().handleMainTierModelToListOfString(
                        list: city,
                      ),
                      providerType: NetworkHelper()
                          .handleMainTierModelToListOfString(
                            list: providerType,
                          ),
                      speciality: NetworkHelper()
                          .handleMainTierModelToListOfString(list: speciality),
                      tiers: tiers!.key.toString(),
                    );
                    context.router.push(
                      SearchResultRoute(searchParamsModel: searchParams),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
