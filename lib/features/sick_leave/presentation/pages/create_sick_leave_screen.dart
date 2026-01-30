import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../policies/presentation/cubit/active_policy/active_policy_bloc.dart';
import '../cubit/create_sick_leave/create_sick_leave_cubit.dart';
import '../widgets/create_sick_leave/sick_leave_body.dart';

@RoutePage()
class CreateSickLeaveScreen extends StatelessWidget {
  final int policyId;

  const CreateSickLeaveScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CreateSickLeaveCubit>()),
        BlocProvider(create: (context) => sl<ActivePolicyCubit>()),
      ],
      child: CreateSickLeaveBody(policyId: policyId),
    );
  }
}
