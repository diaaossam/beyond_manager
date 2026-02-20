import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class BuildTagDesign extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const BuildTagDesign({super.key, required this.text, required this.backgroundColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .006,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: AppText(
        text: text,
        textSize: 11,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );
  }
}
