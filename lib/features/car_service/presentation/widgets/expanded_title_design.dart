import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_size.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';

class ExpandedTitleDesign extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final VoidCallback onPressed;
  final bool isChangeSubTitleColor;

  const ExpandedTitleDesign({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onPressed,
    required this.isChangeSubTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.onPrimary,
              ),
              child: AppImage.asset(
                icon,
                height: 17,
                width: 17,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * .04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                    color: context.colorScheme.onSurface,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  AppText(
                    text: subTitle,
                    fontWeight: FontWeight.w500,
                    textSize: 11,
                    color: isChangeSubTitleColor
                        ? context.colorScheme.primary
                        : context.colorScheme.shadow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
