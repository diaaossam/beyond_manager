import 'dart:async';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_assets.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/domain/entities/get_active_list_params.dart';
import 'package:beymanger/features/policies/policies_helper.dart';
import 'package:beymanger/features/policies/presentation/cubit/active_policy/active_policy_bloc.dart';
import 'package:beymanger/features/policies/presentation/widgets/active_list/addition_filter.dart';
import 'package:beymanger/features/policies/presentation/widgets/active_list/custom_active_header.dart';
import 'package:beymanger/features/policies/presentation/widgets/active_list/custom_active_list_body.dart';
import 'package:beymanger/features/policies/presentation/widgets/active_list/main_active_list_filter.dart';
import 'package:beymanger/features/policies/presentation/widgets/search_custom_text_form_field.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_text_form_field.dart';
import 'package:beymanger/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import '../../../../../core/excel_helper/excel_helper.dart';
import '../../../../../widgets/custom_app_bar.dart';
import '../../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../../../../network/presentation/widgets/filter_expanded/custom_expanded_widget.dart';
import '../../../data/models/active_list_policy_model.dart';
import 'custom_active_member_card.dart';

class ActiveListBody extends StatefulWidget {
  final int policyId;

  const ActiveListBody({super.key, required this.policyId});

  @override
  State<ActiveListBody> createState() => _ActiveListBodyState();
}

class _ActiveListBodyState extends State<ActiveListBody>
    with TickerProviderStateMixin {
  bool isSearch = false;
  Timer? _debounce;
  late TabController tabController;
  late TabController additionTabController;
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  GetActiveListParams? getActiveListParams;

  int mainIndex = 0;
  int subIndex = 0;

  void _handleMainTabChange(int index) {
    setState(() {
      mainIndex = index;
      isSearch = true;
    });
    if (getActiveListParams != null) {
      String? memberStatus;
      switch (index) {
        case 0:
          memberStatus = 'all';
          break;
        case 1: // Addition
          memberStatus = 'additions';
          break;
        case 2: // Deletion
          memberStatus = 'deletions';
          break;
        case 3:
          memberStatus = null;
          break;
      }
      final clearedParams = getActiveListParams!.copyWith(
        dateFrom: '',
        dateTo: '',
        memberStatus: memberStatus ?? '',
        subStatus: 'all',
        startDateFrom: '',
        startDateTo: '',
        reactivationDateFrom: '',
        reactivationDateTo: '',
        endDateFrom: '',
        endDateTo: '',
        deletionDateFrom: '',
        deletionDateTo: '',
        pageKey: 1,
      );

      getActiveListParams = clearedParams;

      from.clear();
      to.clear();
      subIndex = 0;
      additionTabController.animateTo(0);
      if (index != 3) {
        final bloc = context.read<ActivePolicyBloc>();
        bloc.pagingController.refresh();
        bloc.fetchPage(getActiveListParams: clearedParams);
        setState(() => isSearch = false);
      }
    }
  }

  void _handleSubTabChange(int index) {
    setState(() {
      subIndex = index;
      isSearch = true;
    });

    if (getActiveListParams != null) {
      String? subStatus;

      if (mainIndex == 1) {
        switch (index) {
          case 0: // All Status
            subStatus = "all";
            break;
          case 1: // Under Addition
            subStatus = 'under_addition';
            break;
          case 2: // Added
            subStatus = 'added';
            break;
        }
      } else if (mainIndex == 2) {
        // Deletion tab
        switch (index) {
          case 0: // All Status
            subStatus = "all";
            break;
          case 1: // Under Deletion
            subStatus = 'under_deletion';
            break;
          case 2: // Deleted
            subStatus = 'deleted';
            break;
        }
      }

      getActiveListParams = getActiveListParams!.copyWith(
        subStatus: subStatus ?? '',
        pageKey: 1,
      );

      // Refresh data with new sub-status filter
      final bloc = context.read<ActivePolicyBloc>();
      bloc.pagingController.refresh();
      bloc.fetchPage(getActiveListParams: getActiveListParams!);
      setState(() => isSearch = false);
    }
  }

  void _handleDateFilterChange(String? fromDate, String? toDate) {
    setState(() => isSearch = true);
    if (getActiveListParams != null) {
      String? dateFromField;
      String? dateToField;

      if (mainIndex == 1) {
        dateFromField = 'startDateFrom';
        dateToField = 'startDateTo';
      } else if (mainIndex == 2) {
        dateFromField = 'deletionDateFrom';
        dateToField = 'deletionDateTo';
      }

      if (dateFromField != null && dateToField != null) {
        Map<String, String?> dateParams = {};
        dateParams[dateFromField] = fromDate;
        dateParams[dateToField] = toDate;

        getActiveListParams = getActiveListParams!.copyWith(
          startDateFrom: mainIndex == 1 ? fromDate : '',
          startDateTo: mainIndex == 1 ? toDate : '',
          deletionDateFrom: mainIndex == 2 ? fromDate : '',
          deletionDateTo: mainIndex == 2 ? toDate : '',
          pageKey: 1, // Reset to first page
        );

        // Refresh data with new date filter
        final bloc = context.read<ActivePolicyBloc>();
        bloc.pagingController.refresh();
        bloc.fetchPage(getActiveListParams: getActiveListParams!);
        setState(() => isSearch = false);
      }
    }
  }

  @override
  void initState() {
    final bloc = context.read<ActivePolicyBloc>();
    tabController = TabController(length: 4, vsync: this);
    additionTabController = TabController(length: 3, vsync: this);
    getActiveListParams = GetActiveListParams(
        memberStatus: "all",
        pageSize: 8,
        policyId: widget.policyId,
        pageKey: 1);
    bloc.pagingController.addPageRequestListener((pageKey) {
      if (!isSearch) {
        if (pageKey == 0) {
          pageKey = 1;
        }
        bloc.fetchPage(
            getActiveListParams: getActiveListParams!.copyWith(pageKey: pageKey));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivePolicyBloc, ActivePolicyState>(
      builder: (context, state) {
        final bloc = context.read<ActivePolicyBloc>();
        return Scaffold(
          appBar: CustomAppBar(
            text: context.localizations.activeList,
            isHaveActions:context.read<ActivePolicyBloc>().showExcel,
            onActionPress: () async {
              final list = await context
                  .read<ActivePolicyBloc>()
                  .getActiveList(getActiveListParams:GetActiveListParams(policyId: widget.policyId,));
              ExcelHelper().createActiveListExcel(
                  bigRecord: list,
                  isBusinessLife:
                  context.read<ActivePolicyBloc>().isBusiness ?? true,
                  isMedical:
                  context.read<ActivePolicyBloc>().isMedical ?? true);
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
            child: bloc.isMedical == null
                ? const LoadingWidget()
                : RefreshIndicator(
              onRefresh: () async => bloc.pagingController.refresh(),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: MainActiveListFilter(
                        onTap: _handleMainTabChange,
                        tabController: tabController,
                      )),
                  if (bloc.isMedical!) ...[
                    if (mainIndex != 3) ...[
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: SizeConfig.bodyHeight * .01,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          children: [
                            SvgPicture.asset(AppAssets.search),
                            SizedBox(width: SizeConfig.screenWidth * .015),
                            AppText(
                                text: context.localizations.search,
                                textSize: 16),
                            const Spacer(),
                            AppText(
                                text:
                                "${context.localizations.lastUpdated} ${bloc.lastUpdateDate}")
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: SizeConfig.bodyHeight * .02,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomSearchTextFormField(
                                    hintText: context.localizations.name,
                                    onChange: (value) {
                                      if (_debounce?.isActive ?? false)
                                        _debounce!.cancel();
                                      _debounce = Timer(
                                          const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            getActiveListParams =
                                                getActiveListParams?.copyWith(
                                                    name: value.toString());

                                            bloc.pagingController.refresh();
                                            bloc
                                                .fetchPage(
                                                getActiveListParams:
                                                getActiveListParams!)
                                                .then((_) {
                                              setState(() => isSearch = false);
                                            });
                                          });
                                    },
                                  ),
                                ),
                                SizedBox(
                                    width: SizeConfig.bodyHeight * .01),
                                Expanded(
                                  child: CustomSearchTextFormField(
                                    hintText:
                                    context.localizations.insuranceID,
                                    onChange: (value) {
                                      if (_debounce?.isActive ?? false)
                                        _debounce!.cancel();
                                      _debounce = Timer(
                                          const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            getActiveListParams =
                                                getActiveListParams?.copyWith(
                                                    insuranceId:
                                                    value.toString());

                                            bloc.pagingController.refresh();
                                            bloc
                                                .fetchPage(
                                                getActiveListParams:
                                                getActiveListParams!)
                                                .then((_) {
                                              setState(() => isSearch = false);
                                            });
                                          });
                                    },
                                  ),
                                ),
                                SizedBox(
                                    width: SizeConfig.bodyHeight * .01),
                                Expanded(
                                  child: CustomSearchTextFormField(
                                    hintText: context.localizations.staffId,
                                    onChange: (value) {
                                      if (_debounce?.isActive ?? false)
                                        _debounce!.cancel();
                                      _debounce = Timer(
                                          const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            getActiveListParams =
                                                getActiveListParams?.copyWith(
                                                    staffId: value.toString());

                                            bloc.pagingController.refresh();
                                            bloc
                                                .fetchPage(
                                                getActiveListParams:
                                                getActiveListParams!)
                                                .then((_) {
                                              setState(() => isSearch = false);
                                            });
                                          });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            /* SizedBox(height: SizeConfig.bodyHeight * .01),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomSearchTextFormField(
                                        hintText: context.localizations.staffId,
                                        onChange: (value) {
                                          if (_debounce?.isActive ?? false)
                                            _debounce!.cancel();
                                          _debounce = Timer(
                                              const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            getActiveListParams =
                                                getActiveListParams?.copyWith(
                                                    staffId: value.toString());

                                            bloc.pagingController.refresh();
                                            bloc
                                                .fetchPage(
                                                    getActiveListParams:
                                                        getActiveListParams!)
                                                .then((_) {
                                              setState(() => isSearch = false);
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                        width: SizeConfig.bodyHeight * .01),
                                    Expanded(
                                      child: CustomSearchTextFormField(
                                        hintText:
                                            context.localizations.policyNumber,
                                        onChange: (value) {
                                          if (_debounce?.isActive ?? false)
                                            _debounce!.cancel();
                                          _debounce = Timer(
                                              const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            getActiveListParams =
                                                getActiveListParams?.copyWith(
                                                    policyNumber:
                                                        value.toString());

                                            bloc.pagingController.refresh();
                                            bloc
                                                .fetchPage(
                                                    getActiveListParams:
                                                        getActiveListParams!)
                                                .then((_) {
                                              setState(() => isSearch = false);
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),*/
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: SizeConfig.bodyHeight * .01,
                        ),
                      ),
                    ],
                    if (mainIndex == 1 || mainIndex == 2) ...[
                      SliverToBoxAdapter(
                        child: AdditionFilter(
                          tabController: additionTabController,
                          isAddition: mainIndex == 1,
                          onTap: _handleSubTabChange,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: SizeConfig.bodyHeight * .01,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: InkWell(
                          onTap: () =>
                              PoliciesHelper().showCustomDatePicker(
                                context: context,
                                isSingle: false,
                                map: (p0) {
                                  String fromText = PoliciesHelper()
                                      .formatDateToApi(date: p0['first']);
                                  String? toText = p0['last'] != null
                                      ? PoliciesHelper()
                                      .formatDateToApi(date: p0['last'])
                                      : null;
                                  from.text = fromText;
                                  to.text = toText ?? "";
                                  _handleDateFilterChange(fromText, toText);
                                },
                              ),
                          child: Row(
                            children: [
                              Expanded(
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: CustomTextFormField(
                                    controller: from,
                                    suffixIcon: AppAssets.calender,
                                    hintText:
                                    context.localizations.fromDate,
                                    labelText:
                                    context.localizations.fromDate,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * .02,
                              ),
                              Expanded(
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: CustomTextFormField(
                                    controller: to,
                                    suffixIcon: AppAssets.calender,
                                    hintText: context.localizations.toDate,
                                    labelText: context.localizations.toDate,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: SizeConfig.bodyHeight * .02,
                        ),
                      ),
                    ],
                    if (mainIndex == 3) ...[
                      const SliverToBoxAdapter(child: DashboardScreen()),
                    ]
                  ],
                  if (mainIndex != 3) ...[
                    if (bloc.totalMembers != null)
                      SliverToBoxAdapter(
                        child: AppText(
                            text: "Total Members: ${bloc.totalMembers}"),
                      ),
                    PagedSliverList(
                        pagingController: bloc.pagingController,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder:
                              (context, ActiveListResult item, index) {
                            if (bloc.isBusiness == true) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                child: CustomExpandedWidget(
                                    body: CustomActiveBody(
                                      result: item,
                                      isBusinessLife: true,
                                      currentFilter: mainIndex,
                                    ),
                                    title: CustomActiveHeaderExpanded(
                                      result: item,
                                      isBusinessLife: true,
                                    )),
                              );
                            }
                            if (bloc.isMedical!) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                child: CustomExpandedWidget(
                                    body: CustomActiveBody(
                                      result: item,
                                      currentFilter: mainIndex,
                                      isBusinessLife: false,
                                    ),
                                    title: CustomActiveHeaderExpanded(
                                      result: item,
                                      isBusinessLife: false,
                                    )),
                              );
                            } else {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                child: CustomActiveMemberCardExpanded(
                                  result: item,
                                ),
                              );
                            }
                          },
                        ))
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
