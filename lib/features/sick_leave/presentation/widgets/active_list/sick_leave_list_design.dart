import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:bond/features/policies/presentation/widget/select_policy/custom_policy_item.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../pages/sick_leave_service_screen.dart';

class SickLeaveListDesign extends StatelessWidget {
  final PagingController<int, MainPolicyModel> pagingController;

  const SickLeaveListDesign({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return PagingListener<int, MainPolicyModel>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) => PagedSliverList<int, MainPolicyModel>(
        state: state,
        fetchNextPage: fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) => Container(
            margin: EdgeInsets.all(SizeConfig.bodyHeight * .01),
            child: CustomPolicyItem(
              result: item,
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SickLeaveServiceScreen(
                      policyId: item.policyId!.toInt(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
