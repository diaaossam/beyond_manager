import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/reimbursement/reimbursement_cubit.dart';
import '../widget/reimbursement/rembursement_body.dart';

@RoutePage()
class ReimbursementScreen extends StatelessWidget {
  final int policyId;

  const ReimbursementScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ReimbursementCubit>(),
      child: Scaffold(body: RembursementBody(policyId: policyId)),
    );
  }
}
