import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/reimbursement/data/models/reimbursement_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'info_bubble.dart';

class ReimbursementTitleCard extends StatelessWidget {
  final ReimbursementModel request;
  final VoidCallback? onViewAllClaims;

  ReimbursementTitleCard({
    super.key,
    required this.request,
    this.onViewAllClaims,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 AppText(
            text: '${request.memberName}',
            fontWeight: FontWeight.bold,
            textSize: 13,
            color: AppColors.primary,
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          _buildInfoRow(
            'ID Number',
            request.idNumber ?? 'N/A',
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          _buildInfoRow(
            'Staff Id',
            request.staffId ?? 'N/A',
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          _buildInfoRow(
            'Service Type',
            request.serviceType ?? 'N/A',
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          _buildInfoRow(
            'Service Date',
            request.serviceDate != null && request.serviceDate!.isNotEmpty
                ? DateFormat('MMM dd, yyyy')
                    .format(DateTime.parse(request.serviceDate.toString()))
                : 'N/A',
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          _buildInfoRow(
            'Claimed Amount',
            request.claimedAmount != null
                ? '${request.claimedAmount!.toString()} EGP'
                : 'N/A',
            isAmount: true,
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          _buildStatusWidget(),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),
          InfoBubble(message: '${request.statusInfo}',),
          SizedBox(height: SizeConfig.bodyHeight * 0.01),

          if (onViewAllClaims != null) ...[
            SizedBox(height: SizeConfig.bodyHeight * 0.02),
            CustomButton(
              text: 'View all member claims',
              press: onViewAllClaims!,
              height: 40,
              textSize: 14,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isAmount = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.3,
          child: AppText(
            text: "$label:",
            textSize: 12,
            color: AppColors.iconGrey,
          ),
        ),
        Expanded(
          child: AppText(
            text: value,
            textSize: 12,
            color: isAmount ? AppColors.primary : null,
            fontWeight: isAmount ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  final _controller = SuperTooltipController();

  Widget _buildStatusWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.3,
          child: AppText(
            text: "Status :",
            textSize: 14,
            color: AppColors.iconGrey,
          ),
        ),
        Expanded(
          child: AppText(
            text: request.claimStatus.toString(),
            fontWeight: FontWeight.w600,
            textSize: 13,
            maxLines: 10,
            textHeight: 1.8,
          ),
        )
      ],
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return AppColors.green;
      case 'pending':
        return AppColors.primaryYellow;
      case 'under review':
        return AppColors.blue;
      case 'rejected':
        return AppColors.red;
      default:
        return AppColors.iconGrey;
    }
  }
}
