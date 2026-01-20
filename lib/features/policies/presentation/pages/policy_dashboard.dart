import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../data/models/main_policy_model.dart';
import '../cubit/policy_access/policy_access_cubit.dart';
import '../widget/policy_dashboard/policy_dashboard_body.dart';

@RoutePage()
class PolicyAccessSelectionScreen extends StatelessWidget {
  final MainPolicyModel model;

  const PolicyAccessSelectionScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PolicyAccessCubit>()
            ..getPolicyAccess(policyId: model.policyId!.toInt()),
      child: PolicyDashboardBody(),
    );
  }
}
