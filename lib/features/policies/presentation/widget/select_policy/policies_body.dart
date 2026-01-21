import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/enum/policy_status.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../data/models/response/main_policy_model.dart';
import '../../cubit/policies_cubit.dart';
import '../select_policy/custom_policy_item.dart';
import '../../../../../widgets/chips_choice_widget.dart';

class PoliciesBody extends StatelessWidget {
  const PoliciesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoliciesCubit, BaseState<PolicyStatus>>(
      builder: (context, state) {
        final cubit = context.read<PoliciesCubit>();
        return RefreshIndicator(
          onRefresh: () async =>
              context.read<PoliciesCubit>().pagingController.refresh(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ChipsChoiceWidget<PolicyStatus>(
                  items: PolicyStatus.values,
                  labelBuilder: (PolicyStatus item) => item.label,
                  onSelected: (PolicyStatus value) => cubit.fetchPage(1, value),
                  selectedItem: cubit.currentStatus,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .05,
                ),
                sliver: PagingListener<int, MainPolicyModel>(
                  controller: cubit.pagingController,
                  builder: (context, state, fetchNextPage) =>
                      PagedSliverList<int, MainPolicyModel>(
                        state: state,
                        fetchNextPage: fetchNextPage,
                        addAutomaticKeepAlives: true,
                        builderDelegate:
                            PagedChildBuilderDelegate<MainPolicyModel>(
                              firstPageProgressIndicatorBuilder: (context) =>
                                  const LoadingWidget(),
                              firstPageErrorIndicatorBuilder: (context) =>
                                  const AppFailureWidget(),
                              noItemsFoundIndicatorBuilder: (context) =>
                                  const EmptyWidgetDesign(),
                              itemBuilder: (context, item, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.bodyHeight * .01,
                                ),
                                child: CustomPolicyItem(
                                  result: item,
                                  callback: () => context.router.push(PolicyAccessSelectionRoute(model: item)),
                                ),
                              ),
                            ),
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
