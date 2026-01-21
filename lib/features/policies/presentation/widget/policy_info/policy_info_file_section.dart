import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_details.dart';

class PolicyInfoFileSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoFileSection({
    super.key,
    required this.policyDetails,
  });

  bool get _hasFile {
    return policyDetails.policyFileURL != null &&
        policyDetails.policyFileName != null &&
        policyDetails.policyFileURL!.isNotEmpty &&
        policyDetails.policyFileName!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return InkWell(
      onTap: _hasFile
          ? () => _onOpenFile(context: context, url: policyDetails.policyFileURL)
          : () => AppConstant.showCustomSnakeBar(
                context,
                context.localizations.thereIsNoFile,
                false,
              ),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: SizeConfig.screenWidth * .03,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffefff),
        ),
        child: Row(
          children: [
            Icon(
              Icons.download,
              color: _hasFile ? Colors.black : colorScheme.shadow,
            ),
            const SizedBox(width: 5),
            AppText(
              fontWeight: FontWeight.w600,
              color: _hasFile ? colorScheme.primary : colorScheme.shadow,
              textDecoration: TextDecoration.underline,
              text: context.localizations.policyFile,
              textSize: 12,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOpenFile({
    required BuildContext context,
    required String? url,
  }) async {
    if (url == null || url.isEmpty) {
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.thereIsNoFile,
        false,
      );
      return;
    }

    final canOpen = await canLaunchUrlString(url);
    if (!canOpen) {
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.cannotOpenFile,
        false,
      );
      return;
    }

    await launchUrlString(url);
  }
}
