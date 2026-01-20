import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/policy_payment.dart';

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
                  child: _DownloadTile(
                    enabled: !_checkInvoice(),
                    label: context.localizations.invoiceFile,
                    onTap: () =>
                        _onOpenFile(context: context, url: result.invoiceFile),
                  ),
                ),
                Expanded(
                  child: _DownloadTile(
                    enabled: !_checkPayment(),
                    label: context.localizations.paymentFile,
                    onTap: () =>
                        _onOpenFile(context: context, url: result.paymentFile),
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

  Future<void> _onOpenFile({
    required BuildContext context,
    required String? url,
  }) async {
    if (url == null || url.isEmpty) {
      AppConstant.showCustomSnakeBar(context, context.localizations.thereIsNoFile, false);
      return;
    }

    final canOpen = await canLaunchUrlString(url);
    if (!canOpen) {
      AppConstant.showCustomSnakeBar(context, context.localizations.cannotOpenFile, false);
      return;
    }

    await launchUrlString(url);
  }
}

class _DownloadTile extends StatelessWidget {
  final bool enabled;
  final String label;
  final VoidCallback onTap;

  const _DownloadTile({
    required this.enabled,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: SizeConfig.screenWidth * .03,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(Icons.download, color: enabled ? Colors.black : colorScheme.shadow),
            const SizedBox(width: 5),
            AppText(
              fontWeight: FontWeight.w600 ,
              color: enabled ? colorScheme.primary : colorScheme.shadow,
              textDecoration: TextDecoration.underline,
              text: label,
              textSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
