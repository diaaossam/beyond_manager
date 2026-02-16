import 'package:bond/features/policies/data/models/response/utilization_notification_item_model.dart';
import 'package:bond/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/notification_value_model.dart';
import 'notification_item_design.dart';

class UtilizationNotification extends StatelessWidget {
  final UtilizationNotificationModel? notifications;
  final NotificationValueModel values;
  final bool isLoading;
  final VoidCallback? onRetry;

  const UtilizationNotification({
    super.key,
    this.notifications,
    this.isLoading = false,
    this.onRetry,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SliverFillRemaining(child: LoadingWidget());
    }
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          if (notifications?.exceededMembersTotalConsumptionThreshold !=
              null) ...[
            _buildTitle(count: 1, title: context.localizations.totalConsumptionThreshold),
            NotificationItemDesign(
              body: context.localizations.consumptionExceeded(
                notifications?.exceededMembersTotalConsumptionThreshold ?? "",
                values.totalConsumptionThreshold ?? 0,
              ),
            ),
            10.verticalSpace,
          ],

          if (notifications?.exceededMonths != null &&
              notifications?.exceededMonths?.isNotEmpty == true) ...[
            _buildTitle(count: notifications!.exceededMonths!.length, title: context.localizations.monthlyConsumptionThreshold),
            ...notifications!.exceededMonths!.map((e) {
              return NotificationItemDesign(
                body: context.localizations.monthlyExceeded(
                  e.monthName ?? "",
                  e.totalAmount ?? "0",
                  values.monthlyConsumptionThreshold ?? "0",
                ),
              );
            }),
            10.verticalSpace,
          ],

          if (notifications?.exceededMembersEmployeeAmountThreshold != null &&
              notifications!
                  .exceededMembersEmployeeAmountThreshold!
                  .isNotEmpty) ...[
            _buildTitle(count: notifications!.exceededMembersEmployeeAmountThreshold!.length, title: context.localizations.employeeAmountThreshold),
            NotificationItemDesign(
              body: context.localizations.exceededMembersEmployeeAmountSummary(
                notifications!.exceededMembersEmployeeAmountThreshold!.length,
                _formatAmount(values.employeeAmountThreshold ?? 0),
                '${notifications!.exceededMembersEmployeeAmountThreshold!.map((e) => "${e.memberName ?? ""} (${_formatAmount(e.totalAmount ?? 0)} ${context.localizations.unitEg})").join(", ")}...',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w, top: 4.h),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => _showExceededMembersEmployeeAmountDialog(
                  context,
                  notifications!.exceededMembersEmployeeAmountThreshold!,
                ),
                child: AppText.body(
                  text: context.localizations.viewAll,
                  textSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            10.verticalSpace,
          ],

          if (notifications?.exceededMembersCountThreshold != null &&
              notifications!.exceededMembersCountThreshold!.isNotEmpty) ...[
            _buildTitle(count: notifications!.exceededMembersCountThreshold!.length, title: context.localizations.employeeTransactionCountThreshold),
            NotificationItemDesign(
              body: context.localizations.exceededMembersCountThresholdSummary(
                notifications!.exceededMembersCountThreshold!.length,
                values.employeeTransactionCountThreshold ?? 0,
                '${notifications!.exceededMembersCountThreshold!.map((e) => "${e.memberName ?? ""} (${e.usageCount ?? 0} transactions)").join(", ")}...',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w, top: 4.h),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => _showExceededMembersCountDialog(
                  context,
                  notifications!.exceededMembersCountThreshold!,
                  values.employeeTransactionCountThreshold ?? 0,
                ),
                child: AppText.body(
                  text: context.localizations.viewAll,
                  textSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            10.verticalSpace,
          ],

          24.verticalSpace,
        ],
      ),
    );
  }

  static String _formatAmount(num value) {
    return NumberFormat('#,##0.00').format(value);
  }

  Widget _buildTitle({required String title, required num count}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: AppText.title(
              text: title,
              textSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppText.body(
            text: "${S.current.count}: ${count.toString()}",
            textSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  static void _showExceededMembersEmployeeAmountDialog(
    BuildContext context,
    List<ExceededMembersEmployeeAmountThreshold> list,
  ) {
    final l10n = context.localizations;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: AppText.title(
          text: l10n.exceededEmployeesListTitle,
          textSize: 14,
          maxLines: 20,
          fontWeight: FontWeight.w600,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, i) {
              final e = list[i];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: AppText.body(
                  text: '${e.memberName ?? ""} (${_formatAmount(e.totalAmount ?? 0)} ${l10n.unitEg})',
                  textSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: AppText.body(text: l10n.close, textSize: 14),
          ),
        ],
      ),
    );
  }

  static void _showExceededMembersCountDialog(
    BuildContext context,
    List<ExceededMembersCountThreshold> list,
    num threshold,
  ) {
    final l10n = context.localizations;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: AppText.title(
          text: l10n.exceededEmployeesListTitle,
          textSize: 14,
          maxLines: 20,
          fontWeight: FontWeight.w600,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, i) {
              final e = list[i];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: AppText.body(
                  text: '${e.memberName ?? ""} (${e.usageCount ?? 0} ${l10n.unitCount})',
                  textSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: AppText.body(text: l10n.close, textSize: 14),
          ),
        ],
      ),
    );
  }
}
