import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/active_list_policy_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomActiveBody extends StatelessWidget {
  final ActiveListResult result;
  final bool isBusinessLife;
  final int currentFilter;

  const CustomActiveBody(
      {super.key,
      required this.result,
      required this.isBusinessLife,
      required this.currentFilter});

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
                SizedBox(height: SizeConfig.bodyHeight * .03),
                Row(
                  children: [
                    Expanded(
                      child: Visibility(
                        visible: result.branch != null,
                        child: Row(
                          children: [
                            AppText(text: "${context.localizations.branch} : "),
                            AppText(
                              text: result.branch.toString(),
                              fontWeight: FontWeight.bold,
                              textSize: 12,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !isBusinessLife && result.staff != null,
                      child: Row(
                        children: [
                          AppText(
                              textSize: 14,
                              color: const Color(0xffEC5800),
                              text: "${context.localizations.staffId}: "),
                          AppText(
                            textSize: 14,
                            color: const Color(0xffEC5800),
                            text: result.staff.toString(),
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: !isBusinessLife && result.relation != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: context.localizations.relation),
                          AppText(
                            text: result.relation ?? "",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.policyNumber != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: context.localizations.policyNumber),
                          AppText(
                            text: result.policyNumber ?? "",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isBusinessLife && result.bankAccount != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(
                              text: "${context.localizations.bankAccount}: "),
                          AppText(
                            text: result.bankAccount ?? "",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isBusinessLife && result.category != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(text: "${context.localizations.category} "),
                          AppText(
                            text: result.category ?? "",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.deletionDate != null &&
                      (result.memberStatus != "Under Addition" &&
                          result.memberStatus != "Added" &&
                          result.memberStatus != ""),
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(
                              text: "${context.localizations.deletionDate}: "),
                          AppText(
                            text: result.deletionDate ?? "",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                /*  Column(
                  children: [
                    SizedBox(height: SizeConfig.bodyHeight * .015),
                    Row(
                      children: [
                        AppText(text: "${context.localizations.isDeleted} : ", color: Colors.black),
                        AppText(
                            text: result.isDeleted.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ],
                    ),
                  ],
                ),*/
                Visibility(
                  visible: result.beyondDeletionDate != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(
                              text:
                                  "${context.localizations.beyondDeletionDate} : ",
                              color: Colors.black),
                          AppText(
                              text: result.beyondDeletionDate ?? "",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      !isBusinessLife && result.principleInsuranceId != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(
                              text: context.localizations.principalInsuranceID),
                          AppText(
                            text: result.principleInsuranceId ?? "",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isBusinessLife && result.insuranceCardName != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          AppText(
                              text: context.localizations.nameOnInsuranceCard),
                          Expanded(
                              child: AppText(
                            text: result.insuranceCardName.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: !isBusinessLife && result.insuranceID != null,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.bodyHeight * .015),
                        Row(
                          children: [
                            AppText(
                                text: "${context.localizations.insuranceID}: "),
                            AppText(
                              text: result.insuranceID ?? "",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    )),
                Visibility(
                  visible: result.reactivationDate != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          const AppText(text: "Reactivation Date : "),
                          AppText(
                            text: result.reactivationDate.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.dateOfBirth != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          const AppText(text: "Dob : "),
                          AppText(
                            text: result.dateOfBirth.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.memberStatus != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          const AppText(text: "Member Status : "),
                          AppText(
                            text: result.memberStatus.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: result.plan != null,
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .015),
                      Row(
                        children: [
                          const Spacer(),
                          Container(
                            padding:
                                EdgeInsets.all(SizeConfig.bodyHeight * .01),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppText(
                                    text: "${context.localizations.plan} ",
                                    textSize: 14),
                                AppText(
                                    text: result.plan ?? "",
                                    textSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
              ],
            ),
          ),
          if(currentFilter != 2)
          Container(
            padding: const EdgeInsets.all(12),
            // padding: const EdgeInsets.symmetric(horizontal: SizeConfig.),
            decoration: BoxDecoration(
              color: const Color(0xffDDF3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                AppText(
                    text: "${context.localizations.startDate}: ", textSize: 14),
                AppText(
                    text: result.startDate ?? "",
                    fontWeight: FontWeight.bold,
                    textSize: 14),
                const Spacer(),
                /*AppText(
                    text: "${context.localizations.endDate}: ", textSize: 14),
                AppText(
                    text: result.endDate??"",
                    fontWeight: FontWeight.bold,
                    textSize: 14),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
