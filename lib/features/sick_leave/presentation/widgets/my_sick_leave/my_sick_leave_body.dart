import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/presentation/cubit/my_sick_leave/my_sick_leave_cubit.dart';
import 'package:bond/features/sick_leave/presentation/widgets/my_sick_leave/proccessing_sick_leave_list.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'done_sick_leave_list_design.dart';
import 'pending_sick_leave_list.dart';

class MySickLeaveBody extends StatefulWidget {
  final int? sickLeaveId;
  final int policyId;

  const MySickLeaveBody({
    super.key,
    this.sickLeaveId,
    required this.policyId,
  });

  @override
  State<MySickLeaveBody> createState() => _MySickLeaveBodyState();
}

class _MySickLeaveBodyState extends State<MySickLeaveBody> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<MySickLeaveCubit>();
    
    // Initialize pagination
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
                      0: _segmentItem(
                        context,
                        context.localizations.pending,
                        bloc.currentIndex == 0,
                      ),
                      1: _segmentItem(
                        context,
                        context.localizations.processing,
                        bloc.currentIndex == 1,
                      ),
                      2: _segmentItem(
                        context,
                        context.localizations.done,
                        bloc.currentIndex == 2,
                      ),
                    },
                    groupValue: bloc.currentIndex,
                    onValueChanged: (value) => bloc.changeIndex(value: value!),
                  ),
                ),
              ),
              if (bloc.currentIndex == 0)
                const PendingSickLeaveListDesign()
              else if (bloc.currentIndex == 1)
                const ProcessingSickLeaveListDesign()
              else
                const DoneSickLeaveListDesign()
            ],
          ),
        );
      },
    );
  }

  Widget _segmentItem(BuildContext context, String title, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.bodyHeight * .015,
      ),
      width: SizeConfig.screenWidth * 0.25,
      child: Center(
        child: AppText(
          textSize: 15,
          color: selected ? Colors.white : context.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          text: title,
        ),
      ),
    );
  }
}
