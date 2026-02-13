import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemDesign extends StatelessWidget {
  final String body;

  const NotificationItemDesign({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          AppImage.asset(Assets.images.logo.path, size: 50),
          10.horizontalSpace,
          Expanded(child: AppText(text: body, maxLines: 10,fontWeight: FontWeight.w500,)),
        ],
      ),
    );
  }
}
