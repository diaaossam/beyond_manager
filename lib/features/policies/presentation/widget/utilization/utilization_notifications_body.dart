import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/policies/data/models/response/notification_value_model.dart';
import 'package:bond/features/policies/presentation/cubit/utilization/utilization_notification_cubit.dart';
import 'package:bond/features/policies/presentation/cubit/utilization/utilization_notification_data.dart';
import 'package:bond/features/policies/presentation/widget/utilization/recommendation_card_design.dart';
import 'package:bond/features/policies/presentation/widget/utilization/utlization_notification.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../sick_leave/presentation/widgets/segment_item.dart';
import 'alert_configuration_dialog.dart';

class UtilizationNotificationsBody extends StatefulWidget {
  final num policyId;
  final int selectedTabIndex;
  final ValueChanged<int> onTabIndexChanged;

  const UtilizationNotificationsBody({
    super.key,
    required this.policyId,
    required this.selectedTabIndex,
    required this.onTabIndexChanged,
  });

  @override
  State<UtilizationNotificationsBody> createState() =>
      _UtilizationNotificationsBodyState();
}

class _UtilizationNotificationsBodyState
    extends State<UtilizationNotificationsBody> {
  void _onTabChanged(int index) {
    widget.onTabIndexChanged(index);
    final cubit = context.read<UtilizationNotificationCubit>();
    if (index == 0) {
      if (cubit.state.data?.notificationValueModel != null) {
        cubit.getUtilizationNotifications(
          policyId: widget.policyId,
          params: cubit.state.data!.notificationValueModel!,
        );
      }
    } else {
      cubit.getDeepDiveStudy();
    }
  }

  @override
  void didUpdateWidget(UtilizationNotificationsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTabIndex != widget.selectedTabIndex) {
      final cubit = context.read<UtilizationNotificationCubit>();
      if (widget.selectedTabIndex == 0) {
        if (cubit.state.data?.notificationValueModel != null) {
          cubit.getUtilizationNotifications(
            policyId: widget.policyId,
            params: cubit.state.data!.notificationValueModel!,
          );
        }
      } else {
        cubit.getDeepDiveStudy();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      UtilizationNotificationCubit,
      BaseState<UtilizationNotificationData>
    >(
      buildWhen: (prev, curr) =>
          prev.identifier != curr.identifier ||
          prev.status != curr.status ||
          prev.data != curr.data,
      builder: (context, state) {
        final data = state.data;
        final isLoadingNotifications =
            state.isLoading &&
            state.identifier == "getUtilizationNotifications";
        final isLoadingDeepDive =
            state.isLoading && state.identifier == "getDeepDiveStudy";
        final currentIndex = widget.selectedTabIndex;
        final isLoading = currentIndex == 0
            ? isLoadingNotifications
            : isLoadingDeepDive;
        return Padding(
          padding: screenPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText.title(
                text: context.localizations.configureUtilizationNotification,
                textSize: 16,
                fontWeight: FontWeight.w700,
              ),
              6.verticalSpace,
              AppText.hint(
                text:
                    context.localizations.configureUtilizationNotificationBody,
                textSize: 11,
              ),
              10.verticalSpace,
              CustomButton(
                text: context.localizations.configureUtilizationNotification,
                press: () async {
                  final response = await AlertConfigurationDialog.show(
                    context,
                    widget.policyId,
                    data?.notificationValueModel ?? NotificationValueModel(),
                  );
                  if(response != null && response ==true){
                    context.read<UtilizationNotificationCubit>().getNotificationValues(
                      policyId: widget.policyId,
                    );
                  }
                },
                height: 50,
              ),
              10.verticalSpace,
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: CupertinoSlidingSegmentedControl(
                        backgroundColor: context.colorScheme.outline,
                        thumbColor: context.colorScheme.primary,
                        padding: const EdgeInsets.all(8),
                        children: {
                          0: SegmentItem(
                            title:
                                context.localizations.utilizationNotifications,
                            selected: currentIndex == 0,
                            width: SizeConfig.screenWidth * .4,
                          ),
                          1: SegmentItem(
                            title: context.localizations.deepDiveStudy,
                            selected: currentIndex == 1,
                            width: SizeConfig.screenWidth * .4,
                          ),
                        },
                        groupValue: currentIndex,
                        onValueChanged: (value) => _onTabChanged(value!),
                      ),
                    ),
                    SliverToBoxAdapter(child: 10.verticalSpace),
                    if (currentIndex == 0)
                      UtilizationNotification(
                        notifications: data?.notifications,
                        isLoading: isLoading,
                        onRetry: () => context
                            .read<UtilizationNotificationCubit>()
                            .getUtilizationNotifications(
                              policyId: widget.policyId,
                              params: state.data!.notificationValueModel!,
                            ),
                      )
                    else
                      RecommendationCardDesign(
                        studies: data?.deepStudy,
                        isLoading: isLoading,
                        onRetry: () => context
                            .read<UtilizationNotificationCubit>()
                            .getDeepDiveStudy(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
