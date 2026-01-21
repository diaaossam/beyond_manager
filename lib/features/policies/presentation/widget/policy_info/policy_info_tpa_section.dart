import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_details.dart';

class PolicyInfoTpaSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoTpaSection({
    super.key,
    required this.policyDetails,
  });

  @override
  Widget build(BuildContext context) {
    if (policyDetails.lineOfBusiness?.toString().toLowerCase() != "medical") {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfffefaf8),
      ),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              AppText(text: "${context.localizations.tpa}: "),
              AppText(
                text: policyDetails.tpa ?? "",
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
