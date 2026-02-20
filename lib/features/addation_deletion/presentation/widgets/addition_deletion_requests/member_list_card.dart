import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/addition_deletion_ticket.dart';

class MemberListCard extends StatelessWidget {
  final ConfirmedMembers member;
  final int index;

  const MemberListCard({
    super.key,
    required this.member,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final name = member.insuredMember ?? member.arInsuredMember ?? '-';
    final nationalId = member.nationalnumber ?? '-';
    final role = _getLocalizedRelation(context, member.relation);

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .012),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFF59E0B),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: name,
                      textSize: 12,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onSurface,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .006),
                    AppText(
                      text: '${context.localizations.nationalIdLabel} $nationalId',
                      textSize: 11,
                      color: context.colorScheme.shadow,
                      maxLines: 1,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .006),
                    AppText(
                      text: '${context.localizations.relation} $role',
                      textSize: 11,
                      color: context.colorScheme.shadow,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate()
        .fadeIn(duration: 600.ms, delay: (50 * index).ms)
        .slideX(begin: 0.05, end: 0, duration: 350.ms, delay: (50 * index).ms);
  }

  String _getLocalizedRelation(BuildContext context, String? relation) {
    if (relation == null || relation.isEmpty) return '-';
    final lower = relation.toLowerCase();
    if (lower.contains('principal')) return context.localizations.principal;
    if (lower.contains('spouse')) return context.localizations.spouse;
    if (lower.contains('son')) return context.localizations.son;
    if (lower.contains('daughter')) return context.localizations.daughter;
    if (lower.contains('child')) return context.localizations.child;
    return relation;
  }
}
