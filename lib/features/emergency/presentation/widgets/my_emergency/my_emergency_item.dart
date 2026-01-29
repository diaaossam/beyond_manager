import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/extensions/color_extensions.dart';

class MyEmergencyItemDesign extends StatelessWidget {
  final EmergencyModel model;
  final int index;

  const MyEmergencyItemDesign({
    super.key,
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      duration: Duration(milliseconds: 400 + (50)),
      delay: Duration(milliseconds: 50),
      from: 50,
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * 0.015),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.04,
          vertical: SizeConfig.bodyHeight * 0.02,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          border: Border.all(color: context.colorScheme.outline, width: 1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppText(
                  text: "${context.localizations.name}: ",
                  textSize: 12,
                  color: context.colorScheme.shadow,
                ),
                Expanded(
                  child: AppText(
                    text: model.name ?? "",
                    textSize: 12,
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * 0.01),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "${context.localizations.notes}: ",
                  textSize: 12,
                  color: context.colorScheme.shadow,
                ),
                Expanded(
                  child: AppText(
                    text: model.note ?? "",
                    textSize: 12,
                    fontWeight: FontWeight.w600,
                    maxLines: 3,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * 0.015),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 14,
                  color: context.colorScheme.shadow,
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.01),
                Expanded(
                  child: AppText(
                    text: _formatDate(model.date),
                    textSize: 11,
                    color: context.colorScheme.shadow,
                  ),
                ),
                _buildStatusBadge(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    final isDone = model.state?.toLowerCase() == "done";
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.04,
        vertical: SizeConfig.bodyHeight * 0.008,
      ),
      decoration: BoxDecoration(
        color: isDone ? context.colorScheme.tertiary : const Color(0xffFFC107),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(
        text: model.state ?? "",
        textSize: 12,
        fontWeight: FontWeight.w600,
        color: isDone ? Colors.white : Colors.black87,
      ),
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      final dateFormat = DateFormat.yMMMd();
      final timeFormat = DateFormat.jm();
      return '${dateFormat.format(date)} ${timeFormat.format(date)}';
    } catch (e) {
      return dateString;
    }
  }
}
