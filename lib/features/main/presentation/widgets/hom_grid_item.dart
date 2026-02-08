import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';

class CustomItemHome extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPress;

  const CustomItemHome({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: SizeConfig.bodyHeight * .22,
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xfffefaf8),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: SizeConfig.bodyHeight * .11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFDEEE6),
                    ),
                  ),
                  AppImage.asset(
                    icon,
                    color: context.colorScheme.primary,
                    height: SizeConfig.bodyHeight * .06,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .015),
              AppText(
                align: TextAlign.center,
                text: title,
                textSize: 12,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
            ],
          ),
        ),
      ),
    );
  }
}
