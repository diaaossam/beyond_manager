import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';

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
              height: 50,width: 50,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffE4F4FB)),
              child: AppImage.asset(icon,height: 17,width: 17,),
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
