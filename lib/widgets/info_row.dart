import 'package:flutter/material.dart';

import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import 'main_widget/app_text.dart';

class InfoRow extends StatelessWidget {
  final String keyData, value;

  const InfoRow({super.key, required this.keyData, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.3,
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
