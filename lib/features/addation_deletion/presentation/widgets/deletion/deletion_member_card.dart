import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/addation_deletion/data/models/response/deletion_response_model.dart';
import 'package:bond/features/settings/settings_helper.dart';
import 'package:flutter/material.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../widgets/info_row.dart';

class DeletionMemberCard extends StatefulWidget {
  final DeletionMemberModel deletionMemberModel;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<String?>? onDateSelected;

  const DeletionMemberCard({
    super.key,
    required this.deletionMemberModel,
    required this.isSelected,
    required this.onTap,
    this.onDateSelected,
  });

  @override
  State<DeletionMemberCard> createState() => _DeletionMemberCardState();
}

class _DeletionMemberCardState extends State<DeletionMemberCard>
    with SingleTickerProviderStateMixin {
  String? _selectedDate;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    if (widget.isSelected) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(DeletionMemberCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _animationController.forward();
      } else {
        _animationController.reverse();
        setState(() => _selectedDate = null);
        widget.onDateSelected?.call(null);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final result = await SettingsHelper().showCustomDatePicker(
      context: context,
      initialDate: _selectedDate != null ? DateTime.tryParse(_selectedDate!) : now,
      firstDate: now.subtract(const Duration(days: 30)),
      lastDate: now,
    );
    if (result != null) {
      setState(() => _selectedDate = result.formattedDate);
      widget.onDateSelected?.call(result.formattedDate);
    }
  }

  bool get _isPrincipal =>
      widget.deletionMemberModel.principalInsuranceId == null ||
      widget.deletionMemberModel.principalInsuranceId.toString().isEmpty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(
          bottom: SizeConfig.bodyHeight * .015,
          left: SizeConfig.screenWidth * .04,
          right: SizeConfig.screenWidth * .04,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFEFAF8),
          border: Border.all(
            color: widget.isSelected
                ? context.colorScheme.primary
                : const Color(0xFFEAEAEA),
            width: widget.isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Member info ──────────────────────────────────────────
            Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Checkbox indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 22,
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: widget.isSelected
                              ? context.colorScheme.primary
                              : Colors.transparent,
                          border: Border.all(
                            color: widget.isSelected
                                ? context.colorScheme.primary
                                : const Color(0xFFCCCCCC),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: widget.isSelected
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 14)
                            : null,
                      ),
                      Expanded(
                        child: AppText(
                          text: widget.deletionMemberModel.insuredMember ?? 'N/A',
                          fontWeight: FontWeight.w600,
                          textSize: 12,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      if (_isPrincipal)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A90E2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: AppText(
                            text: widget.deletionMemberModel.relation.toString(),
                            fontWeight: FontWeight.w600,
                            textSize: 10,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  InfoRow(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    keyData: "${context.localizations.staffId}:",
                    value: widget.deletionMemberModel.staffid ?? 'N/A',
                    width: SizeConfig.screenWidth * .2,
                  ),
                  InfoRow(
                    keyData: "${context.localizations.nationalIdCNID}:",
                    value: widget.deletionMemberModel.nationalnumber ?? 'N/A',
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  InfoRow(
                    keyData: "${context.localizations.insuranceID}:",
                    value: widget.deletionMemberModel.insuranceId ?? 'N/A',
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  InfoRow(
                    keyData: "${context.localizations.nationality}:",
                    value: widget.deletionMemberModel.nationality ?? 'N/A',
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  InfoRow(
                    keyData: "${context.localizations.principalInsuranceID}:",
                    value:
                        widget.deletionMemberModel.principalInsuranceId ?? 'N/A',
                    crossAxisAlignment: CrossAxisAlignment.center,
                    width: SizeConfig.screenWidth * .4,
                  ),
                ],
              ),
            ),

            // ── Date selection section (animated expand) ─────────────
            SizeTransition(
              sizeFactor: _expandAnimation,
              axisAlignment: -1,
              child: _DateSelectionSection(
                selectedDate: _selectedDate,
                isPrincipal: _isPrincipal,
                onPickDate: _pickDate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Date selection sub-widget
// ─────────────────────────────────────────────────────────────────────────────
class _DateSelectionSection extends StatelessWidget {
  final String? selectedDate;
  final bool isPrincipal;
  final VoidCallback onPickDate;

  const _DateSelectionSection({
    required this.selectedDate,
    required this.isPrincipal,
    required this.onPickDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.screenWidth * .04,
        right: SizeConfig.screenWidth * .04,
        bottom: SizeConfig.screenWidth * .04,
      ),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.05),
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text('📅', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              AppText(
                text: 'Set Deletion Date',
                fontWeight: FontWeight.w700,
                textSize: 13,
                color: context.colorScheme.primary,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .012),

          // Label
          Row(
            children: [
              AppText(
                text: 'Deletion Date',
                fontWeight: FontWeight.w500,
                textSize: 12,
                color: context.colorScheme.onSurface,
              ),
              const SizedBox(width: 3),
              AppText(
                text: '*',
                fontWeight: FontWeight.w700,
                textSize: 12,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .008),

          // Date field (tappable)
          GestureDetector(
            onTap: onPickDate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFCCCCCC)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      text: selectedDate ?? 'dd/mm/yyyy',
                      textSize: 13,
                      color: selectedDate != null
                          ? context.colorScheme.onSurface
                          : const Color(0xFFAAAAAA),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: SizeConfig.bodyHeight * .01),

          // Hints
          if (isPrincipal) ...[
            _HintRow(text: 'This date will apply to all family members'),
          ],
          _HintRow(text: 'Maximum 30 days back date allowed'),
        ],
      ),
    );
  }
}

class _HintRow extends StatelessWidget {
  final String text;
  const _HintRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 13, color: context.colorScheme.primary),
          const SizedBox(width: 4),
          Expanded(
            child: AppText(
              text: text,
              textSize: 11,
              color: context.colorScheme.shadow,
            ),
          ),
        ],
      ),
    );
  }
}
