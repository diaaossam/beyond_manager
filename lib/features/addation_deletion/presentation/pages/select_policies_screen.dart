import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../policies/presentation/cubit/policies_cubit.dart';
import '../widgets/select_policies/select_policy.dart';

@RoutePage()
class SelectPoliciesScreen extends StatelessWidget {
  const SelectPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PoliciesCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.selectInsurancePolicies,
        ),
        body: SelectPolicyBody(),
      ),
    );
  }
}
