import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/arrow_expanded_forward.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class PolicyDashboardItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback press;

  const PolicyDashboardItem({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: SizeConfig.bodyHeight * .1,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .03),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .04,
          vertical: SizeConfig.bodyHeight * .01,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.onPrimary,
              ),
              child: AppImage.asset(
                icon,
                height: 25.h,
                width: 25.h,
                color: context.colorScheme.primary,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * .02),
            AppText(text: title, fontWeight: FontWeight.w600, textSize: 13),
            const Spacer(),
            const ArrowExpandedForwardDesign(size: 11),
            SizedBox(width: SizeConfig.screenWidth * .02),
          ],
        ),
      ),
    );
  }
}
