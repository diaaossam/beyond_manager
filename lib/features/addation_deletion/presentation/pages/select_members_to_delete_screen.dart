import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/addation_deletion/presentation/cubit/deletion/deletion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../data/models/response/policies_data_addation.dart';
import '../widgets/deletion/deletion_body.dart';

@RoutePage()
class SelectMembersToDeleteScreen extends StatelessWidget {
  final List<PoliciesDataModel> selectedPolicies;
  final List<int> selectedPoliciesIds;

  const SelectMembersToDeleteScreen({
    super.key,
    required this.selectedPolicies,
    required this.selectedPoliciesIds,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeletionCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.selectMemberToDelete),
        body: DeletionBody(
          policies: selectedPolicies,
          selectedPoliciesIds: selectedPoliciesIds,
        ),
      ),
    );
  }
}
