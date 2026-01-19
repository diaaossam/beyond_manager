import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_arrow1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PolicyDetailsItemDesign extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback press;

  const PolicyDetailsItemDesign(
      {super.key,
      required this.title,
      required this.icon,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: SizeConfig.bodyHeight * .1,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .06,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
            vertical: SizeConfig.bodyHeight * .02),
        decoration: BoxDecoration(
            color: const Color(0xfffefaf8),
            border: Border.all(
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title == context.localizations.policyInformation
                ? Container(
                    padding: const EdgeInsets.only(
                        bottom: 3, left: 3, top: 10, right: 3),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffFDEEE6)),
                    child: SvgPicture.asset(icon))
                : Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffFDEEE6)),
                    child: SvgPicture.asset(icon,color: AppColors.primary,)),
            SizedBox(width: SizeConfig.screenWidth * .02),
            AppText(
              text: title,
              fontWeight: FontWeight.bold,
              textSize: 16,
            ),
            const Spacer(),
            const CustomArrow1(
              size: 11,
            ),
            SizedBox(width: SizeConfig.screenWidth * .02),
          ],
        ),
      ),
    );
  }
}
