import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/policies/presentation/cubit/utilization/utilization_notification_cubit.dart';
import 'package:bond/features/policies/presentation/cubit/utilization/utilization_notification_data.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/dependencies/injectable_dependencies.dart';

class RequestDeepDiveDialog extends StatefulWidget {
  final num policyId;

  const RequestDeepDiveDialog({super.key, required this.policyId});

  static Future<void> show(BuildContext context, num policyId) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Deep dive study',
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) {
        return RequestDeepDiveDialog(policyId: policyId);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<RequestDeepDiveDialog> createState() => _RequestDeepDiveDialogState();
}

class _RequestDeepDiveDialogState extends State<RequestDeepDiveDialog> {
  final _messageController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;
    context.read<UtilizationNotificationCubit>().sendDeepDive(
      policyId: widget.policyId,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UtilizationNotificationCubit>(),
      child:
          BlocConsumer<
            UtilizationNotificationCubit,
            BaseState<UtilizationNotificationData>
          >(
            listenWhen: (prev, curr) =>
                curr.identifier == 'sendDeepDive' && prev.status != curr.status,
            listener: (context, state) {
              if (state.identifier == 'sendDeepDive' && state.isSuccess) {
                Navigator.of(context).pop();
                context.read<UtilizationNotificationCubit>().getDeepDiveStudy();
              }
            },
            builder: (context, state) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.all(24.w),
                  constraints: BoxConstraints(
                    maxWidth: SizeConfig.screenWidth,
                    maxHeight: SizeConfig.bodyHeight * 0.85,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppText.title(
                          text: context.localizations.deepDiveStudy,
                          textSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        6.verticalSpace,
                        AppText.hint(
                          maxLines: 3,
                          text: context
                              .localizations
                              .requestDeepDiveSubtitle,
                          textSize: 11,
                        ),
                        24.verticalSpace,
                        AppText.title(
                          text: context.localizations.whatWouldYouLikeToAnalyze,
                          textSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        10.verticalSpace,
                        CustomTextFormField(
                          controller: _messageController,
                          focusNode: _focusNode,
                          minLines: 3,
                          maxLines: 5,
                          hintText: context
                              .localizations
                              .whatWouldYouLikeToAnalyzePlaceholder,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            color: context.colorScheme.onSurface
                                .withValues(alpha: 0.5),
                          ),
                          filled: true,
                          fillColor: context
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.4),
                        ),
                        20.verticalSpace,

                        CustomButton(
                          text: context.localizations.submit,
                          press: _submit,
                          height: 48,
                          backgroundColor: Colors.orange.shade700,
                          textColor: Colors.white,
                        ),
                        20.verticalSpace,
                        Container(
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border(
                              left: BorderSide(
                                color: Colors.orange.shade700,
                                width: 4,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 22.sp,
                                color: Colors.orange.shade700,
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: AppText.hint(
                                  maxLines: 5,
                                  text: context.localizations.studyResultsInfo,
                                  textSize: 11,
                                  color: context.colorScheme.onSurface
                                      .withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
