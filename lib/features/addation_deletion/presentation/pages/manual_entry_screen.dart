import 'package:auto_route/auto_route.dart';
import 'package:bond/features/addation_deletion/presentation/widgets/manual_entery/manual_entery_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../data/models/response/policies_data_addation.dart';
import '../cubit/addation/addation.dart';

@RoutePage()
class ManualEntryScreen extends StatelessWidget {
  final String requestType;
  final List<PoliciesDataModel> selectedPolicies;
  final List<num> policyIds;
  final PoliciesDataModel policiesPermission;

  const ManualEntryScreen({
    super.key,
    required this.requestType,
    required this.selectedPolicies,
    required this.policyIds,
    required this.policiesPermission,
  });

  @override
  Widget build(BuildContext context) {
    print(context.router.stack.length);
    return BlocProvider(
      create: (context) => sl<AddationCubit>()
        ..fetchPolicyBranches(policyIds: policyIds)
        ..fetchPolicyPlans(policyIds: policyIds),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.addMembersManually),
        body: ManualEntryBody(
          selectedPolicies: selectedPolicies,
          policiesPermission: policiesPermission,
        ),
      ),
    );
  }
}
