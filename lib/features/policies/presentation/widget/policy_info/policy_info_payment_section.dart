import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_details.dart';

class PolicyInfoPaymentSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoPaymentSection({
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
        color: const Color(0xffffefff),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(text: "${context.localizations.nextPayment}:",color: context.colorScheme.shadow,),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  AppText(
                    text: policyDetails.nextPayment != null
                        ? policyDetails.nextPayment.toString()
                        : "0",
                    fontWeight: FontWeight.w600,
                    textSize: 13,
                  ),
                  const SizedBox(width: 5),
                  AppText(
                    text: context.localizations.egp,
                    color: context.colorScheme.shadow,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(text: "${context.localizations.paid}:",color: context.colorScheme.shadow,),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  Row(
                    children: [
                      AppText(
                        text: policyDetails.totalPaid != null
                            ? policyDetails.totalPaid!.toStringAsFixed(2)
                            : "0",
                        fontWeight: FontWeight.w600,
                        textSize: 13,
                      ),
                      AppText(
                        text: " ${context.localizations.egp}",
                        color: context.colorScheme.shadow,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(text: "${context.localizations.nextPaymentDate}:",color: context.colorScheme.shadow,),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  Row(
                    children: [
                      AppText(
                        text: policyDetails.nextPaymentDate ?? "0",
                        fontWeight: FontWeight.w600,
                        textSize: 13,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
