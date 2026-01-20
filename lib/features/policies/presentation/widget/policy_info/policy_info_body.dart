import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../data/models/policy_details.dart';
import 'policy_info_branches_section.dart';
import 'policy_info_contacts_section.dart';
import 'policy_info_dates_section.dart';
import 'policy_info_details_section.dart';
import 'policy_info_file_section.dart';
import 'policy_info_payment_section.dart';
import 'policy_info_plan_section.dart';
import 'policy_info_tpa_section.dart';

class PolicyInfoBody extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoBody({
    super.key,
    required this.policyDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .04,
      ),
      children: [
        SizedBox(height: SizeConfig.bodyHeight * .02),
        PolicyInfoBranchesSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoDetailsSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoPaymentSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoPlanSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoContactsSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoTpaSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoDatesSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        PolicyInfoFileSection(policyDetails: policyDetails),
        SizedBox(height: SizeConfig.bodyHeight * .02),
      ],
    );
  }
}
