import 'package:flutter/material.dart';
import '../../../../../config/helper/download_service.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/download_tile_design.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_payment.dart';

class CustomPaymentBody extends StatelessWidget {
  final PolicyPayment result;

  const CustomPaymentBody({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .015),
            Row(
              children: [
                AppText(text: "${context.localizations.currency}: "),
                AppText(
                  text: result.currency ?? "",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .012),
            Row(
              children: [
                AppText(text: "${context.localizations.paymentMethod}: "),
                AppText(
                  text: result.paymentMethod ?? "",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .016),
            Row(
              children: [
                Expanded(
                  child: DownloadTile(
                    enabled: !_checkInvoice(),
                    label: context.localizations.invoiceFile,
                    onTap: () => DownloadServiceHelper().downloadAndOpenFile(url: result.invoiceFile??"",name: result.invoiceFileName??""),
                  ),
                ),
                Expanded(
                  child: DownloadTile(
                    enabled: !_checkPayment(),
                    label: context.localizations.paymentFile,
                    onTap: () =>DownloadServiceHelper().downloadAndOpenFile(url: result.paymentFile??"",name: result.paymentFileName??""),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffDDF3FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: SizeConfig.screenWidth * .04),
              AppText(
                text: "${context.localizations.paymentDate}: ",
                textSize: 12,
              ),
              AppText(
                text: " ${result.paymentDate ?? ""}",
                fontWeight: FontWeight.bold,
                textSize: 12,
              ),
              const Spacer(),
              AppText(text: "${context.localizations.invoiced}: "),
              AppText(
                text: result.invoiced == true
                    ? context.localizations.yes
                    : context.localizations.no,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: SizeConfig.screenWidth * .04),
            ],
          ),
        ),
      ],
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
