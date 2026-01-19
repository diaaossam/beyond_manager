import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_strings.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: context.localizations.alreadyHaveAccount,
                style: mainTextStyle(context),
              ),
              const WidgetSpan(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              ),
              TextSpan(
                text: context.localizations.login,
                style: termsTextStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle mainTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: AppStrings.arabicFont,
        overflow: TextOverflow.ellipsis,
        color: context.colorScheme.onSurface,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle termsTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: AppStrings.arabicFont,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600,
        color: context.colorScheme.primary,
        fontSize: 12,
      );
}
