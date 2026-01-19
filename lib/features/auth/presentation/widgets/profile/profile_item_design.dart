import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class ProfileItemDesign extends StatelessWidget {
  final String icon;
  final String title;
  final String body;

  const ProfileItemDesign({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppImage.asset(icon),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        AppText(
          maxLines: 1,
          text: title,
          fontWeight: FontWeight.bold,
          color: context.colorScheme.shadow,
          textSize: 15,
        ),
        SizedBox(height: SizeConfig.bodyHeight * .01),
        AppText(
          maxLines: 1,
          text: body,
          fontWeight: FontWeight.bold,
          textSize: 14,
        ),
      ],
    );
  }
}
