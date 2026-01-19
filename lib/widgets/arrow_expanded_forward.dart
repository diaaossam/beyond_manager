import 'package:bond/core/enum/language.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../core/utils/api_config.dart';

class ArrowExpandedForwardDesign extends StatelessWidget {
  final Color? color;
  final double? size;
  final bool isActive;

  const ArrowExpandedForwardDesign({
    super.key,
    this.color,
    this.size,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    if (ApiConfig.language == Language.english) {
      return AppImage.asset(
        isActive ? Assets.icons.arrowDown : Assets.icons.arrowForward,
        color: color ?? Colors.black,
        height: size,
      );
    } else {
      return AppImage.asset(
        isActive ? Assets.icons.arrowDown : Assets.icons.arrowForward,
        height: size,
        color: color ?? Colors.black,
      );
    }
  }
}
