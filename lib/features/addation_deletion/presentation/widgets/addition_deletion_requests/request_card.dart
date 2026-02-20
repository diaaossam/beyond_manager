import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/addition_deletion_ticket.dart';
import 'buid_tag_design.dart';
import 'member_list_card.dart';

class RequestCard extends StatefulWidget {
  final AdditionDeletionTicketModel ticket;
  final String? actionRequiredReason;
  final String? actionRequiredWhatToDo;
  final VoidCallback? onDownloadReport;
  final VoidCallback? onContactSupport;

  const RequestCard({
    super.key,
    required this.ticket,
    this.actionRequiredReason,
    this.actionRequiredWhatToDo,
    this.onDownloadReport,
    this.onContactSupport,
  });

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  bool _isDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hasActionRequired =
        widget.actionRequiredReason != null &&
        widget.actionRequiredReason!.isNotEmpty;
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .02),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          if (hasActionRequired) _buildActionRequiredAlert(context),
          _buildDetailsSection(context),
          Padding(
            padding: screenPadding(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton.outline(
                        textSize: 9,
                        text: _isDetailsExpanded
                            ? context.localizations.hideDetails
                            : context.localizations.viewDetails,
                        press: () {
                          setState(
                            () => _isDetailsExpanded = !_isDetailsExpanded,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: CustomButton.outline(
                        textSize: 9,
                        text: context.localizations.downloadExcelReport,
                        press: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                CustomButton(
                  textSize: 9,
                  text: context.localizations.contactSupport,
                  press: () {},
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOutCubic,
                  child: _isDetailsExpanded
                      ? _buildMemberListSection(context)
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDeletion = widget.ticket.requestType?.toLowerCase().contains('deletion') ?? false;
    final statusText = _getStatusText(context);
    final statusColor = _getStatusColor(context);
    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      child: Wrap(
        spacing: SizeConfig.screenWidth * .02,
        runSpacing: SizeConfig.screenWidth * .015,
        children: [
          BuildTagDesign(
            text: 'REQ-${widget.ticket.id.toString().padLeft(6, '0')}',
            backgroundColor: context.colorScheme.surfaceContainerHighest,
            textColor: context.colorScheme.onSurface,
          ),
          BuildTagDesign(
            text: isDeletion
                ? context.localizations.deletionRequest
                : context.localizations.additionRequest,
            backgroundColor: isDeletion
                ? context.colorScheme.error.withValues(alpha: 0.1)
                : context.colorScheme.tertiary.withValues(alpha: 0.1),
            textColor: isDeletion
                ? context.colorScheme.error
                : context.colorScheme.tertiary,
          ),
          _buildStatusTag(context, statusText, statusColor),
        ],
      ),
    );
  }

  Widget _buildActionRequiredAlert(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .03),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        border: Border.all(color: const Color(0xFFFFC107), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber, color: Colors.amber.shade700, size: 20),
              SizedBox(width: SizeConfig.screenWidth * .02),
              AppText(
                text: context.localizations.actionRequired,
                fontWeight: FontWeight.w700,
                textSize: 13,
                color: Colors.amber.shade900,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .008),
          AppText(
            text:
                '${context.localizations.reasonLabel}${widget.actionRequiredReason}',
            textSize: 12,
            color: context.colorScheme.onSurface,
            maxLines: 2,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .004),
          AppText(
            text:
                '${context.localizations.whatToDo}${widget.actionRequiredWhatToDo}',
            textSize: 12,
            color: context.colorScheme.onSurface,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    final submissionDate = _formatDate(widget.ticket.createDate);
    final policiesAffected = (widget.ticket.policyNames ?? []).join(', ');
    final membersCount = widget.ticket.totalMembersCount ?? 0;
    final waitingSince =
        widget.ticket.startPeriodWaitingHr != null &&
            widget.ticket.startPeriodWaitingHr!.isNotEmpty
        ? _formatDate(widget.ticket.startPeriodWaitingHr)
        : null;

    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow(
            context: context,
            label: context.localizations.submissionDate,
            value: submissionDate,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          _buildDetailRow(
            context: context,
            label: context.localizations.policiesAffected,
            value: policiesAffected.isEmpty ? '-' : policiesAffected,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          _buildDetailRow(
            context: context,
            label: context.localizations.membersCount,
            value: context.localizations.countMembers(membersCount.toInt()),
          ),
          if (waitingSince != null) ...[
            SizedBox(height: SizeConfig.bodyHeight * .01),
            _buildDetailRow(
              context: context,
              label: context.localizations.waitingSince,
              value: waitingSince,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * .35,
          child: AppText(
            text: label,
            textSize: 10,
            color: context.colorScheme.shadow,
          ),
        ),
        Expanded(
          child: AppText(
            text: value,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onSurface,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildMemberListSection(BuildContext context) {
    final members = widget.ticket.confirmedMembers ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 1, color: Colors.grey.shade300),
        Padding(
          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              AppText(
                text: context.localizations.membersInThisRequest,
                textSize: 12,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface,
              ),
              if (members.isEmpty) ...[
                SizedBox(height: SizeConfig.bodyHeight * .02),
                AppText(
                  text: context.localizations.noData,
                  textSize: 13,
                  color: context.colorScheme.shadow,
                ),
              ] else ...[
                SizedBox(height: SizeConfig.bodyHeight * .02),
                ...members.asMap().entries.map(
                  (e) => MemberListCard(member: e.value, index: e.key),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusTag(BuildContext context, String text, Color color) {
    final isWaitingHr = widget.ticket.stage == 'Waiting HR';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .006,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isWaitingHr)
            Icon(Icons.arrow_drop_up, size: 14, color: color)
          else
            Icon(Icons.circle, size: 6, color: color),
          SizedBox(width: SizeConfig.screenWidth * .015),
          AppText(
            text: text,
            textSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '-';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat.yMMMMd().format(date);
    } catch (_) {
      return dateString;
    }
  }

  String _getStatusText(BuildContext context) {
    switch (widget.ticket.stage) {
      case 'Waiting HR':
        return context.localizations.statusWaitingHR;
      case 'Submitted':
        return context.localizations.statusSubmitted;
      case 'Pending':
        return context.localizations.statusPending;
      case 'Completed':
        return context.localizations.statusCompleted;
      default:
        return widget.ticket.stage ?? context.localizations.statusUnknown;
    }
  }

  Color _getStatusColor(BuildContext context) {
    switch (widget.ticket.stage) {
      case 'Waiting HR':
        return context.colorScheme.error;
      case 'Submitted':
        return context.colorScheme.primary;
      case 'Pending':
        return Colors.blueAccent;
      case 'Completed':
        return context.colorScheme.tertiary;
      default:
        return context.colorScheme.shadow;
    }
  }
}
