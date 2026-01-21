import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/active_policy/active_policy_bloc.dart';
import '../widget/active_list/active_list_body.dart';

@RoutePage()
class ActiveListScreen extends StatelessWidget {
  final int policyId;

  const ActiveListScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ActivePolicyCubit>(),
      child: ActiveListBody(policyId: policyId),
    );
  }
}
