import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/no_item_design.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'custom_my_request_item.dart';

class SickLeaveListDesign extends StatelessWidget {
  final PagingController<int, MySickLeave> pagingController;

  const SickLeaveListDesign({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return PagingListener<int, MySickLeave>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) =>
          PagedSliverList<int, MySickLeave>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              noItemsFoundIndicatorBuilder: (context) => EmptyWidgetDesign(),
              firstPageProgressIndicatorBuilder: (context) => LoadingWidget(),
              firstPageErrorIndicatorBuilder: (context) => AppFailureWidget(),
              newPageErrorIndicatorBuilder: (context) => Center(),
              itemBuilder: (context, MySickLeave item, index) =>
                  CustomMyRequestItem(myRequestsModel: item),
            ),
          ),
    );
  }
}
