import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_payment.dart';

class CustomPaymentHeaderExpanded extends StatelessWidget {
  final PolicyPayment result;

  const CustomPaymentHeaderExpanded({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .02),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: result.branchName != null,
                child: SizedBox(
                  width: SizeConfig.screenWidth * .58,
                  child: AppText(
                    text: result.branchName.toString(),
                    textSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  AppText(text: "${context.localizations.amount}: "),
                  const SizedBox(width: 5),
                  AppText(
                    text: result.amount != null ? result.amount.toString() : "",
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
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  AppText(
                    text: "${context.localizations.dueDate}: ",
                    color: context.colorScheme.shadow,
                  ),
                  AppText(
                    text: result.dueDate ?? "",
                    color: context.colorScheme.shadow,
                  ),
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
                  horizontal: SizeConfig.screenWidth * .03,
                ),
                decoration: BoxDecoration(
                  color: result.paid == true
                      ? Theme.of(context).colorScheme.tertiary
                      : context.colorScheme.error,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                  text: result.paid == true
                      ? context.localizations.paid
                      : context.localizations.unpaid,
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
