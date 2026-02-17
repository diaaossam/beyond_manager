import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/addation_deletion/data/models/response/branch_response.dart';
import 'package:bond/features/addation_deletion/data/models/response/relationship_model.dart';
import 'package:bond/features/settings/settings_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
  final List<PoliciesDataModel> policyList;
  final PoliciesDataModel policiesPermission;

  const MemberFormDesign({
    super.key,
    required this.index,
    required this.member,
    this.onRemove,
    required this.formKey,
    required this.policyList,
    required this.policiesPermission,
  });

  @override
  State<MemberFormDesign> createState() => _MemberFormDesignState();
}

class _MemberFormDesignState extends State<MemberFormDesign> {
  @override
  Widget build(BuildContext context) {
    bool isSinglePolicy = widget.policyList.length == 1;
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
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: context.localizations.validation,
                        ),
                      ]),
                    );
                  },
                ),
              ),
              if (widget.policiesPermission.reqArabicName == true) ...[
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: CustomTextFormField(
                    name: 'fullNameArabic_${widget.index}',
                    label: context.localizations.fullNameArabic,
                    hintText: context.localizations.memberFullNameArabic,
                    textAlign: TextAlign.right,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: context.localizations.validation,
                      ),
                    ]),
                  ),
                ),
              ],
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  ]),
                ),
              ),
              if (widget.policiesPermission.reqNationality == true) ...[
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
                    validator: FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  name: 'nationalId_${widget.index}',
                  label: context.localizations.nationalIdCNID,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(14),
                  ],
                  hintText: context.localizations.nationalIdHint,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),

                    FormBuilderValidators.min(
                      14,
                    ),

                  ]),
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
              if (widget.policiesPermission.reqHiringDate == true) ...[
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: context.localizations.validation,
                      ),
                    ]),
                  ),
                ),
                if(isSinglePolicy)
                SizedBox(width: SizeConfig.screenWidth * .03),
              ],
              if (isSinglePolicy) ...[
                Expanded(
                  child: CustomTextFormField(
                    name: 'additionDate_0_0',
                    label: context.localizations.additionDate,
                    hintText: context.localizations.ddMmYyyy,
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    onTap: () async {
                      final now = DateTime.now();
                      final backDays =
                          (widget.policyList.first.backAdditionDate ?? 0)
                              .toInt();
                      final forwardDays =
                          (widget.policyList.first.forwardAdditionDate ?? 0)
                              .toInt();
                      final date = await SettingsHelper().showCustomDatePicker(
                        context: context,
                        firstDate: now.subtract(Duration(days: backDays)),
                        lastDate: now.add(Duration(days: forwardDays)),
                      );
                      if (date != null) {
                        widget.formKey.currentState?.patchValue({
                          "additionDate_0_0": date.formattedDate,
                        });
                      }
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: context.localizations.validation,
                      ),
                    ]),
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  ]),
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
                  name: 'phoneNumber_${widget.index}',
                  label: context.localizations.phoneNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                  ],
                  hintText: context.localizations.phoneNumberHint,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                    FormBuilderValidators.phoneNumber(
                    ),
                    FormBuilderValidators.min(
                      11,
                    ),
                  ]),
                ),
              ),
              if (widget.policiesPermission.reqEmail == true) ...[
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: CustomTextFormField(
                    name: 'emailAddress_${widget.index}',
                    label: context.localizations.emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    hintText: context.localizations.emailHint,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.email(
                        errorText: context.localizations.invalidEmail,
                      ),
                      FormBuilderValidators.required(
                        errorText: context.localizations.validation,
                      ),
                    ]),
                  ),
                ),
              ],
            ],
          ),
          if (isSinglePolicy) ...[
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
                            name: "policyPlan_0_0",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: context.localizations.validation,
                              ),
                            ]),
                            label: context.localizations.medicalInsurancePlan,
                            isLoading:
                                state.isLoading &&
                                state.identifier == "policyPlans",
                            hint: context.localizations.selectPlan,
                            items:
                                ((state.data?.policyPlans?.result.entries
                                            .toList() ??
                                        [])
                                    .map(
                                      (entry) => DropdownMenuItem(
                                        value: entry,
                                        child: AppText(
                                          text: entry.value.isNotEmpty
                                              ? entry.value.first.branchName
                                                    .toString()
                                              : "",
                                        ),
                                      ),
                                    )
                                    .toList()),
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: AppDropDown(
                            name: 'policyBranch_0_0',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: context.localizations.validation,
                              ),
                            ]),
                            label: context.localizations.branch,
                            hint: context.localizations.selectBranch,
                            isLoading:
                                state.isLoading &&
                                state.identifier == "policyBranches",
                            items:
                                ((state.data?.branches?.result.entries
                                            .toList() ??
                                        [])
                                    .map(
                                      (entry) => DropdownMenuItem(
                                        value: entry,
                                        child: AppText(
                                          text: entry.value.isNotEmpty
                                              ? entry.value.first.branchName
                                                    .toString()
                                              : "",
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
          if (widget.policiesPermission.isSalaryInAdditionRequired == true) ...[
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              name: 'salary_${widget.index}',
              label: context.localizations.salaryConditional,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              hintText: context.localizations.monthlySalary,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ]),
            ),
          ],
          if (widget.policiesPermission.isIbanInAdditionRequired == true) ...[
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              name: 'iban_${widget.index}',
              label: context.localizations.ibanConditional,
              hintText: context.localizations.ibanHint,
              validator: FormBuilderValidators.required(
                errorText: context.localizations.validation,
              ),
            ),
          ],
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'address_${widget.index}',
            label: context.localizations.address,
            keyboardType: TextInputType.streetAddress,
            hintText: context.localizations.fullAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: context.localizations.validation,
              ),
            ]),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'staffNumber_${widget.index}',
            label: context.localizations.staffNumberId,
            hintText: context.localizations.employeeStaffNumber,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: context.localizations.validation,
              ),
            ]),
          ),
          if (!isSinglePolicy) ...[
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
                      color: context.colorScheme.primary.withValues(
                        alpha: 0.08,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _tableHeaderCell(
                            context,
                            context.localizations.policy,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _tableHeaderCell(
                            context,
                            context.localizations.additionDate,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _tableHeaderCell(
                            context,
                            context.localizations.plan1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: _tableHeaderCell(
                            context,
                            context.localizations.branch,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            color: context.colorScheme.outline.withValues(
                              alpha: 0.5,
                            ),
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
                          Expanded(
                            flex: 3,
                            child: CustomTextFormField(
                              name: 'policyDate_${widget.index}_$pIdx',
                              hintText: context.localizations.ddMmYyyy,
                              suffixIcon: const Icon(
                                Icons.calendar_today,
                                size: 16,
                              ),
                              readOnly: true,
                              onTap: () async {
                                final now = DateTime.now();
                                final backDays = (policy.backAdditionDate ?? 0)
                                    .toInt();
                                final forwardDays =
                                    (policy.forwardAdditionDate ?? 0).toInt();
                                final date = await SettingsHelper()
                                    .showCustomDatePicker(
                                      context: context,
                                      firstDate: now.subtract(
                                        Duration(days: backDays),
                                      ),
                                      lastDate: now.add(
                                        Duration(days: forwardDays),
                                      ),
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
                          Expanded(
                            flex: 3,
                            child: AppDropDown<AddationBranchModel>(
                              name: 'policyPlan_${widget.index}_$pIdx',
                              hint: context.localizations.selectPlan,
                              isLoading:
                                  state.isLoading &&
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
                          Expanded(
                            flex: 3,
                            child: AppDropDown<AddationBranchModel>(
                              name: 'policyBranch_${widget.index}_$pIdx',
                              hint: context.localizations.selectBranch,
                              isLoading:
                                  state.isLoading &&
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
      textSize: 10,
      color: context.colorScheme.onSurface,
      align: TextAlign.center,
    );
  }
}
