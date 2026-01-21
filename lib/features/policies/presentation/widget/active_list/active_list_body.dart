import 'dart:async';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:bond/features/policies/presentation/cubit/active_policy/active_policy_bloc.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../config/helper/excel_helper.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/custom_expanded_tile_design.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../policies_helper.dart';
import '../demographics_dashboard.dart';
import 'addition_filter.dart';
import 'custom_active_header.dart';
import 'custom_active_list_body.dart';
import 'custom_active_member_card.dart';
import 'main_active_list_filter.dart';

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

  ActiveListParams? getActiveListParams;
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
        final bloc = context.read<ActivePolicyCubit>();
        bloc.pagingController.refresh();
        bloc.fetchActiveList(params: clearedParams);
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
      final bloc = context.read<ActivePolicyCubit>();
      bloc.pagingController.refresh();
      bloc.fetchActiveList(params: getActiveListParams!);
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
        final bloc = context.read<ActivePolicyCubit>();
        bloc.pagingController.refresh();
        bloc.fetchActiveList(params: getActiveListParams!);
        setState(() => isSearch = false);
      }
    }
  }

  @override
  void initState() {
    final bloc = context.read<ActivePolicyCubit>();
    tabController = TabController(length: 4, vsync: this);
    additionTabController = TabController(length: 3, vsync: this);
    getActiveListParams = ActiveListParams(
      memberStatus: "all",
      pageSize: 8,
      policyId: widget.policyId,
      pageKey: 1,
    );
    bloc.fetchActiveList(params: getActiveListParams!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivePolicyCubit, BaseState<ActiveListModel>>(
      builder: (context, state) {
        final bloc = context.read<ActivePolicyCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            title: context.localizations.activeList,
            actions: [
              if ((state.data?.result ?? []).isNotEmpty)
                InkWell(
                  onTap: () async {
                    final response = await context
                        .read<ActivePolicyCubit>()
                        .policiesRepositoryImpl
                        .getActivePolicy(
                          activeListParams: ActiveListParams(
                            policyId: widget.policyId,
                          ),
                        );
                    final model = response.getOrElse(() => ActiveListModel());
                    ExcelHelper().createActiveListExcel(
                      bigRecord: model.result ?? [],
                      isBusinessLife: model.isLife ?? true,
                      isMedical: model.isMedical ?? true,
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .04,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: AppImage.asset(Assets.icons.excel),
                        ),
                        AppImage.asset(Assets.icons.downloadExcel),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          body: state.builder(
            onTapRetry: () => bloc.fetchActiveList(params: ActiveListParams(policyId: 1)),
            onSuccess: (data) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .04,
              ),
              child: RefreshIndicator(
                onRefresh: () async => context
                    .read<ActivePolicyCubit>()
                    .pagingController
                    .refresh(),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: MainActiveListFilter(
                        onTap: _handleMainTabChange,
                        tabController: tabController,
                      ),
                    ),
                    if (data.isMedical!) ...[
                      if (mainIndex != 3) ...[
                        SliverToBoxAdapter(
                          child: SizedBox(height: SizeConfig.bodyHeight * .01),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              AppImage.asset(Assets.icons.search),
                              SizedBox(width: SizeConfig.screenWidth * .015),
                              AppText(
                                text: context.localizations.search,
                                textSize: 16,
                              ),
                              const Spacer(),
                              AppText(
                                text:
                                    "${context.localizations.lastUpdated} ${data.lastUpdatedDate}",
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(height: SizeConfig.bodyHeight * .02),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.name,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                      const Duration(milliseconds: 300),
                                      () {
                                        getActiveListParams =
                                            getActiveListParams?.copyWith(
                                              name: value.toString(),
                                            );
                                        bloc.fetchActiveList(
                                          params: getActiveListParams!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: SizeConfig.bodyHeight * .01),
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.insuranceID,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                      const Duration(milliseconds: 300),
                                      () {
                                        getActiveListParams =
                                            getActiveListParams?.copyWith(
                                              insuranceId: value.toString(),
                                            );

                                        bloc.fetchActiveList(
                                          params: getActiveListParams!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: SizeConfig.bodyHeight * .01),
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.staffId,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                      const Duration(milliseconds: 300),
                                      () {
                                        getActiveListParams =
                                            getActiveListParams?.copyWith(
                                              staffId: value.toString(),
                                            );

                                        bloc.pagingController.refresh();
                                        bloc.fetchActiveList(
                                          params: getActiveListParams!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(height: SizeConfig.bodyHeight * .01),
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
                          child: SizedBox(height: SizeConfig.bodyHeight * .01),
                        ),
                        SliverToBoxAdapter(
                          child: InkWell(
                            onTap: () => PoliciesHelper().showCustomDatePicker(
                              context: context,
                              isSingle: false,
                              map: (p0) {
                                String fromText = PoliciesHelper()
                                    .formatDateToApi(date: p0['first']);
                                String? toText = p0['last'] != null
                                    ? PoliciesHelper().formatDateToApi(
                                        date: p0['last'],
                                      )
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
                                      suffixIcon: AppImage.asset(
                                        Assets.icons.calendar3,
                                      ),
                                      hintText: context.localizations.fromDate,
                                    ),
                                  ),
                                ),
                                SizedBox(width: SizeConfig.screenWidth * .02),
                                Expanded(
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: CustomTextFormField(
                                      controller: to,
                                      suffixIcon: AppImage.asset(Assets.icons.calendar3),
                                      hintText: context.localizations.toDate,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(height: SizeConfig.bodyHeight * .02),
                        ),
                      ],
                      if (mainIndex == 3) ...[
                        const SliverToBoxAdapter(child: DemographicsDashboard()),
                      ],
                    ],
                    if (mainIndex != 3) ...[
                      if (data.statistics?.totalMembers != null)
                        SliverToBoxAdapter(
                          child: AppText(
                            text: "${context.localizations.totalMembers}: ${data.statistics?.totalMembers}",
                          ),
                        ),

                      PagingListener<int, Result>(
                        controller: bloc.pagingController,
                        builder: (context, state, fetchNextPage) => PagedSliverList<int, Result>(
                          state: state,
                          fetchNextPage: fetchNextPage,
                          addAutomaticKeepAlives: true,
                          builderDelegate:
                          PagedChildBuilderDelegate<Result>(
                            firstPageProgressIndicatorBuilder: (context) => LoadingWidget(),
                            firstPageErrorIndicatorBuilder: (context) => AppFailureWidget(),
                            noItemsFoundIndicatorBuilder: (context) => EmptyWidgetDesign(),
                            itemBuilder: (context, item, index) {
                              if (data.isLife == true) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  child: CustomExpandedTile(
                                    title: CustomActiveHeaderExpanded(
                                      result: item,
                                      isBusinessLife: true,
                                    ),
                                    body: CustomActiveBody(
                                      result: item,
                                      isBusinessLife: true,
                                      currentFilter: mainIndex,
                                    ),

                                  ),
                                );
                              }
                              if (data.isMedical == true) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  child: CustomExpandedTile(
                                    body: CustomActiveBody(
                                      result: item,
                                      currentFilter: mainIndex,
                                      isBusinessLife: false,
                                    ),
                                    title: CustomActiveHeaderExpanded(
                                      result: item,
                                      isBusinessLife: false,
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  child: CustomActiveMemberCardExpanded(
                                    result: item,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
