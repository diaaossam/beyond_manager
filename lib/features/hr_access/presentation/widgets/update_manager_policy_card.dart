import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/response/policy_access_item.dart';

class UpdateManagerPolicyCard extends StatelessWidget {
  final int index;
  final PolicyAccessItem policy;
  final VoidCallback? onRemove;
  final ValueChanged<PolicyAccessItem> onPolicyUpdated;

  const UpdateManagerPolicyCard({
    super.key,
    required this.index,
    required this.policy,
    this.onRemove,
    required this.onPolicyUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .02),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  text: policy.policyName ?? '',
                  fontWeight: FontWeight.w700,
                  textSize: 14,
                  color: context.colorScheme.onSurface,
                  maxLines: 2,
                ),
              ),
              if (onRemove != null)
                InkWell(
                  onTap: onRemove,
                  child: const Icon(Icons.close, color: Colors.red, size: 24),
                ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          Wrap(
            spacing: SizeConfig.screenWidth * .04,
            runSpacing: SizeConfig.bodyHeight * .01,
            children: [
              _buildCheckbox(
                context,
                value: policy.accessPayment,
                label: context.localizations.accessPayment,
                onChanged: (v) => onPolicyUpdated(policy.copyWith(accessPayment: v ?? false)),
              ),
              _buildCheckbox(
                context,
                value: policy.accessPolicyDetails,
                label: context.localizations.accessPolicyDetails,
                onChanged: (v) => onPolicyUpdated(policy.copyWith(accessPolicyDetails: v ?? false)),
              ),
              _buildCheckbox(
                context,
                value: policy.accessUtilization,
                label: context.localizations.accessUtilization,
                onChanged: (v) => onPolicyUpdated(policy.copyWith(accessUtilization: v ?? false)),
              ),
              _buildCheckbox(
                context,
                value: policy.accessActiveList,
                label: context.localizations.accessActiveList,
                onChanged: (v) => onPolicyUpdated(policy.copyWith(accessActiveList: v ?? false)),
              ),
              _buildCheckbox(
                context,
                value: policy.accessAdditionAndDeletions,
                label: context.localizations.accessAdditionAndDeletions,
                onChanged: (v) =>
                    onPolicyUpdated(policy.copyWith(accessAdditionAndDeletions: v ?? false)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(
    BuildContext context, {
    required bool value,
    required String label,
    required ValueChanged<bool?> onChanged,
  }) {
    return SizedBox(
      child: InkWell(
        onTap: () => onChanged(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: AppText(
                text: label,
                textSize: 12,
                fontWeight: FontWeight.w500,
                color: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
