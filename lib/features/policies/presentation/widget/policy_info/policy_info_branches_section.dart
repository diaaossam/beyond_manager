import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/policy_details.dart';

class PolicyInfoBranchesSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoBranchesSection({
    super.key,
    required this.policyDetails,
  });

  @override
  Widget build(BuildContext context) {
    if (policyDetails.branchesList == null ||
        policyDetails.branchesList!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffffefff),
      ),
      child: Column(
        children: [
          ...List.generate(
            policyDetails.branchesList!.length,
            (index) => Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: AppText(
                text: policyDetails.branchesList![index],
                textSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
