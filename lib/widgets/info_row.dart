import 'package:flutter/material.dart';

import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import 'main_widget/app_text.dart';

class InfoRow extends StatelessWidget {
  final String keyData, value;
  final double? width;
  final CrossAxisAlignment? crossAxisAlignment;

  const InfoRow({
    super.key,
    required this.keyData,
    required this.value,
    this.width,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width ?? SizeConfig.screenWidth * 0.3,
          child: AppText(
            text: keyData,
            textSize: 11,
            color: context.colorScheme.shadow,
          ),
        ),
        Expanded(
          child: AppText(
            text: value,
            fontWeight: FontWeight.w600,
            textSize: 12,
            maxLines: 10,
            textHeight: 1.8,
          ),
        ),
      ],
    );
    ;
  }
}
