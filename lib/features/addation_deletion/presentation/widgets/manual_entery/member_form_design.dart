import 'dart:io';

import 'package:bond/config/helper/secure_file_picker.dart';
import 'package:bond/features/settings/settings_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/enum/gender.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../data/models/enums/insurance_plan_enum.dart';
import '../../../data/models/enums/marital_status_enum.dart';
import '../../../data/models/enums/nationality_enum.dart';
import '../../../data/models/enums/relationship_enum.dart';
import '../../../data/models/manual_entry_params.dart';

class MemberFormDesign extends StatefulWidget {
  final int index;
  final MemberFormData member;
  final VoidCallback? onRemove;
  final GlobalKey<FormBuilderState> formKey;

  const MemberFormDesign({
    super.key,
    required this.index,
    required this.member,
    this.onRemove,
    required this.formKey,
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
                child: AppDropDown<RelationshipEnum>(
                  name: 'relationship_${widget.index}',
                  hint: context.localizations.selectRelationship,
                  label: context.localizations.relationship,
                  items: RelationshipEnum.values
                      .map<DropdownMenuItem<RelationshipEnum>>(
                        (e) => DropdownMenuItem<RelationshipEnum>(
                          value: e,
                          child: AppText(text: e.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => widget.member.relationship = value,
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'fullNameArabic_${widget.index}',
                  label: context.localizations.fullNameArabic,
                  hintText: context.localizations.memberFullNameArabic,
                  textAlign: TextAlign.right,
                  onChanged: (value) => widget.member.fullNameArabic = value,
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
                  onChanged: (value) => widget.member.fullNameEnglish = value,
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
                    widget.member.nationality = value;
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
                  onChanged: (value) => widget.member.nationalId = value,
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
                    widget.member.dateOfBirth = date?.formattedDate;
                    widget.formKey.currentState?.patchValue({
                      "dateOfBirth_${widget.index}": widget.member.dateOfBirth
                    });
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
                    widget.member.hiringDate = date?.formattedDate;
                    widget.formKey.currentState?.patchValue({
                      "hiringDate_${widget.index}": widget.member.dateOfBirth
                    });
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'additionDate_${widget.index}',
                  label: context.localizations.additionDate,
                  hintText: context.localizations.ddMmYyyy,
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),

                  onTap: () async {
                    final date = await SettingsHelper().showCustomDatePicker(
                      context: context,
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now(),
                    );
                    widget.member.additionDate = date?.formattedDate;
                    widget.formKey.currentState?.patchValue({
                      "additionDate_${widget.index}": widget.member.dateOfBirth
                    });
                  },
                ),
              ),
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
                    widget.member.maritalStatus = value;
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
                    widget.member.gender = value;
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
                    widget.member.phoneNumber = value;
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
                    widget.member.emailAddress = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Insurance Plans
          AppText(
            text: context.localizations.insurancePlans,
            fontWeight: FontWeight.w700,
            textSize: 14,
            color: context.colorScheme.onSurface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),

          AppDropDown<InsurancePlanEnum>(
            name: 'medicalInsurancePlan_${widget.index}',
            label: context.localizations.medicalInsurancePlan,
            hint: context.localizations.selectPlan,
            items: InsurancePlanEnum.values
                .map<DropdownMenuItem<InsurancePlanEnum>>(
                  (e) => DropdownMenuItem<InsurancePlanEnum>(
                    value: e,
                    child: Text(
                      e == InsurancePlanEnum.premium
                          ? context.localizations.premiumPlan
                          : context.localizations.standardPlan,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              widget.member.medicalInsurancePlan = value;
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'salary_${widget.index}',
            label: context.localizations.salaryConditional,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            hintText: context.localizations.monthlySalary,
            onChanged: (value) {
              widget.member.salary = value;
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'iban_${widget.index}',
            label: context.localizations.ibanConditional,
            hintText: context.localizations.ibanHint,
            onChanged: (value) {
              widget.member.iban = value;
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'address_${widget.index}',
            label: context.localizations.address,
            hintText: context.localizations.fullAddress,
            onChanged: (value) {
              widget.member.address = value;
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
                helperText: context.localizations.automaticallyRenamedWithStaffNumber,
                fileName: widget.member.photoFileName,
                onTap: () async {
                  File file = await SecureFilePicker.pickFile();
                  widget.member.photoFileName = file.path;
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
                fileName: widget.member.acknowledgmentFileName,
                onTap: () async {
                  File file = await SecureFilePicker.pickFile();
                  widget.member.acknowledgmentFileName = file.path;
                  field.didChange(file.path);
                  setState(() {});
                },
              );
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Staff Number
          CustomTextFormField(
            name: 'staffNumber_${widget.index}',
            label: context.localizations.staffNumberId,
            hintText: context.localizations.employeeStaffNumber,
            onChanged: (value) {
              widget.member.staffNumber = value;
            },
          ),
        ],
      ),
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
