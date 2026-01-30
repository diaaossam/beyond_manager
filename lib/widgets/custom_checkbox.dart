import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_size.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isSelected;
  final ValueChanged<bool>? onChanged;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? size;
  final Color? checkColor;
  final double? borderRadius;

  const CustomCheckbox({
    super.key,
    required this.isSelected,
    this.onChanged,
    this.selectedColor,
    this.unselectedColor,
    this.size,
    this.checkColor,
    this.borderRadius,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _checkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    if (widget.isSelected) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? SizeConfig.bodyHeight * .025;
    final borderRadius = widget.borderRadius ?? 6.0;

    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(!widget.isSelected);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? (widget.selectedColor ?? context.colorScheme.primary)
                    : (widget.unselectedColor ?? Colors.white),
                border: Border.all(
                  color: widget.isSelected
                      ? (widget.selectedColor ?? context.colorScheme.primary)
                      : const Color(0xffE0E0E0),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: widget.isSelected
                  ? Transform.scale(
                      scale: _checkAnimation.value,
                      child: Icon(
                        Icons.check,
                        color: widget.checkColor ?? Colors.white,
                        size: size * 0.6,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class SquareCheckbox extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool>? onChanged;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? size;
  final Color? checkColor;

  const SquareCheckbox({
    super.key,
    required this.isSelected,
    this.onChanged,
    this.selectedColor,
    this.unselectedColor,
    this.size,
    this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      isSelected: isSelected,
      onChanged: onChanged,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      size: size,
      checkColor: checkColor,
      borderRadius: 4.0,
    );
  }
}
