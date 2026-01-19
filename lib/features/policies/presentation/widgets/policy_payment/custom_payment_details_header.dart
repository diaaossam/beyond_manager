import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/policy_payment.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomPaymentHeaderExpanded extends StatelessWidget {
  final PolicyPayment result;

  const CustomPaymentHeaderExpanded({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * .02,
          horizontal: SizeConfig.bodyHeight * .02),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: result.branchName != null,
                child: SizedBox(
                  width: SizeConfig.screenWidth*.58,
                  child: AppText(
                      text: result.branchName.toString(),
                      textSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  AppText(text: "${context.localizations.amount}: "),
                  const SizedBox(width: 5),
                  AppText(
                      text: result.amount != null ? result.amount.toString():"",
                      fontWeight: FontWeight.bold,
                      textSize: 16),
                  const SizedBox(width: 5),
                  AppText(text: context.localizations.egp, color: Colors.grey),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  AppText(
                      text: "${context.localizations.dueDate}: ",
                      color: const Color(0xff898A8D)),
                  AppText(
                      text: result.dueDate ?? "",
                      color: const Color(0xff898A8D)),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.bodyHeight * .009,
                    horizontal: SizeConfig.screenWidth * .03),
                decoration: BoxDecoration(
                  color: result.paid == true
                      ? AppColors.green
                      : const Color(0xffFA8C80),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                    text: result.paid == true
                        ? context.localizations.paid
                        : context.localizations.unpaid,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
