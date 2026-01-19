import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/main_policy_model.dart';
import 'package:beymanger/features/policies/policies_helper.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_arrow1.dart';
import 'package:flutter/material.dart';

class CustomPolicyItem extends StatelessWidget {
  final MainPolicyModel result;
  final VoidCallback callback;

  const CustomPolicyItem(
      {super.key, required this.result, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
            vertical: SizeConfig.bodyHeight * .02),
        decoration: BoxDecoration(
            color: const Color(0xfffefaf8),
            border: Border.all(
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .01),
            Row(
              children: [
                AppText(
                    text: "${context.localizations.insurancePolicyNumber}: ",
                    textSize: 14),
                Expanded(
                  child: AppText(
                      text: result.policyNumber ?? "",
                      textSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              children: [
                AppText(
                    text: context.localizations.lineOfBusiness, textSize: 14),
                AppText(
                    text: result.lineOfBusiness ?? "",
                    textSize: 14,
                    fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth * .3,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .01),
                  decoration: BoxDecoration(
                    color: const Color(0xfffceae5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                          text: context.localizations.showDetails,
                          textSize: 14),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      const CustomArrow1(),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: SizeConfig.screenWidth * .3,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .012),
                  decoration: BoxDecoration(
                    color: PoliciesHelper()
                        .setUpStatusColor(status: result.policyState ?? ""),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: AppText(
                    text: result.policyState ?? "",
                    textSize: 14,
                    color: Colors.white,
                  )),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      AppText(
                          text: "${context.localizations.startDate}: ",
                          textSize: 12),
                      Expanded(
                        child: AppText(
                            text: result.policy_start_date ?? "",
                            textSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Row(
                    children: [
                      AppText(
                          text: "${context.localizations.startDate}: ",
                          textSize: 12),
                      Expanded(
                        child: AppText(
                            text: result.policy_start_date ?? "",
                            textSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
          ],
        ),
      ),
    );
  }
}
