import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandedTitleDesign extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final VoidCallback onPressed;
  final bool isChangeSubTitleColor;

  const ExpandedTitleDesign(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onPressed,
      required this.isChangeSubTitleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color:  context.colorScheme.onPrimary),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * .04,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: SizeConfig.bodyHeight * .01,
                  ),
                  AppText(
                    text:subTitle,
                    fontWeight: FontWeight.w500,
                    textSize: 12,
                    color:isChangeSubTitleColor ? Colors.blue : Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
