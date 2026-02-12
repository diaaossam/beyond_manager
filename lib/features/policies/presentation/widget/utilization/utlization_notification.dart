import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/policies/data/models/response/utilization_notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class UtilizationNotification extends StatelessWidget {
  final List<UtilizationNotificationItemModel>? notifications;
  final bool isLoading;
  final VoidCallback? onRetry;

  const UtilizationNotification({
    super.key,
    this.notifications,
    this.isLoading = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SliverFillRemaining(
        child: LoadingWidget(),
      );
    }

    final list = notifications ?? [];
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
          if (list.isEmpty)
            Center(
              child: Column(
                children: [
                  AppText.hint(
                    text: context.localizations.noData,
                    textSize: 12,
                  ),
                  if (onRetry != null) ...[
                    12.verticalSpace,
                    TextButton(
                      onPressed: onRetry,
                      child: Text(context.localizations.back),
                    ),
                  ],
                ],
              ),
            )
          else
            ...list.map(
              (n) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Material(
                  color: context.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ],
                    ),
                  ),
                ),
              ),
            ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
