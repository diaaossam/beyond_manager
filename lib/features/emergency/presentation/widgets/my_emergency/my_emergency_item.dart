import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      duration: Duration(milliseconds: 400 + (index * 50)),
      delay: Duration(milliseconds: index * 50),
      from: 50,
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * 0.015),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.04,
          vertical: SizeConfig.bodyHeight * 0.02,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
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
                  textSize: 14,
                  color: Theme.of(context).colorScheme.shadow,
                ),
                Expanded(
                  child: AppText(
                    text: model.name ?? "",
                    textSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
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
                  textSize: 14,
                  color: Theme.of(context).colorScheme.shadow,
                ),
                Expanded(
                  child: AppText(
                    text: model.note ?? "",
                    textSize: 14,
                    fontWeight: FontWeight.w500,
                    maxLines: 3,
                    color: Theme.of(context).colorScheme.onSurface,
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
                  color: Theme.of(context).colorScheme.shadow,
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.01),
                Expanded(
                  child: AppText(
                    text: _formatDate(model.date),
                    textSize: 12,
                    color: Theme.of(context).colorScheme.shadow,
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
        color: isDone
            ? Theme.of(context).colorScheme.tertiary
            : const Color(0xffFFC107),
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
