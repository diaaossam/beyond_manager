import 'package:flutter/material.dart';

import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';


class InsuranceCard extends StatelessWidget {
  const InsuranceCard({super.key,
    required this.title,
    required this.buttonText,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String buttonText;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: screenPadding(),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.1),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  AppText(
                    text: title,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                  Container(
                    height: SizeConfig.bodyHeight * .05,
                    width: SizeConfig.screenWidth * .35,
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .12,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: AppText(
                        text: buttonText,
                        color: context.colorScheme.onSecondary,
                        fontWeight: FontWeight.w600,
                        textSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .015),
                ],
              ),
            ),
            AppImage.asset(
              imagePath,
              height: SizeConfig.bodyHeight * .15,
            ),
            SizedBox(width: SizeConfig.screenWidth * .08),
          ],
        ),
      ),
    );
  }
}
