import 'package:bond/features/policies/presentation/cubit/active_policy/active_policy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';

class ActiveListScreen extends StatelessWidget {
  final int policyId;

  const ActiveListScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ActivePolicyCubit>()..initGetActiveList(policyId: policyId),
      child: BlocBuilder<ActivePolicyCubit, ActivePolicyState>(
        builder: (context, state) {
          return Scaffold(body: ActiveListBody(policyId: policyId));
        },
      ),
    );
  }
}
