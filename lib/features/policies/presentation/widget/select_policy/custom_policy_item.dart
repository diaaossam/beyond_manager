import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/main_policy_model.dart';
import '../../policies_helper.dart';

class CustomPolicyItem extends StatelessWidget {
  final MainPolicyModel result;
  final VoidCallback callback;

  const CustomPolicyItem({
    super.key,
    required this.result,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: FadeInLeft(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
            vertical: SizeConfig.bodyHeight * .02,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            border: Border.all(color: context.colorScheme.outline),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppText(
                    text: "${context.localizations.insurancePolicyNumber}: ",
                    textSize: 12,
                  ),
                  Expanded(
                    child: AppText(
                      text: result.policyNumber ?? "",
                      textSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Row(
                children: [
                  AppText(
                    text: context.localizations.lineOfBusiness,
                    textSize: 12,
                  ),
                  AppText(
                    text: result.lineOfBusiness ?? "",
                    textSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .01,
                      horizontal: SizeConfig.bodyHeight * .025,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          text: context.localizations.showDetails,
                          textSize: 12,
                        ),
                        SizedBox(width: SizeConfig.screenWidth * .02),
                        const Icon(Icons.arrow_forward, size: 16),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .012,
                      horizontal: SizeConfig.bodyHeight * .025,
                    ),
                    decoration: BoxDecoration(
                      color: PoliciesHelper().setUpStatusColor(
                        context: context,
                        status: result.policyState ?? "",
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: AppText(
                        text: result.policyState ?? "",
                        textSize: 11,
                        color: Colors.white,
                      ),
                    ),
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
                          textSize: 11,
                        ),
                        Expanded(
                          child: AppText(
                            text: result.policyStartDate ?? "",
                            textSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        AppText(
                          text: "${context.localizations.endDate}: ",
                          textSize: 11,
                        ),
                        Expanded(
                          child: AppText(
                            text: result.policyEndDate ?? "",
                            textSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
