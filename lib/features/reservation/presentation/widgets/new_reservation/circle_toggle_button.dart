import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CircleToggleButton extends StatelessWidget {
  final bool isSelected;
  final double? size;

  const CircleToggleButton({super.key, required this.isSelected, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size ?? SizeConfig.bodyHeight * .03,
        height: size ?? SizeConfig.bodyHeight * .03,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colorScheme.outline, width: 2),
        ),
        child: Center(
          child: Container(
            width: SizeConfig.bodyHeight * .015,
            height: SizeConfig.bodyHeight * .015,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? context.colorScheme.primary
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
