import 'package:auto_route/auto_route.dart';
import 'package:bond/features/addation_deletion/presentation/widgets/manual_entery/manual_entery_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../policies/data/models/response/main_policy_model.dart';
import '../cubit/addation/addation.dart';

@RoutePage()
class ManualEntryScreen extends StatelessWidget {
  final String requestType;
  final List<MainPolicyModel> selectedPolicies;

  const ManualEntryScreen({
    super.key,
    required this.requestType,
    required this.selectedPolicies,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddationCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.addMembersManually),
        body: ManualEntryBody(selectedPolicies: selectedPolicies),
      ),
    );
  }
}
