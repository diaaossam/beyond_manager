import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/features/sick_leave/presentation/cubit/my_sick_leave/my_sick_leave_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'custom_my_request_item.dart';

class DoneSickLeaveListDesign extends StatelessWidget {
  const DoneSickLeaveListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MySickLeaveCubit>();
    return PagingListener<int, MySickLeave>(
      controller: cubit.donePagingController,
      builder: (context, state, fetchNextPage) => PagedSliverList<int, MySickLeave>(
        state: state,
        fetchNextPage: fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, MySickLeave item, index) =>
              CustomMyRequestItem(
            myRequestsModel: item,
          ),
        ),
      ),
    );
  }
}
