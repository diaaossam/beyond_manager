import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/policies/data/models/response/notification_value_model.dart';
import 'package:bond/features/policies/presentation/cubit/utilization/utilization_notification_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../data/models/request/utilization_notification_values.dart';
import '../../cubit/utilization/utilization_notification_data.dart';

class AlertConfigurationDialog extends StatefulWidget {
  final num policyId;
  final NotificationValueModel model;

  const AlertConfigurationDialog({super.key, required this.policyId, required this.model});

  static Future<bool?> show(BuildContext context, num policyId , NotificationValueModel model) {
    return showGeneralDialog<bool?>(
      context: context,
      barrierDismissible: true,
      barrierLabel: context.localizations.alertConfiguration,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertConfigurationDialog(policyId: policyId, model: model);
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
  State<AlertConfigurationDialog> createState() => _AlertConfigurationDialogState();
}

class _AlertConfigurationDialogState extends State<AlertConfigurationDialog> {
  bool _totalConsumptionEnabled = false;
  bool _monthlyConsumptionEnabled = false;
  bool _employeeAmountEnabled = false;
  bool _employeeTransactionCountEnabled = false;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<UtilizationNotificationCubit>(),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            padding: screenPadding(),
            constraints: BoxConstraints(
              maxWidth: SizeConfig.screenWidth,
              maxHeight: SizeConfig.bodyHeight * .9,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    10.verticalSpace,
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Icon(
                              Icons.close,
                              size: 24.sp,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppText.title(
                      text: context
                          .localizations
                          .configureUtilizationNotification,
                      textSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    6.verticalSpace,
                    AppText.hint(
                      text: context
                          .localizations
                          .configureUtilizationNotificationBody,
                      textSize: 11,
                    ),
                    20.verticalSpace,
                    _buildThresholdSection(
                      context,
                      name: "Total_Consumption",
                      title: context.localizations.totalConsumptionThreshold,
                      description: context.localizations.totalConsumptionThresholdDescription,
                      enabled: _totalConsumptionEnabled,
                      unit: context.localizations.unitEg,
                      onEnabledChanged: (v) => setState(() => _totalConsumptionEnabled = v),
                      initValue: widget.model.totalConsumptionThreshold.toString(),
                    ),
                    _buildThresholdSection(
                      context,
                      name: "Monthly_Consumption",
                      title: context.localizations.monthlyConsumptionThreshold,
                      description: context
                          .localizations
                          .monthlyConsumptionThresholdDescription,
                      enabled: _monthlyConsumptionEnabled,
                      unit: context.localizations.unitEg,
                      onEnabledChanged: (v) =>
                          setState(() => _monthlyConsumptionEnabled = v),
                      initValue: widget.model.monthlyConsumptionThreshold.toString(),
                    ),
                    _buildThresholdSection(
                      context,
                      name: "Employee_Amount",
                      title: context.localizations.employeeAmountThreshold,
                      description: context
                          .localizations
                          .employeeAmountThresholdDescription,
                      enabled: _employeeAmountEnabled,
                      unit: context.localizations.unitEg,
                      onEnabledChanged: (v) =>
                          setState(() => _employeeAmountEnabled = v),
                      initValue:  widget.model.employeeAmountThreshold.toString(),
                    ),
                    _buildThresholdSection(
                      context,
                      title: context
                          .localizations
                          .employeeTransactionCountThreshold,
                      description: context
                          .localizations
                          .employeeTransactionCountThresholdDescription,
                      enabled: _employeeTransactionCountEnabled,
                      unit: context.localizations.unitCount,
                      onEnabledChanged: (v) =>
                          setState(() => _employeeTransactionCountEnabled = v),
                      name: "Employee_Transaction_Count",
                      initValue:  widget.model.employeeTransactionCountThreshold.toString(),
                    ),
                    20.verticalSpace,
                    BlocConsumer<UtilizationNotificationCubit, BaseState<UtilizationNotificationData>>(
                      listener: (context, state) {
                        if(state.isSuccess){
                          Future.delayed(Duration.zero,() {
                            Navigator.pop(context,true);
                          /*  SettingsHelper.showAlertDialog(
                                context: context,
                                body:state.data?.msg??"" ,
                                title:context.localizations.success,
                                buttonText: context.localizations.back,
                                onButtonPressed: (){
                                  Navigator.pop(context);
                                }
                            );*/
                          },);

                        }
                      },
                     builder: (context, state) {
                      return Row(
                         children: [
                           Expanded(
                             child: CustomButton.outline(
                               text: context.localizations.cancel,
                               press: () => Navigator.pop(context),
                               height: 48,
                             ),
                           ),
                           SizedBox(width: 16.w),
                           Expanded(
                             child: CustomButton(
                               text: context.localizations.confirm,
                               press: () {
                                 if (!_formKey.currentState!.saveAndValidate()) {
                                   return;
                                 }
                                 UtilizationNotificationValues values =
                                 UtilizationNotificationValues(
                                   policyId: widget.policyId,
                                   employeeAmountThreshold: _formKey.fieldValue(
                                       "Employee_Amount"),
                                   monthlyConsumptionThreshold: _formKey
                                       .fieldValue("Monthly_Consumption"),
                                   totalConsumptionThreshold: _formKey
                                       .fieldValue("Total_Consumption"),
                                   employeeTransactionCountThreshold: _formKey
                                       .fieldValue("Employee_Transaction_Count"),
                                 );
                                 context.read<UtilizationNotificationCubit>().updateUtilizationNotification(values: values);
                               },
                               height: 48,
                             ),
                           ),
                         ],
                       );
                     },
                    ),
                    28.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThresholdSection(BuildContext context, {
    required String title,
    required String description,
    required bool enabled,
    required String unit,
    required ValueChanged<bool> onEnabledChanged,
    required String name,
    String? initValue,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.4,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.title(text: title, textSize: 13, fontWeight: FontWeight.w700),
          4.verticalSpace,
          AppText.hint(text: description, textSize: 10, maxLines: 5),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: name,
                  initialValue: initValue,
                  readOnly: !enabled,
                  keyboardType: TextInputType.number,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: AppText(
                      text: unit,
                      textSize: 11,
                      color: context.colorScheme.shadow,
                    ),
                  ),
                  validator: FormBuilderValidators.required(),
                ),
              ),
              40.horizontalSpace,
              Switch.adaptive(
                value: enabled,
                onChanged: onEnabledChanged,
                activeTrackColor: context.colorScheme.primary.withValues(
                  alpha: 0.5,
                ),
                activeThumbColor: context.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
