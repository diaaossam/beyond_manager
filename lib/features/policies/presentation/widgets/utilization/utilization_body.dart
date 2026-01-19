import 'dart:async';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_assets.dart';
import 'package:beymanger/core/utils/app_constant.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/utilization_policy_model.dart';
import 'package:beymanger/features/policies/domain/entities/get_active_list_params.dart';
import 'package:beymanger/features/policies/presentation/cubit/utilization/utilization_bloc.dart';
import 'package:beymanger/features/policies/presentation/pages/web_view_screen.dart';
import 'package:beymanger/features/policies/presentation/widgets/search_custom_text_form_field.dart';
import 'package:beymanger/features/policies/presentation/widgets/utilization/custom_utilization_body.dart';
import 'package:beymanger/features/policies/presentation/widgets/utilization/custom_utilization_header.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_button.dart';
import 'package:beymanger/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../network/presentation/widgets/filter_expanded/custom_expanded_widget.dart';
import 'utilization_card.dart';

class UtilitzationBody extends StatefulWidget {
  final int policyId;

  const UtilitzationBody({super.key, required this.policyId});

  @override
  State<UtilitzationBody> createState() => _UtilitzationBodyState();
}

class _UtilitzationBodyState extends State<UtilitzationBody> {
  bool isSearch = false;
  GetActiveListParams ? getActiveListParams;

  @override
  void initState() {
    final bloc = context.read<UtilizationBloc>();
    bloc.pagingController.addPageRequestListener((pageKey) {
      if (!isSearch) {
        if (pageKey == 0) {
          pageKey = 1;
          getActiveListParams =  GetActiveListParams(pageSize: 8, policyId: widget.policyId, pageKey: pageKey);
        }
        bloc.fetchPage(getActiveListParams:getActiveListParams!.copyWith(pageKey: pageKey));
      }
    });
    super.initState();
  }
  Timer ? _debounce;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UtilizationBloc, UtilizationState>(
      builder: (context, state) {
        final bloc = context.read<UtilizationBloc>();
        if(bloc.isMedical == null){
          return const LoadingWidget();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Visibility(
                  visible: bloc.isMedical!,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.search),
                      SizedBox(width: SizeConfig.screenWidth * .015),
                      AppText(text: context.localizations.search, textSize: 16),
                      const Spacer(),
                      AppText(
                          text:
                              "${context.localizations.lastUpdated} ${bloc.lastUpdateDate}")
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: bloc.isMedical!,
                  child: SizedBox(
                    height: SizeConfig.bodyHeight * .02,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: bloc.isMedical!,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomSearchTextFormField(
                              hintText: context.localizations.name,
                              onChange: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(const Duration(milliseconds: 300), () {
                                  setState(() {
                                    isSearch = true;
                                  });
                                  getActiveListParams = getActiveListParams?.copyWith(memberName: value.toString());
                                  bloc.pagingController.refresh();
                                  bloc.fetchPage(getActiveListParams: getActiveListParams!).then((_) {
                                    setState(() => isSearch = false);
                                  });
                                });
                              },
                            ),
                          ),
                          SizedBox(width: SizeConfig.bodyHeight * .01),
                          Expanded(
                            child: CustomSearchTextFormField(
                              hintText: context.localizations.insuranceID,
                              onChange: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(const Duration(milliseconds: 300), () {
                                  setState(() {
                                    isSearch = true;
                                  });
                                  getActiveListParams = getActiveListParams?.copyWith(insuranceId: value.toString());
                                  bloc.pagingController.refresh();
                                  bloc.fetchPage(getActiveListParams: getActiveListParams!).then((_) {
                                    setState(() => isSearch = false);
                                  });
                                });
                              },
                            ),
                          ),
                          SizedBox(width: SizeConfig.bodyHeight * .01),

                          Expanded(
                            child: CustomSearchTextFormField(
                              hintText: context.localizations.staffId,
                              onChange: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(const Duration(milliseconds: 300), () {
                                  setState(() {
                                    isSearch = true;
                                  });
                                  getActiveListParams = getActiveListParams?.copyWith(staffId: value.toString());
                                  bloc.pagingController.refresh();
                                  bloc.fetchPage(getActiveListParams: getActiveListParams!).then((_) {
                                    setState(() => isSearch = false);
                                  });
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                     /* Row(
                        children: [
                          Expanded(
                            child: CustomSearchTextFormField(
                              hintText: context.localizations.staffId,
                              onChange: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(const Duration(milliseconds: 300), () {
                                  setState(() {
                                    isSearch = true;
                                  });
                                  getActiveListParams = getActiveListParams?.copyWith(staffId: value.toString());
                                  bloc.pagingController.refresh();
                                  bloc.fetchPage(getActiveListParams: getActiveListParams!).then((_) {
                                    setState(() => isSearch = false);
                                  });
                                });
                              },
                            ),
                          ),
                          SizedBox(width: SizeConfig.bodyHeight * .01),
                          Expanded(
                            child: CustomSearchTextFormField(
                              hintText: context.localizations.policyNumber,
                              onChange: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(const Duration(milliseconds: 300), () {
                                  setState(() {
                                    isSearch = true;
                                  });
                                  getActiveListParams = getActiveListParams?.copyWith(policyNumber: value.toString());
                                  bloc.pagingController.refresh();
                                  bloc.fetchPage(getActiveListParams: getActiveListParams!).then((_) {
                                    setState(() => isSearch = false);
                                  });
                                });
                              },
                            ),
                          ),

                        ],
                      ),*/
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      CustomButton(
                          isActive: bloc.dashboardUrl.isNotEmpty,
                          text: "Utilization Dashboard",
                          press: () {
                            if (bloc.dashboardUrl.isEmpty) {
                              AppConstant.showCustomSnakeBar(
                                  context, "There is no data ", false);
                            } else {
                              AppConstant.navigateTo(context: context, widget: WebViewScreen(url: bloc.dashboardUrl));
                            }
                          }),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: SizeConfig.bodyHeight * .02,
                ),
              ),
              PagedSliverList(
                  pagingController: bloc.pagingController,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, Utilization item, index) {
                      if(bloc.isMedical!){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CustomExpandedWidget(
                              body: CustomUtilizationBody(
                                result: item,
                              ),
                              title: CustomUtilizationHeaderExpanded(
                                result: item,
                              )),
                        );
                      }else{
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CustomUtilizationCardExpanded(result: item,),
                        );
                      }
                    },
                  ))
            ],
          ),
        );
      },
    );
  }
}
