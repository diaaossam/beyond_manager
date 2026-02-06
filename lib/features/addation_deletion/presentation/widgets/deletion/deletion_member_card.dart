import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/addation_deletion/data/models/deletion_response_model.dart';
import 'package:flutter/material.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/main_widget/app_text.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../widgets/info_row.dart';

class DeletionMemberCard extends StatelessWidget {
  final DeletionMemberModel deletionMemberModel;
  final bool isSelected;
  final VoidCallback onTap;

  const DeletionMemberCard({
    super.key,
    required this.deletionMemberModel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: SizeConfig.bodyHeight * .015,
          left: SizeConfig.screenWidth * .04,
          right: SizeConfig.screenWidth * .04,
        ),
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
          color: const Color(0xFFFEFAF8),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : const Color(0xFFEAEAEA),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorScheme.surface,
                    border: Border.all(
                      color: isSelected
                          ? context.colorScheme.primary
                          : context.colorScheme.shadow,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppText(
                    text: deletionMemberModel.insuredMember ?? 'N/A',
                    fontWeight: FontWeight.w600,
                    textSize: 13,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .015),
            if (deletionMemberModel.principalInsuranceId == null ||
                deletionMemberModel.principalInsuranceId.toString().isEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  AppText(
                  text:deletionMemberModel.relation.toString(),
                  fontWeight: FontWeight.w600,
                  textSize: 10,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            InfoRow(
              crossAxisAlignment: CrossAxisAlignment.center,
              keyData: "${context.localizations.staffId}:",
              value: deletionMemberModel.staffid ?? 'N/A',
              width: SizeConfig.screenWidth*.2,
            ),
            InfoRow(
              keyData: "${context.localizations.nationalIdCNID}:",
              value: deletionMemberModel.nationalnumber ?? 'N/A',
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .008),
            InfoRow(
              keyData: "${context.localizations.insuranceID}:",
              value: deletionMemberModel.insuranceId ?? 'N/A',
              crossAxisAlignment: CrossAxisAlignment.center,
            ), InfoRow(
              keyData: "${context.localizations.nationality}:",
              value: deletionMemberModel.nationality ?? 'N/A',
              crossAxisAlignment: CrossAxisAlignment.center,
            ), InfoRow(
              keyData: "${context.localizations.principalInsuranceID}:",
              value: deletionMemberModel.principalInsuranceId ?? 'N/A',
              crossAxisAlignment: CrossAxisAlignment.center,
              width: SizeConfig.screenWidth*.4,
            ),
          ],
        ),
      ),
    );
  }
}
