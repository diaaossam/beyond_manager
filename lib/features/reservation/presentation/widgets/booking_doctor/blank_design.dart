import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

class DateOfBirthDesignOnly extends StatelessWidget {
  final String? date;
  final VoidCallback? onTap;

  const DateOfBirthDesignOnly({super.key, this.date, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .03,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            AppImage.asset(Assets.icons.calendar3, width: 20),
            SizedBox(width: SizeConfig.screenWidth * .03),
            Expanded(
              child: AppText(
                text: date ?? context.localizations.dateOfBirth,
                color: date != null
                    ? context.colorScheme.onSurface
                    : context.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
