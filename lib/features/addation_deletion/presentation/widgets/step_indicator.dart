import 'package:flutter/material.dart';

import '../../../../core/extensions/color_extensions.dart'
    show ColorSchemeExtensions;
import '../../../../widgets/main_widget/app_text.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildStep(
              context: context,
              stepNumber: 1,
              title: "Action Type",
              isActive: currentStep == 1,
              isCompleted: currentStep > 1,
            ),
            _buildConnector(context: context, isCompleted: currentStep > 1),
            _buildStep(
              context: context,
              stepNumber: 2,
              title: "Select Policies",
              isActive: currentStep == 2,
              isCompleted: currentStep > 2,
            ),
            _buildConnector(context: context, isCompleted: currentStep > 2),
            _buildStep(
              context: context,
              stepNumber: 3,
              title: "Method",
              isActive: currentStep == 3,
              isCompleted: currentStep > 3,
            ),
            _buildConnector(context: context, isCompleted: currentStep > 3),
            _buildStep(
              context: context,
              stepNumber: 4,
              title: "Complete",
              isActive: currentStep == 4,
              isCompleted: currentStep > 4,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep({
    required BuildContext context,
    required int stepNumber,
    required String title,
    required bool isActive,
    required bool isCompleted,
  }) {
    Color circleColor;
    Color textColor;
    Widget circleChild;

    if (isCompleted) {
      circleColor = const Color(0xFF5CB85C); // Green
      textColor = Colors.black;
      circleChild = const Icon(Icons.check, color: Colors.white, size: 16);
    } else if (isActive) {
      circleColor = context.colorScheme.primary;
      textColor = Colors.black;
      circleChild = AppText(
        text: stepNumber.toString(),
        color: Colors.white,
        fontWeight: FontWeight.w700,
        textSize: 14,
      );
    } else {
      circleColor = context.colorScheme.outline;
      textColor = context.colorScheme.shadow;
      circleChild = AppText(
        text: stepNumber.toString(),
        color: Colors.white,
        fontWeight: FontWeight.w600,
        textSize: 14,
      );
    }

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: circleChild),
          ),
          const SizedBox(height: 8),
          AppText(
            text: title,
            textSize: 11,
            fontWeight: FontWeight.w500,
            color: textColor,
            align: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildConnector({
    required BuildContext context,
    required bool isCompleted,
  }) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 30),
        color: isCompleted
            ? const Color(0xFF5CB85C)
            : context.colorScheme.outline,
      ),
    );
  }
}
