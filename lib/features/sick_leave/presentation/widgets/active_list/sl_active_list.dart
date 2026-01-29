import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/policy_status.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/presentation/cubit/sick_leave_active_list/sl_active_list_cubit.dart';
import 'package:bond/features/sick_leave/presentation/widgets/active_list/sick_leave_list_design.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlActiveListBody extends StatefulWidget {
  const SlActiveListBody({super.key});

  @override
  State<SlActiveListBody> createState() => _SlActiveListBodyState();
}

class _SlActiveListBodyState extends State<SlActiveListBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlActiveListCubit, BaseState<PolicyStatus>>(
      builder: (context, state) {
        final bloc = context.read<SlActiveListCubit>();
        return CustomScrollView(
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
                      context.localizations.active,
                      bloc.currentIndex == 0,
                    ),
                    1: _segmentItem(
                      context,
                      context.localizations.expired,
                      bloc.currentIndex == 1,
                    ),
                  },
                  groupValue: bloc.currentIndex,
                  onValueChanged: (value) => bloc.changeIndex(value!),
                ),
              ),
            ),
            if (bloc.currentIndex == 0)
              SickLeaveListDesign(
                pagingController: bloc.activePagingController,
              )
            else
              SickLeaveListDesign(
                pagingController: bloc.expiredPagingController,
              )
          ],
        );
      },
    );
  }

  Widget _segmentItem(BuildContext context, String title, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.bodyHeight * .015,
      ),
      width: SizeConfig.screenWidth * 0.4,
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
