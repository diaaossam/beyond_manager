import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/utilization_policy_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomUtilizationHeaderExpanded extends StatelessWidget {
  final Utilization result;

  const CustomUtilizationHeaderExpanded({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * .02,
          horizontal: SizeConfig.bodyHeight * .02),
      decoration: BoxDecoration(
        color: const Color(0xffFEFAF8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text: result.memberName??"",
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                  textSize: 14),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              AppText(
                  text:
                      "${context.localizations.insuranceID}: ${result.memberID??""}"),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              AppText(
                  text:
                  "${context.localizations.staffId} ${result.staffId??""}"),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              AppText(
                  text:
                  "${context.localizations.policyNumber} ${result.policyNumber??""}"),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: context.localizations.amount),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  AppText(
                      text: "${result.totalAmount??"0"}",
                      fontWeight: FontWeight.bold,
                      textSize: 16),
                  const SizedBox(width: 2),
                  AppText(
                      text: context.localizations.egp,
                      color: Colors.grey),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
            ],
          ),
        ],
      ),
    );
  }
}
