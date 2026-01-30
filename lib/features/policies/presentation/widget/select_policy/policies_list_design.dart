import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:bond/features/policies/presentation/widget/select_policy/custom_policy_item.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../../sick_leave/presentation/pages/sick_leave_service_screen.dart';

class PolicyListDesign extends StatelessWidget {
  final PagingController<int, MainPolicyModel> pagingController;
  final Function(MainPolicyModel) onItemTap;

  const PolicyListDesign({super.key, required this.pagingController, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return PagingListener<int, MainPolicyModel>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) =>
          PagedSliverList<int, MainPolicyModel>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) => Container(
                margin: EdgeInsets.all(SizeConfig.bodyHeight * .01),
                child: CustomPolicyItem(
                  onItemTap: onItemTap,
                  result: item,
                ),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
              const LoadingWidget(),
              firstPageErrorIndicatorBuilder: (context) =>
              const AppFailureWidget(),
              noItemsFoundIndicatorBuilder: (context) =>
              const EmptyWidgetDesign(),
            ),

          ),
    );
  }
}
