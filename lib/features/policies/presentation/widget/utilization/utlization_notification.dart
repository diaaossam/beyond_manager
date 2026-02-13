import 'package:bond/features/policies/data/models/response/utilization_notification_item_model.dart';
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
          AppText.title(
            text: context.localizations.utilizationNotifications,
            textSize: 14,
            fontWeight: FontWeight.w700,
          ),
          24.verticalSpace,
          if (notifications?.exceededMembersTotalConsumptionThreshold != null) ...[
            NotificationItemDesign(
              body: context.localizations.consumptionExceeded(
                notifications?.exceededMembersTotalConsumptionThreshold ?? "",
                values.totalConsumptionThreshold ?? 0,
              ),
            ),
            10.verticalSpace,
          ],
          if (notifications?.exceededMonths != null && notifications?.exceededMonths?.isNotEmpty == true) ...[
            ...notifications!.exceededMonths!.map((e) {
              return NotificationItemDesign(
                body: context.localizations.monthlyExceeded(
                  e.monthName??"",
                  e.totalAmount??"0",
                  values.monthlyConsumptionThreshold??"0"
                ),
              );
            },),
            10.verticalSpace,
          ],


          if (notifications?.exceededMembersEmployeeAmountThreshold != null && notifications?.exceededMembersEmployeeAmountThreshold?.isNotEmpty == true) ...[
            ...notifications!.exceededMembersEmployeeAmountThreshold!.map((e) {
              return NotificationItemDesign(
                body: ""
              );
            },),
            10.verticalSpace,
          ],

          24.verticalSpace,
        ],
      ),
    );
  }
}
