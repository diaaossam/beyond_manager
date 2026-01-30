import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/policy_status.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/presentation/cubit/sick_leave_active_list/sl_active_list_cubit.dart';
import 'package:bond/features/policies/presentation/widget/select_policy/policies_list_design.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SickLeavePolicesBody extends StatefulWidget {
  const SickLeavePolicesBody({super.key});

  @override
  State<SickLeavePolicesBody> createState() => _SickLeavePolicesBodyState();
}

class _SickLeavePolicesBodyState extends State<SickLeavePolicesBody> {
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
              PolicyListDesign(
                pagingController: bloc.activePagingController,
                onItemTap: (item) => context.router.push(
                  SickLeaveServiceRoute(policyId: item.policyId!.toInt()),
                ),
              )
            else
              PolicyListDesign(
                pagingController: bloc.expiredPagingController,
                onItemTap: (item) => context.router.push(
                  SickLeaveServiceRoute(policyId: item.policyId!.toInt()),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _segmentItem(BuildContext context, String title, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .015),
      width: SizeConfig.screenWidth * 0.4,
      child: Center(
        child: AppText(
          textSize: 12,
          color: selected ? Colors.white : context.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          text: title,
        ),
      ),
    );
  }
}
