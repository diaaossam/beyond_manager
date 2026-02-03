import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart' show AppText;

class RequestTypeCard extends StatelessWidget {
  final VoidCallback onSelect;
  final bool isSelected;
  final String title, description, buttonText, requestType;
  final IconData icon;

  const RequestTypeCard({
    super.key,
    required this.onSelect,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.requestType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary.withValues(alpha: 0.05)
              : context.colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              width: 40.h,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colorScheme.primary.withValues(alpha: 0.1)
                    : context.colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.shadow,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: title,
              fontWeight: FontWeight.w600,
              textSize: 14,
              color: context.colorScheme.onSurface,
              align: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .015),
            AppText(
              text: description,
              fontWeight: FontWeight.w400,
              textSize: 11,
              color: context.colorScheme.shadow,
              align: TextAlign.center,
              maxLines: 5,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .025),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.bodyHeight * .015,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.shadow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: AppText(
                  text: buttonText,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  textSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
