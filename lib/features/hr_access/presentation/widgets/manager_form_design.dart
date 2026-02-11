import 'package:flutter/services.dart';

import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';
import '../cubit/create_hr_access/create_hr_access_cubit.dart';
import '../cubit/create_hr_access/create_hr_access_data.dart';
import '../../data/models/response/manager_form_data.dart';

class ManagerFormDesign extends StatelessWidget {
  final int index;
  final ManagerFormData manager;
  final VoidCallback? onRemove;
  final GlobalKey<FormBuilderState> formKey;

  const ManagerFormDesign({
    super.key,
    required this.index,
    required this.manager,
    this.onRemove,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .03),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 10,
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
              AppText(
                text: "Manager #${index + 1}",
                fontWeight: FontWeight.w700,
                textSize: 14,
                color: context.colorScheme.onSurface,
              ),
              if (onRemove != null)
                InkWell(
                  onTap: onRemove,
                  child: const Icon(Icons.close, color: Colors.red, size: 24),
                ),
            ],
          ),
          Divider(height: SizeConfig.bodyHeight * .04),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<CreateHrAccessCubit, BaseState<CreateHrAccessData>>(
                  builder: (context, state) {
                    return AppDropDown<MainPolicyModel>(
                      name: 'policy_$index',
                      isLoading:
                          state.isLoading && state.identifier == "policies",
                      hint: context.localizations.selectPolicy,
                      label: context.localizations.selectPolicy,
                      items: (state.data?.policies ?? [])
                          .map<DropdownMenuItem<MainPolicyModel>>(
                            (e) => DropdownMenuItem<MainPolicyModel>(
                              value: e,
                              child: AppText(
                                text: e.policyNumber ?? '',
                                textSize: 12,
                              ),
                            ),
                          )
                          .toList(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: context.localizations.validation,
                        ),
                      ]),
                    );
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'name_$index',
                  label: context.localizations.name,
                  hintText: context.localizations.managerFullName,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: 'email_$index',
                  label: context.localizations.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "email@example.com",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                    FormBuilderValidators.email(
                      errorText: context.localizations.invalidEmail,
                    ),
                  ]),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'jobTitle_$index',
                  label: context.localizations.jobTitle,
                  hintText: context.localizations.jobTitle,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'mobileNumber_$index',
            label: context.localizations.phoneNumber,
            keyboardType: TextInputType.phone,
            hintText: "01XXXXXXXXX",
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
            ],
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: context.localizations.validation,
              ),
              FormBuilderValidators.minLength(11),
            ]),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          AppText(
            text: context.localizations.accessPermissions,
            fontWeight: FontWeight.w700,
            textSize: 13,
            color: context.colorScheme.onSurface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          Wrap(
            spacing: SizeConfig.screenWidth * .04,
            runSpacing: SizeConfig.bodyHeight * .015,
            children: [
              _buildCheckbox(context, 'accessPayment_$index', context.localizations.accessPayment),
              _buildCheckbox(context, 'accessPolicyDetails_$index', context.localizations.accessPolicyDetails),
              _buildCheckbox(context, 'accessUtilization_$index', context.localizations.accessUtilization),
              _buildCheckbox(context, 'accessActiveList_$index', context.localizations.accessActiveList),
              _buildCheckbox(context, 'accessAdditionAndDeletions_$index', context.localizations.accessAdditionAndDeletions),
              _buildCheckbox(context, 'reimbursement_$index', context.localizations.reimbursement),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context, String name, String label) {
    return FormBuilderCheckbox(
      contentPadding: EdgeInsets.zero,

      name: name,
      initialValue: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      title: AppText(
        text: label,
        textSize: 12,
        fontWeight: FontWeight.w500,
        color: context.colorScheme.onSurface,
      ),
    );
  }
}
