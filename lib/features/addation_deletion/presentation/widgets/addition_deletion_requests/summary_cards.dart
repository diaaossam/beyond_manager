import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/addition_deletion_ticket.dart';

class SummaryCards extends StatelessWidget {
  final AdditionDeletionTicket additionDeletionTicket;

  const SummaryCards({super.key, required this.additionDeletionTicket});

  @override
  Widget build(BuildContext context) {
    final tickets = additionDeletionTicket.result ?? [];
    final submitted = tickets
        .where((t) => _normalizeStage(t.stage) == 'submitted')
        .length;
    final pending = tickets
        .where((t) => _normalizeStage(t.stage) == 'pending')
        .length;
    final waitingHR = tickets
        .where((t) => _normalizeStage(t.stage) == 'waiting_hr')
        .length;
    final completed = tickets
        .where((t) => _normalizeStage(t.stage) == 'completed')
        .length;
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context: context,
            title: context.localizations.submittedRequests,
            count: submitted.toString(),
            borderColor: const Color(0xFF4A90E2),
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * .02),
        Expanded(
          child: _buildStatCard(
            context: context,
            title: context.localizations.pendingReview,
            count: pending.toString(),
            borderColor: const Color(0xFFF59E0B),
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * .02),
        Expanded(
          child: _buildStatCard(
            context: context,
            title: context.localizations.waitingForHR,
            count: waitingHR.toString(),
            borderColor: const Color(0xFFDC3545),
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * .02),
        Expanded(
          child: _buildStatCard(
            context: context,
            title: context.localizations.statusCompleted,
            count: completed.toString(),
            borderColor: const Color(0xFF5CB85C),
          ),
        ),
      ],
    );
  }

  String _normalizeStage(String? stage) {
    if (stage == null || stage.isEmpty) return '';
    return stage.toLowerCase().replaceAll(' ', '_');
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String count,
    required Color borderColor,
  }) {
    return Container(
      height: SizeConfig.bodyHeight*.12,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: 9,
            color: context.colorScheme.shadow,
            align: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          AppText(
            text: count,
            fontWeight: FontWeight.w700,
            textSize: 22,
            color: context.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
