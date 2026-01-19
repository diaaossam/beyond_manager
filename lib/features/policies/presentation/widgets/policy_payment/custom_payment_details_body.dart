import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_constant.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/policy_payment.dart';
import 'package:beymanger/features/policies/presentation/cubit/policy_payment/policy_payment_bloc.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomPaymentBody extends StatelessWidget {
  final PolicyPayment result;

  const CustomPaymentBody({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PolicyPaymentBloc, PolicyPaymentState>(
      listener: (context, state) {
        if (state is DownloadPaymentError) {
          AppConstant.showCustomSnakeBar(context, state.errorMsg, false);
        } else if (state is DownloadInvoiceError) {
          AppConstant.showCustomSnakeBar(context, state.errorMsg, false);
        }
      },
      builder: (context, state) {
        PolicyPaymentBloc cubit = BlocProvider.of<PolicyPaymentBloc>(context);
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
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.bodyHeight * .015),
                    Row(
                      children: [
                        AppText(text: "${context.localizations.currency}: "),
                        AppText(
                            text: result.currency ?? "",
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .012),
                    Row(
                      children: [
                        AppText(
                            text: "${context.localizations.paymentMethod}: "),
                        AppText(
                            text: result.paymentMethod ?? "",
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .016),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (_checkInvoice()) {
                                AppConstant.showCustomSnakeBar(
                                    context, "There is no Files ", false);
                              } else {
                                cubit.add(
                                    DownloadInvoiceFile(policyPayment: result));
                              }
                            },
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: SizeConfig.screenWidth * .03,
                                  vertical: SizeConfig.bodyHeight * .02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.red
                              ),
                              child: state is DownloadInvoiceLoading
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: SizeConfig.screenWidth * .1,
                                        ),
                                        LoadingAnimationWidget
                                            .threeArchedCircle(
                                          color: AppColors.primary,
                                          size: 20,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.download,
                                          color: _checkInvoice()
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                        const SizedBox(width: 5),
                                        AppText(
                                          fontWeight: FontWeight.bold,
                                          color: _checkInvoice()
                                              ? Colors.grey
                                              : AppColors.blue,
                                          textDecoration:
                                              TextDecoration.underline,
                                          text: "Invoice File",
                                          textSize: 14,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (_checkPayment()) {
                                AppConstant.showCustomSnakeBar(
                                    context, "There is no Files", false);
                              } else {
                                cubit.add(
                                    DownloadPaymentFile(policyPayment: result));
                              }
                            },
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: SizeConfig.screenWidth * .03,
                                  vertical: SizeConfig.bodyHeight * .02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.red
                              ),
                              child: state is DownloadPaymentLoading
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: SizeConfig.screenWidth * .1,
                                        ),
                                        LoadingAnimationWidget
                                            .threeArchedCircle(
                                          color: AppColors.primary,
                                          size: 20,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.download,
                                          color: _checkPayment()
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                        const SizedBox(width: 5),
                                        AppText(
                                          fontWeight: FontWeight.bold,
                                          color: _checkPayment()
                                              ? Colors.grey
                                              : AppColors.blue,
                                          textDecoration:
                                              TextDecoration.underline,
                                          text: "Payment File",
                                          textSize: 14,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffDDF3FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: SizeConfig.screenWidth * .04),
                    AppText(
                        text: "${context.localizations.paymentDate}: ",
                        textSize: 14),
                    AppText(
                        text: " ${result.paymentDate ?? ""}",
                        fontWeight: FontWeight.bold,
                        textSize: 14),
                    const Spacer(),
                    AppText(text: "${context.localizations.invoiced}: "),
                    AppText(
                        text: result.invoiced == true
                            ? context.localizations.yes
                            : context.localizations.no,
                        fontWeight: FontWeight.bold),
                    SizedBox(width: SizeConfig.screenWidth * .04),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool _checkInvoice() {
    return result.invoiceFile == null ||
        result.invoiceFileName == null ||
        result.invoiceFile.toString().isEmpty ||
        result.invoiceFileName.toString().isEmpty;
  }

  bool _checkPayment() {
    return result.paymentFile == null ||
        result.paymentFileName == null ||
        result.paymentFile.toString().isEmpty ||
        result.paymentFileName.toString().isEmpty;
  }
}
