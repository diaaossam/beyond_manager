import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/policy_details.dart';
import '../../policies_helper.dart';

class PolicyInfoDetailsSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoDetailsSection({
    super.key,
    required this.policyDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfffefaf8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    AppText(
                      text: "${context.localizations.insurancePolicyNumber}: ",
                    ),
                    Expanded(
                      child: AppText(
                        text: policyDetails.insurancePolicyNumber?.toString() ??
                            "",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                Row(
                  children: [
                    AppText(text: context.localizations.lineOfBusiness),
                    AppText(
                      text: policyDetails.lineOfBusiness ?? "",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                Row(
                  children: [
                    AppText(
                      text: "${context.localizations.insuranceCompany}: ",
                    ),
                    Expanded(
                      child: AppText(
                        text: policyDetails.insuranceCompany ?? "",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .01),
                Row(
                  children: [
                    if (policyDetails.issuingType != null)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.bodyHeight * .01,
                        ),
                        padding: EdgeInsets.all(
                          SizeConfig.bodyHeight * .01,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: AppText(
                            text:
                                "${context.localizations.issuingType}: ${policyDetails.issuingType}",
                            textSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.bodyHeight * .02,vertical:  SizeConfig.bodyHeight * .01),
                decoration: BoxDecoration(
                  color: PoliciesHelper().setUpStatusColor(
                    status: policyDetails.state?.toString() ?? "",
                    context: context,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                  text: (policyDetails.state?.toString() ?? "")
                      .split('')
                      .map((char) => char.isEmpty ? '\u200B' : char)
                      .join()
                      .capitalize(),
                  textSize: 11,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
