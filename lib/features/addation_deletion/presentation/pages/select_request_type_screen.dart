import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../policies/data/models/response/main_policy_model.dart';
import '../widgets/select_request_type/select_request_type.dart';

@RoutePage()
class SelectRequestTypeScreen extends StatelessWidget {
  final List<MainPolicyModel> selectedPolicies;

  const SelectRequestTypeScreen({super.key, required this.selectedPolicies});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.selectRequestType),
      body: SafeArea(
        child: SelectRequestTypeBody(
          selectedPolicies: selectedPolicies,
        ),
      ),
    );
  }
}
