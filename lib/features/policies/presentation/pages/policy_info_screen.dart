import 'package:beymanger/config/dependencies/core_di.dart';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_assets.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_constant.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/domain/entities/get_active_list_params.dart';
import 'package:beymanger/features/policies/policies_helper.dart';
import 'package:beymanger/features/policies/presentation/cubit/policy_details/policy_details_bloc.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_app_bar.dart';
import 'package:beymanger/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PolicyInfoScreen extends StatelessWidget {
  final int policyId;

  const PolicyInfoScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PolicyDetailsBloc>()
        ..add(GetPolicyDetailsEvent(
            getActiveListParams: GetActiveListParams(policyId: policyId))),
      child: BlocConsumer<PolicyDetailsBloc, PolicyDetailsState>(
        listener: (context, state) {
          if (state is DownloadPolicyFileError) {
            AppConstant.showCustomSnakeBar(context, state.errorMsg, false);
          }
        },
        builder: (context, state) {
          PolicyDetailsBloc cubit = context.read<PolicyDetailsBloc>();
          if (state is GetPolicyDetailsLoading || cubit.policyDetails == null) {
            return const Scaffold(
              body: LoadingWidget(),
            );
          }
          return Scaffold(
              appBar: CustomAppBar(
                text: context.localizations.policyInformation,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04),
                child: ListView(
                  children: [
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    cubit.policyDetails!.branchesList != null
                        ? Visibility(
                            visible:
                                cubit.policyDetails!.branchesList!.isNotEmpty,
                            child: Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: SizeConfig.screenWidth * .03,
                                    vertical: SizeConfig.bodyHeight * .02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffffefff)),
                                child: Column(
                                  children: [
                                    ...List.generate(
                                        cubit.policyDetails!.branchesList!
                                            .length,
                                        (index) => Container(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2),
                                              child: AppText(
                                                  text: cubit.policyDetails!
                                                      .branchesList![index],
                                                  textSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                  ],
                                )),
                          )
                        : const SizedBox.shrink(),
                    Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: SizeConfig.screenWidth * .03,
                            vertical: SizeConfig.bodyHeight * .02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfffefaf8)
                            // color: Colors.red
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
                                          text:
                                              "${context.localizations.insurancePolicyNumber}: "),
                                      Expanded(
                                        child: AppText(
                                            text: cubit.policyDetails!
                                                    .insurancePolicyNumber ??
                                                "",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.bodyHeight * .02),
                                  Row(
                                    children: [
                                      AppText(
                                        text: context
                                            .localizations.lineOfBusiness,
                                      ),
                                      AppText(
                                          text: cubit.policyDetails!
                                                  .lineOfBusiness ??
                                              "",
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.bodyHeight * .02),
                                  Row(
                                    children: [
                                      AppText(
                                          text:
                                              "${context.localizations.insuranceCompany}: "),
                                      Expanded(
                                        child: AppText(
                                            text:
                                                "${cubit.policyDetails?.insuranceCompany}",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.bodyHeight * .01),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                SizeConfig.bodyHeight * .01),
                                        padding: EdgeInsets.all(
                                            SizeConfig.bodyHeight * .01),
                                        decoration: BoxDecoration(
                                          color: AppColors.blue,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: AppText(
                                              text: cubit.policyDetails!
                                                          .issuingType ==
                                                      null
                                                  ? ""
                                                  : "${context.localizations.issuingType}: ${cubit.policyDetails!.issuingType.toString().replaceAll('', '\u200B')}",
                                              textSize: 12,
                                              color: Colors.white),
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
                                  padding: EdgeInsets.all(
                                      SizeConfig.bodyHeight * .01),
                                  decoration: BoxDecoration(
                                    color: PoliciesHelper().setUpStatusColor(
                                        status: cubit.policyDetails!.state
                                            .toString()),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: AppText(
                                      text: cubit.policyDetails!.state
                                          .toString()
                                          .capitalize(),
                                      textSize: 12,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: SizeConfig.screenWidth * .03,
                            vertical: SizeConfig.bodyHeight * .02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffffefff)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   AppText(
                                       text:
                                       "${context.localizations.nextPayment}:"),
                                   SizedBox(height: SizeConfig.bodyHeight * .01),
                                   Row(
                                     children: [
                                       AppText(
                                           text: cubit.policyDetails!
                                               .nextPayment !=
                                               null
                                               ? cubit.policyDetails!.nextPayment
                                               .toString()
                                               : "0",
                                           fontWeight: FontWeight.bold,
                                           textSize: 20),
                                       SizedBox(width: 5,),
                                       AppText(
                                           text: context.localizations.egp,
                                           color: Colors.grey),
                                     ],
                                   ),
                                 ],
                               ),
                                SizedBox(height: SizeConfig.bodyHeight * 0.02),
                               /* Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text:
                                        "${context.localizations.nextPaymentDate}:"),
                                    SizedBox(
                                        height: SizeConfig.bodyHeight * .01),
                                    Row(
                                      children: [
                                        AppText(
                                            text: cubit.policyDetails!
                                                .nextPaymentDate ??
                                                "0",
                                            fontWeight: FontWeight.bold,
                                            textSize: 16),
                                      ],
                                    ),
                                  ],
                                ),*/
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
                                    AppText(
                                        text: "${context.localizations.paid}:"),
                                    SizedBox(
                                        height: SizeConfig.bodyHeight * .01),
                                    Row(
                                      children: [
                                        AppText(
                                            text: cubit.policyDetails!
                                                        .totalPaid !=
                                                    null
                                                ? cubit.policyDetails!.totalPaid!.toStringAsFixed(2)
                                                : "0",
                                            fontWeight: FontWeight.bold,
                                            textSize: 20),
                                        AppText(
                                            text:
                                                " ${context.localizations.egp}",
                                            color: Colors.grey),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.bodyHeight * 0.02),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text:
                                            "${context.localizations.nextPaymentDate}:"),
                                    SizedBox(
                                        height: SizeConfig.bodyHeight * .01),
                                    Row(
                                      children: [
                                        AppText(
                                            text: cubit.policyDetails!
                                                    .nextPaymentDate ??
                                                "0",
                                            fontWeight: FontWeight.bold,
                                            textSize: 16),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: SizeConfig.screenWidth * .03,
                          vertical: SizeConfig.bodyHeight * .02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfffefaf8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /* SizedBox(height: SizeConfig.bodyHeight * .02),
                          Row(
                            children: [
                              AppText(
                                  text:
                                      "${context.localizations.beyondPolicyNumber}: ",
                                  textSize: 14),
                              AppText(
                                  text:
                                      cubit.policyDetails!.beyondPolicyNumber ??
                                          "",
                                  fontWeight: FontWeight.bold),
                            ],
                          ),*/
                          SizedBox(height: SizeConfig.bodyHeight * .02),
                          Row(
                            children: [
                              AppText(
                                  text:
                                      "${context.localizations.paymentPlan}: ",
                                  textSize: 14),
                              AppText(
                                  text: cubit.policyDetails!.paymentPlan ?? "",
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .02),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: SizeConfig.screenWidth * .03,
                          vertical: SizeConfig.bodyHeight * .02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfffdeee6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.person),
                              const SizedBox(width: 5),
                              AppText(
                                text:
                                    "${context.localizations.beyondAccountManager}: ",
                                textSize: 14,
                              ),
                              AppText(
                                  text: cubit.policyDetails!
                                          .beyondAccountManager ??
                                      "",
                                  textSize: 14,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .02),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.person),
                              const SizedBox(width: 5),
                              AppText(
                                text:
                                    "${context.localizations.beyondSalesAgent}: ",
                                textSize: 14,
                              ),
                              AppText(
                                  text: cubit.policyDetails!.beyondSalesAgent ??
                                      "",
                                  textSize: 14,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: cubit.policyDetails!.lineOfBusiness.toString() ==
                          "Medical",
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfffefaf8)),
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: SizeConfig.screenWidth * .03,
                            vertical: SizeConfig.bodyHeight * .02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /* SizedBox(height: SizeConfig.bodyHeight * .02),
                            Row(
                              children: [
                                AppText(
                                    text:
                                        "${context.localizations.insurancePlanType}: "),
                                AppText(
                                    text: cubit
                                            .policyDetails!.insurancePlanType ??
                                        "",
                                    fontWeight: FontWeight.bold),
                              ],
                            ),*/
                            SizedBox(height: SizeConfig.bodyHeight * .02),
                            Row(
                              children: [
                                AppText(text: "${context.localizations.tpa}: "),
                                AppText(
                                    text: cubit.policyDetails!.tpa ?? "",
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: SizeConfig.screenWidth * .03,
                          vertical: SizeConfig.bodyHeight * .02),
                      decoration: BoxDecoration(
                        color: const Color(0xffDDF3FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          AppText(
                              text: "${context.localizations.startDate}: ",
                              textSize: 14),
                          AppText(
                              text: " ${cubit.policyDetails!.startDate ?? ""}",
                              fontWeight: FontWeight.bold,
                              textSize: 14),
                          const Spacer(),
                          AppText(
                              text: "${context.localizations.endDate}: ",
                              textSize: 14),
                          AppText(
                              text: " ${cubit.policyDetails!.endDate ?? ""}",
                              fontWeight: FontWeight.bold,
                              textSize: 14),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (cubit.policyDetails!.policyFileURL == null ||
                            cubit.policyDetails!.policyFileName == null) {
                          AppConstant.showCustomSnakeBar(
                              context, "There is no data ", false);
                        } else {
                          cubit.add(DownloadPolicyEvent());
                        }
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: SizeConfig.screenWidth * .03,
                            vertical: SizeConfig.bodyHeight * .02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffffefff)),
                        child: state is DownloadPolicyFileLoading
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenWidth * .1,
                                  ),
                                  LoadingAnimationWidget.threeArchedCircle(
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: cubit.policyDetails!.policyFileURL
                                                .toString()
                                                .isEmpty ||
                                            cubit.policyDetails!.policyFileName
                                                .toString()
                                                .isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                  const SizedBox(width: 5),
                                  AppText(
                                    fontWeight: FontWeight.bold,
                                    color: cubit.policyDetails!.policyFileURL
                                                .toString()
                                                .isEmpty ||
                                            cubit.policyDetails!.policyFileName
                                                .toString()
                                                .isEmpty
                                        ? Colors.grey
                                        : AppColors.blue,
                                    textDecoration: TextDecoration.underline,
                                    text: context.localizations.policyFile,
                                    textSize: 14,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
