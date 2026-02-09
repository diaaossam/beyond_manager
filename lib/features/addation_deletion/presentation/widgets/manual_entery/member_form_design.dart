import 'dart:io';
import 'package:bond/config/helper/secure_file_picker.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/addation_deletion/data/models/response/branch_response.dart';
import 'package:bond/features/addation_deletion/data/models/response/relationship_model.dart';
import 'package:bond/features/settings/settings_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enum/gender.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../data/models/enums/marital_status_enum.dart';
import '../../../data/models/enums/nationality_enum.dart';
import '../../../data/models/response/manual_entry_params.dart';
import '../../../data/models/response/policies_data_addation.dart';
import '../../cubit/addation/addation.dart';
import '../../cubit/addation/addation_data.dart';

class MemberFormDesign extends StatefulWidget {
  final int index;
  final MemberFormData member;
  final VoidCallback? onRemove;
  final GlobalKey<FormBuilderState> formKey;
  final bool isSinglePolicy;
  final List<PoliciesDataModel> policyList;

  const MemberFormDesign({
    super.key,
    required this.index,
    required this.member,
    this.onRemove,
    required this.formKey,
    required this.isSinglePolicy, required this.policyList,
  });

  @override
  State<MemberFormDesign> createState() => _MemberFormDesignState();
}

class _MemberFormDesignState extends State<MemberFormDesign> {
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
                text: "${context.localizations.member} ${widget.index + 1}",
                fontWeight: FontWeight.w700,
                textSize: 14,
                color: context.colorScheme.onSurface,
              ),
              if (widget.onRemove != null)
                InkWell(
                  onTap: widget.onRemove,
                  child: const Icon(Icons.close, color: Colors.red, size: 24),
                ),
            ],
          ),
          Divider(height: SizeConfig.bodyHeight * .04),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<AddationCubit, BaseState<AddationData>>(
                  builder: (context, state) {
                    return AppDropDown<RelationshipModel>(
                      name: 'relationship_${widget.index}',
                      isLoading:
                          state.isLoading && state.identifier == "relationship",
                      hint: context.localizations.selectRelationship,
                      label: context.localizations.relationship,
                      items: (state.data?.relationships ?? [])
                          .map<DropdownMenuItem<RelationshipModel>>(
                            (e) => DropdownMenuItem<RelationshipModel>(
                              value: e,
                              child: AppText(text: e.name.toString()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        // Data will be retrieved from form state
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'fullNameArabic_${widget.index}',
                  label: context.localizations.fullNameArabic,
                  hintText: context.localizations.memberFullNameArabic,
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: 'fullNameEnglish_${widget.index}',
                  label: context.localizations.fullNameEnglish,
                  hintText: context.localizations.memberFullName,
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: AppDropDown<NationalityEnum>(
                  name: 'nationality_${widget.index}',
                  label: context.localizations.nationality,
                  hint: context.localizations.egyptian,
                  items: NationalityEnum.values
                      .map<DropdownMenuItem<NationalityEnum>>(
                        (e) => DropdownMenuItem<NationalityEnum>(
                          value: e,
                          child: AppText(
                            text: e == NationalityEnum.egyptian
                                ? context.localizations.egyptian
                                : context.localizations.nonEgyptian,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: 'nationalId_${widget.index}',
                  label: context.localizations.nationalIdCNID,
                  hintText: context.localizations.nationalIdHint,
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'dateOfBirth_${widget.index}',
                  label: context.localizations.dateOfBirth,
                  hintText: context.localizations.ddMmYyyy,
                  readOnly: true,
                  onTap: () async {
                    final date = await SettingsHelper().showCustomDatePicker(
                      context: context,
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      widget.formKey.currentState?.patchValue({
                        "dateOfBirth_${widget.index}": date.formattedDate,
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: 'hiringDate_${widget.index}',
                  label: context.localizations.hiringDate,
                  hintText: context.localizations.ddMmYyyy,
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),
                  onTap: () async {
                    final date = await SettingsHelper().showCustomDatePicker(
                      context: context,
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      widget.formKey.currentState?.patchValue({
                        "hiringDate_${widget.index}": date.formattedDate,
                      });
                    }
                  },
                ),
              ),
              if(widget.isSinglePolicy)...[
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: CustomTextFormField(
                    name: 'additionDate_${widget.index}',
                    label: context.localizations.additionDate,
                    hintText: context.localizations.ddMmYyyy,
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    onTap: () async {
                      final now = DateTime.now();
                      final backDays = (widget.policyList.first.backAdditionDate ?? 0).toInt();
                      final forwardDays = (widget.policyList.first.forwardAdditionDate ?? 0).toInt();
                      final date = await SettingsHelper().showCustomDatePicker(
                        context: context,
                        firstDate: now.subtract(Duration(days: backDays)),
                        lastDate: now.add(Duration(days: forwardDays)),
                      );
                      if (date != null) {
                        widget.formKey.currentState?.patchValue({
                          "additionDate_${widget.index}": date.formattedDate,
                        });
                      }
                    },
                  ),
                ),
              ],

            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: AppDropDown<MaritalStatusEnum>(
                  name: 'maritalStatus_${widget.index}',
                  label: context.localizations.maritalStatus,
                  hint: context.localizations.selectStatus,
                  items: MaritalStatusEnum.values
                      .map<DropdownMenuItem<MaritalStatusEnum>>(
                        (e) => DropdownMenuItem<MaritalStatusEnum>(
                          value: e,
                          child: Text(
                            e == MaritalStatusEnum.single
                                ? context.localizations.single
                                : context.localizations.married,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: AppDropDown<GenderEnum>(
                  name: 'gender_${widget.index}',
                  label: context.localizations.gender,
                  hint: context.localizations.selectGender,
                  items: GenderEnum.values
                      .map<DropdownMenuItem<GenderEnum>>(
                        (e) => DropdownMenuItem<GenderEnum>(
                          value: e,
                          child: Text(
                            e == GenderEnum.male
                                ? context.localizations.male
                                : context.localizations.female,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: 'phoneNumber_${widget.index}',
                  label: context.localizations.phoneNumber,
                  hintText: context.localizations.phoneNumberHint,
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'emailAddress_${widget.index}',
                  label: context.localizations.emailAddress,
                  hintText: context.localizations.emailHint,
                  onChanged: (value) {
                    // Data will be retrieved from form state
                  },
                ),
              ),
            ],
          ),
          if (widget.isSinglePolicy) ...[
            SizedBox(height: SizeConfig.bodyHeight * .02),
            BlocBuilder<AddationCubit, BaseState<AddationData>>(
              builder: (context, state) {
                return state.builder(
                  onTapRetry: () {},
                  listenTo: {"policyPlans", "policyBranches"},
                  onSuccess: (data) {
                    return Row(
                      children: [
                        Expanded(
                          child: AppDropDown(
                            name: 'medicalInsurancePlan_${widget.index}',
                            label: context.localizations.medicalInsurancePlan,
                            isLoading: state.isLoading && state.identifier == "policyPlans",
                            hint: context.localizations.selectPlan,
                            items: ((state.data?.policyPlans?.result.entries.toList() ?? [])
                                    .map(
                                  (entry) => DropdownMenuItem(
                                        value: entry,
                                        child: AppText(
                                          text: entry.value.isNotEmpty ? entry.value.first.branchName.toString(): "",
                                        ),
                                      ),
                                    )
                                    .toList()),
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: AppDropDown(
                            name: 'branch_${widget.index}',
                            label: context.localizations.branch,
                            hint: context.localizations.selectBranch,
                            isLoading: state.isLoading && state.identifier == "policyBranches",
                            items: ((state.data?.branches?.result.entries.toList() ?? [])
                                .map(
                                  (entry) => DropdownMenuItem(
                                value: entry,
                                child: AppText(
                                  text: entry.value.isNotEmpty ? entry.value.first.branchName.toString() : "",
                                ),
                              ),
                            )
                                .toList()),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],

          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'salary_${widget.index}',
            label: context.localizations.salaryConditional,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            hintText: context.localizations.monthlySalary,
            onChanged: (value) {
              // Data will be retrieved from form state
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'iban_${widget.index}',
            label: context.localizations.ibanConditional,
            hintText: context.localizations.ibanHint,
            onChanged: (value) {
              // Data will be retrieved from form state
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'address_${widget.index}',
            label: context.localizations.address,
            hintText: context.localizations.fullAddress,
            onChanged: (value) {
              // Data will be retrieved from form state
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          FormBuilderField<String>(
            name: 'photoFileName_${widget.index}',
            builder: (FormFieldState<String> field) {
              return _buildFileUpload(
                context: context,
                label: context.localizations.photoUpload,
                required: true,
                helperText:
                    context.localizations.automaticallyRenamedWithStaffNumber,
                fileName: field.value,
                onTap: () async {
                  File file = await SecureFilePicker.pickFile();
                  field.didChange(file.path);
                  setState(() {});
                },
              );
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          FormBuilderField<String>(
            name: 'acknowledgmentFileName_${widget.index}',
            builder: (FormFieldState<String> field) {
              return _buildFileUpload(
                context: context,
                label: context.localizations.acknowledgmentStatement,
                required: true,
                helperText: context.localizations.uploadSignedAcknowledgment,
                fileName: field.value,
                onTap: () async {
                  File file = await SecureFilePicker.pickFile();
                  field.didChange(file.path);
                  setState(() {});
                },
              );
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'staffNumber_${widget.index}',
            label: context.localizations.staffNumberId,
            hintText: context.localizations.employeeStaffNumber,
            onChanged: (value) {
              // Data will be retrieved from form state
            },
          ),
          if (!widget.isSinglePolicy) ...[
            SizedBox(height: SizeConfig.bodyHeight * .03),
            _buildPoliciesTable(context),
          ],
        ],
      ),
    );
  }

  Widget _buildPoliciesTable(BuildContext context) {
    return BlocBuilder<AddationCubit, BaseState<AddationData>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: context.localizations.policyDetails,
              fontWeight: FontWeight.w700,
              textSize: 13,
              color: context.colorScheme.onSurface,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: context.colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Header Row
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withValues(alpha: 0.08),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _tableHeaderCell(context, context.localizations.policyNumber),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _tableHeaderCell(context, context.localizations.additionDate),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _tableHeaderCell(context, context.localizations.medicalInsurancePlan),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _tableHeaderCell(context, context.localizations.branch),
                        ),
                      ],
                    ),
                  ),
                  // Data Rows
                  ...widget.policyList.asMap().entries.map((entry) {
                    final pIdx = entry.key;
                    final policy = entry.value;
                    final isLast = pIdx == widget.policyList.length - 1;
                    final policyKey = policy.policyId?.toString() ?? '';

                    final plans =
                        state.data?.policyPlans?.result[policyKey] ?? [];
                    final branches =
                        state.data?.branches?.result[policyKey] ?? [];

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: context.colorScheme.outline
                                .withValues(alpha: 0.5),
                          ),
                        ),
                        borderRadius: isLast
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              )
                            : null,
                      ),
                      child: Row(
                        children: [
                          // Policy Number
                          Expanded(
                            flex: 2,
                            child: AppText(
                              text: policy.policyNumber ?? '',
                              textSize: 12,
                              fontWeight: FontWeight.w500,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Addition Date
                          Expanded(
                            flex: 3,
                            child: CustomTextFormField(
                              name:
                                  'policyDate_${widget.index}_$pIdx',
                              hintText: context.localizations.ddMmYyyy,
                              suffixIcon: const Icon(
                                Icons.calendar_today,
                                size: 16,
                              ),
                              readOnly: true,
                              onTap: () async {
                                final now = DateTime.now();
                                final backDays =
                                    (policy.backAdditionDate ?? 0).toInt();
                                final forwardDays =
                                    (policy.forwardAdditionDate ?? 0).toInt();
                                final date = await SettingsHelper()
                                    .showCustomDatePicker(
                                  context: context,
                                  firstDate:
                                      now.subtract(Duration(days: backDays)),
                                  lastDate:
                                      now.add(Duration(days: forwardDays)),
                                );
                                if (date != null) {
                                  widget.formKey.currentState?.patchValue({
                                    'policyDate_${widget.index}_$pIdx':
                                        date.formattedDate,
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Policy Plan
                          Expanded(
                            flex: 3,
                            child: AppDropDown<AddationBranchModel>(
                              name:
                                  'policyPlan_${widget.index}_$pIdx',
                              hint: context.localizations.selectPlan,
                              isLoading: state.isLoading &&
                                  state.identifier == "policyPlans",
                              items: plans
                                  .map(
                                    (p) =>
                                        DropdownMenuItem<AddationBranchModel>(
                                      value: p,
                                      child: AppText(
                                        text: p.branchName,
                                        textSize: 11,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Branch
                          Expanded(
                            flex: 3,
                            child: AppDropDown<AddationBranchModel>(
                              name:
                                  'policyBranch_${widget.index}_$pIdx',
                              hint: context.localizations.selectBranch,
                              isLoading: state.isLoading &&
                                  state.identifier == "policyBranches",
                              items: branches
                                  .map(
                                    (b) =>
                                        DropdownMenuItem<AddationBranchModel>(
                                      value: b,
                                      child: AppText(
                                        text: b.branchName,
                                        textSize: 11,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _tableHeaderCell(BuildContext context, String text) {
    return AppText(
      text: text,
      fontWeight: FontWeight.w600,
      textSize: 12,
      color: context.colorScheme.onSurface,
      align: TextAlign.center,
    );
  }

  Widget _buildFileUpload({
    required BuildContext context,
    required String label,
    bool required = false,
    String? helperText,
    String? fileName,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText(
              text: label,
              fontWeight: FontWeight.w600,
              textSize: 12,
              color: context.colorScheme.onSurface,
            ),
            if (required)
              const AppText(
                text: " *",
                fontWeight: FontWeight.w700,
                textSize: 13,
                color: Colors.red,
              ),
          ],
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: context.colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.outline,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AppText(
                    text: context.localizations.chooseFile,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppText(
                    text: fileName != null
                        ? fileName.split('/').last
                        : context.localizations.noFileChosen,
                    fontWeight: FontWeight.w400,
                    textSize: 11,
                    color: fileName != null
                        ? context.colorScheme.onSurface
                        : context.colorScheme.shadow,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 4),
          AppText(
            text: helperText,
            fontWeight: FontWeight.w400,
            textSize: 11,
            color: context.colorScheme.shadow,
            maxLines: 2,
          ),
        ],
      ],
    );
  }
}
