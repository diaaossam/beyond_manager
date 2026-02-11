import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/presentation/cubit/my_sick_leave/my_sick_leave_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../segment_item.dart';
import 'pending_sick_leave_list.dart';

class MySickLeaveBody extends StatefulWidget {
  final int? sickLeaveId;
  final int policyId;

  const MySickLeaveBody({super.key, this.sickLeaveId, required this.policyId});

  @override
  State<MySickLeaveBody> createState() => _MySickLeaveBodyState();
}

class _MySickLeaveBodyState extends State<MySickLeaveBody> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<MySickLeaveCubit>();
    bloc.initPagination(policyId: widget.policyId);
    if (widget.sickLeaveId != null) {
      bloc.changeIndex(value: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySickLeaveCubit, BaseState<int>>(
      builder: (context, state) {
        final bloc = context.read<MySickLeaveCubit>();
        return RefreshIndicator(
          onRefresh: () async {
            if (bloc.currentIndex == 0) {
              bloc.pendingPagingController.refresh();
            } else if (bloc.currentIndex == 1) {
              bloc.processingPagingController.refresh();
            } else {
              bloc.donePagingController.refresh();
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .04,
                ),
                sliver: SliverToBoxAdapter(
                  child: CupertinoSlidingSegmentedControl(
                    backgroundColor: context.colorScheme.outline,
                    thumbColor: context.colorScheme.primary,
                    padding: const EdgeInsets.all(8),
                    children: {
                      0: SegmentItem(
                        title: context.localizations.pending,
                        selected: bloc.currentIndex == 0,
                      ),
                      1: SegmentItem(
                        title: context.localizations.processing,
                        selected: bloc.currentIndex == 1,
                      ),
                      2: SegmentItem(
                        title: context.localizations.done,
                        selected: bloc.currentIndex == 2,
                      ),
                    },
                    groupValue: bloc.currentIndex,
                    onValueChanged: (value) => bloc.changeIndex(value: value!),
                  ),
                ),
              ),
              if (bloc.currentIndex == 0)
                SickLeaveListDesign(
                  pagingController: bloc.pendingPagingController,
                )
              else if (bloc.currentIndex == 1)
                SickLeaveListDesign(
                  pagingController: bloc.processingPagingController,
                )
              else
                SickLeaveListDesign(
                  pagingController: bloc.donePagingController,
                ),
            ],
          ),
        );
      },
    );
  }
}
