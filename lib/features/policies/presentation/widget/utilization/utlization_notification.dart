import 'package:bond/features/policies/data/models/response/utilization_notification_item_model.dart';
import 'package:bond/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

            ...notifications!.exceededMembersEmployeeAmountThreshold!.map((e) {
              return NotificationItemDesign(
                body: context.localizations.employeesExceededAmountThreshold(
                  e.memberName ?? "",
                  e.totalAmount?.toStringAsFixed(2) ?? "0",
                ),
              );
            }),
            10.verticalSpace,
          ],

          if (notifications?.exceededMembersCountThreshold != null &&
              notifications!.exceededMembersCountThreshold!.isNotEmpty) ...[
            _buildTitle(count: notifications!.exceededMembersCountThreshold!.length, title: context.localizations.employeeTransactionCountThreshold),
            ...notifications!.exceededMembersCountThreshold!.map((e) {
              return NotificationItemDesign(
                body: context.localizations
                    .employeesExceededTransactionThreshold(
                      e.memberName ?? "",
                      e.usageCount ?? "0",
                    ),
              );
            }),
            10.verticalSpace,
          ],

          24.verticalSpace,
        ],
      ),
    );
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
}
