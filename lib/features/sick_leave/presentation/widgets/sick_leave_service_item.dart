import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

class SickLeaveServiceItem extends StatelessWidget {
  final VoidCallback press;
  final String icon;
  final String title;

  const SickLeaveServiceItem({
    super.key,
    required this.press,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: press,
        child: Container(
          height: SizeConfig.bodyHeight * .1,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .06,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
            vertical: SizeConfig.bodyHeight * .02,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            border: Border.all(
              color: context.colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.onPrimary,
                ),
                child: AppImage.asset(icon),
              ),
              SizedBox(width: SizeConfig.screenWidth * .02),
              AppText(
                text: title,
                fontWeight: FontWeight.bold,
                textSize: 14,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 11,
                color: context.colorScheme.onSurface,
              ),
              SizedBox(width: SizeConfig.screenWidth * .02),
            ],
          ),
        ),
      ),
    );
  }
}
