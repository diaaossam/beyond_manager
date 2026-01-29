import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandedTitleDesign extends StatelessWidget {
  final String title;
  final String icon;

  const ExpandedTitleDesign({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * .02,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.onPrimary),
          child: SvgPicture.asset(icon,height: SizeConfig.bodyHeight*.03,),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .04,
        ),
        Expanded(
          child: AppText(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
