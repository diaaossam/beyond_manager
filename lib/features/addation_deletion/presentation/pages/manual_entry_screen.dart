import 'package:auto_route/auto_route.dart';
import 'package:bond/features/addation_deletion/presentation/widgets/manual_entery/manual_entery_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../policies/data/models/response/main_policy_model.dart';

@RoutePage()
class ManualEntryScreen extends StatefulWidget {
  final String requestType;
  final List<MainPolicyModel> selectedPolicies;

  const ManualEntryScreen({
    super.key,
    required this.requestType,
    required this.selectedPolicies,
  });

  @override
  State<ManualEntryScreen> createState() => _ManualEntryScreenState();
}

class _ManualEntryScreenState extends State<ManualEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.addMembersManually),
      body: ManualEntryBody(),
    );
  }
}


