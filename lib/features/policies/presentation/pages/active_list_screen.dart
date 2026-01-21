import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveListScreen extends StatelessWidget {
  final int policyId;

  const ActiveListScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ActivePolicyBloc>(),
      child: BlocBuilder<ActivePolicyBloc, ActivePolicyState>(
        builder: (context, state) {
          return Scaffold(body: ActiveListBody(policyId: policyId));
        },
      ),
    );
  }
}
