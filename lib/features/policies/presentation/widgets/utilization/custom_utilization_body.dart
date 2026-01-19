import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/utilization_policy_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomUtilizationBody extends StatelessWidget {
  final Utilization result;

  const CustomUtilizationBody({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFEFAF8),
        border: Border.all(color: const Color(0xffEAEAEA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.bodyHeight * .015),
                Visibility(
                  visible: result.branch != null,
                  child: Row(
                    children: [
                      AppText(text: "${context.localizations.branch}: "),
                      Expanded(
                          child: AppText(
                              text: result.branch.toString(),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
               /* Visibility(
                  visible: result.gender!= null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.gender}: "),
                          Expanded(
                              child: AppText(
                                  text: result.gender ?? "",
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),*/
                Visibility(
                  visible: result.policyNumber != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.policyNumber}:"),
                          AppText(
                            text: result.policyNumber.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.age != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.age}: "),
                          Expanded(
                              child: AppText(
                                  text: result.age.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.account != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.account}: "),
                          Expanded(
                              child: AppText(
                                  text: result.account.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.chronic != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.chronic}: "),
                          Expanded(
                              child: AppText(
                                  text: result.chronic.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.claimDate != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.claimDate}: "),
                          Expanded(
                              child: AppText(
                                  text: result.claimDate.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.claimID != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.claimId}: "),
                          Expanded(
                              child: AppText(
                                  text: result.claimID.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.disease!= null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.disease}: "),
                          Expanded(
                              child: AppText(
                                  text: result.disease.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.diseaseCategory != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.diseaseCategory}: "),
                          Expanded(
                              child: AppText(
                                  text: result.diseaseCategory.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                /*Visibility(
                  visible: result.iCDCode != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.icdCode}: "),
                          Expanded(
                              child: AppText(
                                  text: result.iCDCode.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),*/
               /* Visibility(
                  visible: result.month != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.month}: "),
                          Expanded(
                              child: AppText(
                                  text: result.month.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),*/
                Visibility(
                  visible: result.provider != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.provider}: "),
                          Expanded(
                              child: AppText(
                                  text: result.provider.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.relation != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.relation}: "),
                          Expanded(
                              child: AppText(
                                  text: result.relation.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
               /* Visibility(
                  visible: result.riskCarrier != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.riskCarrier}: "),
                          Expanded(
                              child: AppText(
                                  text: result.riskCarrier.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),*/
                Visibility(
                  visible: result.servicesGroup != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.servicesGroup}: "),
                          Expanded(
                              child: AppText(
                                  text: result.servicesGroup.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                /*Visibility(
                  visible: result.tpa != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.tpa}: "),
                          Expanded(
                              child: AppText(
                                  text: result.tpa.toString(),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),*/
                SizedBox(height: SizeConfig.bodyHeight * .015),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
