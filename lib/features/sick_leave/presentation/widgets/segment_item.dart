import 'package:flutter/material.dart';

import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';

class SegmentItem extends StatelessWidget {
  final bool selected;
  final String title;
  final double? width;

  const SegmentItem({
    super.key,
    required this.selected,
    required this.title,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .015),
      width: width??SizeConfig.screenWidth * 0.25,
      child: Center(
        child: AppText(
          textSize: 11,
          color: selected ? Colors.white : context.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          text: title,
        ),
      ),
    );
  }
}
