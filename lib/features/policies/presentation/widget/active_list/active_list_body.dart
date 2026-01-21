import 'dart:async';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:bond/features/policies/presentation/cubit/active_policy/active_policy_bloc.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../../../config/helper/excel_helper.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_bar/custom_app_bar.dart';

class ActiveListBody extends StatefulWidget {
  final int policyId;

  const ActiveListBody({super.key, required this.policyId});

  @override
  State<ActiveListBody> createState() => _ActiveListBodyState();
}

class _ActiveListBodyState extends State<ActiveListBody> with TickerProviderStateMixin {
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
        Logger().w(state.data?.result);
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
        );
      },
    );
  }
}
