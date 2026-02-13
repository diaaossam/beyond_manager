import 'package:flutter/material.dart';

import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import 'main_widget/app_text.dart';

class DownloadTile extends StatelessWidget {
  final bool enabled;
  final String label;
  final VoidCallback onTap;

  const DownloadTile({
    required this.enabled,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: SizeConfig.screenWidth * .03,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              Icons.download,
              color: enabled ? Colors.black : colorScheme.shadow,
            ),
            const SizedBox(width: 5),
            AppText(
              fontWeight: FontWeight.w600,
              color: enabled ? colorScheme.primary : colorScheme.shadow,
              textDecoration: TextDecoration.underline,
              text: label,
              textSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
