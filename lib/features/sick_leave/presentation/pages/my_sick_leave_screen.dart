import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/sick_leave/presentation/cubit/my_sick_leave/my_sick_leave_cubit.dart';
import 'package:bond/features/sick_leave/presentation/widgets/my_sick_leave/my_sick_leave_body.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MySickLeaveScreen extends StatelessWidget {
  final int? sickLeaveId;
  final int policyId;

  const MySickLeaveScreen({
    super.key,
    this.sickLeaveId,
    required this.policyId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MySickLeaveCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.myRequests),
        body: MySickLeaveBody(
          policyId: policyId,
          sickLeaveId: sickLeaveId,
        ),
      ),
    );
  }
}
