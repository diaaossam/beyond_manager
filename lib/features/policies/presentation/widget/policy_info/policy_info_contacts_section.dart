import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/policy_details.dart';

class PolicyInfoContactsSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoContactsSection({
    super.key,
    required this.policyDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: SizeConfig.screenWidth * .02,
        vertical: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfffdeee6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              AppImage.asset(
                Assets.icons.person,
                height: 15,
              ),
              const SizedBox(width: 5),
              AppText(
                text: "${context.localizations.beyondAccountManager}: ",
                textSize: 12,
              ),
              AppText(
                text: policyDetails.beyondAccountManager ?? "",
                textSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              AppImage.asset(
                Assets.icons.person,
                height: 15,
              ),
              const SizedBox(width: 5),
              AppText(
                text: "${context.localizations.beyondSalesAgent}: ",
                textSize: 12,
              ),
              AppText(
                text: policyDetails.beyondSalesAgent ?? "",
                textSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
