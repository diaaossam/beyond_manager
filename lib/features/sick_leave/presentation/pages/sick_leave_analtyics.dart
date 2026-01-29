import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:bond/features/sick_leave/presentation/cubit/sick_leave_analytics/sick_leave_analytics_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/my_sick_leave/sick_leave_analytics_body.dart';

@RoutePage()
class SickLeaveAnalyticsScreen extends StatelessWidget {
  final int policyId;

  const SickLeaveAnalyticsScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SickLeaveAnalyticsCubit>()
        ..getSickLeaveAnalyticsFromApi(policyId: policyId),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.companySickLeaveAna),
        body: BlocBuilder<SickLeaveAnalyticsCubit, BaseState<SickLeaveAnalytics>>(
          builder: (context, state) {
            return state.builder(
              onTapRetry: () => context
                  .read<SickLeaveAnalyticsCubit>()
                  .getSickLeaveAnalyticsFromApi(policyId: policyId),
              onSuccess: (data) {
                return SickLeaveAnalyticsBody(analytics: data);
              },
            );
          },
        ),
      ),
    );
  }
}
