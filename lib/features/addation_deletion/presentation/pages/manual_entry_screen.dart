import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';

@RoutePage()
class ManualEntryScreen extends StatefulWidget {
  final String requestType;
  final List<String> selectedPolicyIds;

  const ManualEntryScreen({
    super.key,
    required this.requestType,
    required this.selectedPolicyIds,
  });

  @override
  State<ManualEntryScreen> createState() => _ManualEntryScreenState();
}

class _ManualEntryScreenState extends State<ManualEntryScreen> {
  List<MemberFormData> members = [MemberFormData()];
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.addMembersManually),
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: screenPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                        // Title
                        AppText(
                          text: context.localizations.addMembersManually,
                          fontWeight: FontWeight.w700,
                          textSize: 20,
                          color: context.colorScheme.onSurface,
                          align: TextAlign.center,
                        ),
                        SizedBox(height: SizeConfig.bodyHeight * .01),
                        AppText(
                          text: context.localizations.fillOutMemberDetails,
                          fontWeight: FontWeight.w400,
                          textSize: 13,
                          color: context.colorScheme.shadow,
                          align: TextAlign.center,
                          maxLines: 2,
                        ),
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                        // Selected Policies
                        Container(
                          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F4FD),
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(
                              left: BorderSide(
                                color: Color(0xFF4A90E2),
                                width: 4,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.folder_outlined,
                                color: Color(0xFF4A90E2),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              AppText(
                                text: context.localizations.selectedPolicies,
                                fontWeight: FontWeight.w600,
                                textSize: 14,
                                color: const Color(0xFF2C3E50),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0xFF4A90E2),
                                    width: 1,
                                  ),
                                ),
                                child: AppText(
                                  text: context.localizations.medicalInsurance,
                                  fontWeight: FontWeight.w600,
                                  textSize: 12,
                                  color: const Color(0xFF4A90E2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.bodyHeight * .02),
                        // Tip
                        Container(
                          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFBEB),
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(
                              left: BorderSide(
                                color: Color(0xFFF59E0B),
                                width: 4,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lightbulb_outline,
                                color: Color(0xFFF59E0B),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF78350F),
                                      height: 1.4,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: context.localizations.tip,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: context
                                            .localizations
                                            .allDataValidatedInstantly,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                        // Member Forms
                        ...members.asMap().entries.map((entry) {
                          int index = entry.key;
                          MemberFormData member = entry.value;
                          return _buildMemberForm(index, member);
                        }),
                        // Add Another Member Button
                        Center(
                          child: CustomButton.outline(
                            text: context.localizations.addAnotherMember,
                            press: () {
                              setState(() {
                                members.add(MemberFormData());
                              });
                            },
                            iconData: Icons.add,
                            width: SizeConfig.screenWidth * 0.6,
                            borderColor: context.colorScheme.outline,
                            textColor: context.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom navigation
              Container(
                padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F4FD),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton.outline(
                        text: context.localizations.back,
                        press: () {
                          context.router.back();
                        },
                        borderColor: context.colorScheme.outline,
                        textColor: context.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        text: context.localizations.submitRequest,
                        iconData: Icons.check,
                        press: () {
                          // TODO: Validate and submit
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            print(
                              "Submit request with ${members.length} members",
                            );
                            print(_formKey.currentState?.value);
                          } else {
                            print("Validation failed");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberForm(int index, MemberFormData member) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .03),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Member Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "${context.localizations.member}${index + 1}",
                fontWeight: FontWeight.w700,
                textSize: 18,
                color: context.colorScheme.onSurface,
              ),
              if (members.length > 1)
                InkWell(
                  onTap: () {
                    setState(() {
                      members.removeAt(index);
                    });
                  },
                  child: const Icon(Icons.close, color: Colors.red, size: 24),
                ),
            ],
          ),
          Divider(height: SizeConfig.bodyHeight * .04),
          // Form Fields
          Row(
            children: [
              Expanded(
                child: AppDropDown<String>(
                  name: 'relationship_$index',
                  hint: context.localizations.selectRelationship,
                  label: context.localizations.relationship,
                  items: [
                    DropdownMenuItem(
                      value: "Spouse",
                      child: Text(context.localizations.spouse),
                    ),
                    DropdownMenuItem(
                      value: "Child",
                      child: Text(context.localizations.child),
                    ),
                  ],
                  onChanged: (value) {
                    member.relationship = value;
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'fullNameArabic_$index',
                  label: context.localizations.fullNameArabic,
                  hintText: context.localizations.memberFullNameArabic,
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    member.fullNameArabic = value;
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
                  name: 'fullNameEnglish_$index',
                  label: context.localizations.fullNameEnglish,
                  hintText: context.localizations.memberFullName,
                  onChanged: (value) {
                    member.fullNameEnglish = value;
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: AppDropDown<String>(
                  name: 'nationality_$index',
                  label: context.localizations.nationality,
                  hint: context.localizations.egyptian,
                  items: [
                    DropdownMenuItem(
                      value: "Egyptian",
                      child: Text(context.localizations.egyptian),
                    ),
                    DropdownMenuItem(
                      value: "Non-Egyptian",
                      child: Text(context.localizations.nonEgyptian),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      member.nationality = value;
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
                  name: 'nationalId_$index',
                  label: context.localizations.nationalIdCNID,
                  hintText: context.localizations.nationalIdHint,
                  onChanged: (value) {
                    member.nationalId = value;
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'dateOfBirth_$index',
                  label: context.localizations.dateOfBirth,
                  hintText: context.localizations.ddMmYyyy,
                  onChanged: (value) {
                    member.dateOfBirth = value;
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
                  name: 'hiringDate_$index',
                  label: context.localizations.hiringDate,
                  hintText: context.localizations.ddMmYyyy,
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),
                  onChanged: (value) {
                    member.hiringDate = value;
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'additionDate_$index',
                  label: context.localizations.additionDate,
                  hintText: context.localizations.ddMmYyyy,
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),
                  onChanged: (value) {
                    member.additionDate = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              Expanded(
                child: AppDropDown<String>(
                  name: 'maritalStatus_$index',
                  label: context.localizations.maritalStatus,
                  hint: context.localizations.selectStatus,
                  items: [
                    DropdownMenuItem(
                      value: "Single",
                      child: Text(context.localizations.single),
                    ),
                    DropdownMenuItem(
                      value: "Married",
                      child: Text(context.localizations.married),
                    ),
                  ],
                  onChanged: (value) {
                    member.maritalStatus = value;
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: AppDropDown<String>(
                  name: 'gender_$index',
                  label: context.localizations.gender,
                  hint: context.localizations.selectGender,
                  items: [
                    DropdownMenuItem(
                      value: "Male",
                      child: Text(context.localizations.male),
                    ),
                    DropdownMenuItem(
                      value: "Female",
                      child: Text(context.localizations.female),
                    ),
                  ],
                  onChanged: (value) {
                    member.gender = value;
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
                  name: 'phoneNumber_$index',
                  label: context.localizations.phoneNumber,
                  hintText: context.localizations.phoneNumberHint,
                  onChanged: (value) {
                    member.phoneNumber = value;
                  },
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .03),
              Expanded(
                child: CustomTextFormField(
                  name: 'emailAddress_$index',
                  label: context.localizations.emailAddress,
                  hintText: context.localizations.emailHint,
                  onChanged: (value) {
                    member.emailAddress = value;
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
          _buildInsurancePlanDropdown(
            context.localizations.medicalInsurancePlan,
            member,
            Colors.red,
            index,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          _buildInsurancePlanDropdown(
            context.localizations.lifeInsurancePlan,
            member,
            Colors.red,
            index,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          _buildInsurancePlanDropdown(
            context.localizations.dentalInsurancePlan,
            member,
            Colors.red,
            index,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          _buildInsurancePlanDropdown(
            context.localizations.visionCarePlan,
            member,
            Colors.red,
            index,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Salary & IBAN
          CustomTextFormField(
            name: 'salary_$index',
            label: context.localizations.salaryConditional,
            hintText: context.localizations.monthlySalary,
            onChanged: (value) {
              member.salary = value;
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'iban_$index',
            label: context.localizations.ibanConditional,
            hintText: context.localizations.ibanHint,
            onChanged: (value) {
              member.iban = value;
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            name: 'address_$index',
            label: context.localizations.address,
            hintText: context.localizations.fullAddress,
            onChanged: (value) {
              member.address = value;
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Photo Upload
          _buildFileUpload(
            context: context,
            label: context.localizations.photoUpload,
            required: true,
            helperText:
                context.localizations.automaticallyRenamedWithStaffNumber,
            fileName: member.photoFileName,
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'jpeg', 'png'],
              );
              if (result != null) {
                setState(() {
                  member.photoFileName = result.files.first.name;
                });
              }
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Acknowledgment Statement
          _buildFileUpload(
            context: context,
            label: context.localizations.acknowledgmentStatement,
            required: true,
            helperText: context.localizations.uploadSignedAcknowledgment,
            fileName: member.acknowledgmentFileName,
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
              );
              if (result != null) {
                setState(() {
                  member.acknowledgmentFileName = result.files.first.name;
                });
              }
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          // Staff Number
          CustomTextFormField(
            name: 'staffNumber_$index',
            label: context.localizations.staffNumberId,
            hintText: context.localizations.employeeStaffNumber,
            onChanged: (value) {
              member.staffNumber = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInsurancePlanDropdown(
    String label,
    MemberFormData member,
    Color labelColor,
    int index,
  ) {
    return AppDropDown<String>(
      name: '${label.replaceAll(" ", "")}_$index',
      label: label,
      hint: (context.localizations.selectPlan.toString()).replaceAll(
        '{plan}',
        label.split(' ')[0],
      ),
      items: [
        DropdownMenuItem(
          value: "Premium Plan",
          child: Text(context.localizations.premiumPlan),
        ),
        DropdownMenuItem(
          value: "Standard Plan",
          child: Text(context.localizations.standardPlan),
        ),
      ],
      onChanged: (value) {},
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
              textSize: 13,
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
                    text: fileName ?? context.localizations.noFileChosen,
                    fontWeight: FontWeight.w400,
                    textSize: 13,
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

class MemberFormData {
  String? relationship;
  String? fullNameArabic;
  String? fullNameEnglish;
  String? nationality;
  String? nationalId;
  String? dateOfBirth;
  String? hiringDate;
  String? additionDate;
  String? maritalStatus;
  String? gender;
  String? phoneNumber;
  String? emailAddress;
  String? salary;
  String? iban;
  String? address;
  String? photoFileName;
  String? acknowledgmentFileName;
  String? staffNumber;
}
