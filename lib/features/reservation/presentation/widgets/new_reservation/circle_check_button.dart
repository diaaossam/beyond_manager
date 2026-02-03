import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CircleCheckButton extends StatelessWidget {
  final bool isSelected;

  const CircleCheckButton({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeConfig.bodyHeight * .03,
        height: SizeConfig.bodyHeight * .03,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff898A8D), width: 2),
        ),
        child: Center(
          child: isSelected
              ? Icon(
                  Icons.check,
                  color: context.colorScheme.primary,
                  size: SizeConfig.bodyHeight * .02,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
