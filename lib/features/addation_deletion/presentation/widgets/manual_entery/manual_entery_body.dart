import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/gender.dart';
import 'package:bond/features/addation_deletion/data/models/response/branch_response.dart';
import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../data/models/enums/marital_status_enum.dart';
import '../../../data/models/enums/nationality_enum.dart';
import '../../../data/models/response/manual_entry_params.dart';
import '../../../data/models/response/relationship_model.dart';
import '../../cubit/addation/addation.dart';
import '../../cubit/addation/addation_data.dart';
import '../../pages/addition_attachments_screen.dart';
import 'member_form_design.dart';

class ManualEntryBody extends StatefulWidget {
  final List<PoliciesDataModel> selectedPolicies;
  final PoliciesDataModel policiesPermission;

  const ManualEntryBody({
    super.key,
    required this.selectedPolicies,
    required this.policiesPermission,
  });

  @override
  State<ManualEntryBody> createState() => _ManualEntryBodyState();
}

class _ManualEntryBodyState extends State<ManualEntryBody> {
  List<MemberFormData> members = [MemberFormData()];
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
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
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    AppText(
                      text: context.localizations.fillOutMemberDetails,
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      color: context.colorScheme.shadow,
                      align: TextAlign.center,
                      maxLines: 2,
                    ),

                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    Container(
                      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBEB),
                        borderRadius: BorderRadius.circular(8),
                        border: const Border(
                          left: BorderSide(color: Color(0xFFF59E0B), width: 4),
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
                    ...members.asMap().entries.map((entry) {
                      int index = entry.key;
                      MemberFormData member = entry.value;
                      return MemberFormDesign(
                        policiesPermission: widget.policiesPermission,
                        formKey: _formKey,
                        policyList: widget.selectedPolicies,
                        index: index,
                        member: member,
                        onRemove: members.length > 1
                            ? () => setState(() => members.removeAt(index))
                            : null,
                      );
                    }),
                    Center(
                      child: CustomButton.outline(
                        text: context.localizations.addAnotherMember,
                        press: () =>
                            setState(() => members.add(MemberFormData())),
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
          Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
            child: BlocConsumer<AddationCubit, BaseState<AddationData>>(
              listener: (context, state) {
                if (state.isSuccess && state.identifier == "submit_members") {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dialogContext) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(
                          SizeConfig.screenWidth * .05,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AppText(
                              text: dialogContext
                                  .localizations
                                  .sentRequestSuccessTitle,
                              textSize: 14,
                              fontWeight: FontWeight.w700,
                              align: TextAlign.center,
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .01),
                            AppText.body(
                              align: TextAlign.center,
                              text: dialogContext
                                  .localizations
                                  .sentRequestSuccessBody,
                              maxLines: 5,
                              textSize: 11,
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .03),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton.outline(
                                    text: dialogContext
                                        .localizations
                                        .backToDashboard,
                                    press: () {
                                      Navigator.of(dialogContext).pop();
                                      context.router.pushAndPopUntil(
                                        const MainLayoutRoute(),
                                        predicate: (route) => false,
                                      );
                                    },
                                    borderColor:
                                        dialogContext.colorScheme.outline,
                                    textColor:
                                        dialogContext.colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: CustomButton(
                                    text: dialogContext
                                        .localizations
                                        .uploadAttachments,
                                    press: () {
                                      Navigator.of(dialogContext).pop();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const AdditionAttachmentsScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.identifier == "submit_members") {
                  return LoadingWidget();
                }
                return Row(
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
                        press: () async {
                         /* if (!_formKey.currentState!.saveAndValidate()) {
                            return;
                          }*/
                          _formKey.currentState!.save();
                          final List<MemberFormData> extractedMembers =
                              _extractMembersFromForm();
                          context.read<AddationCubit>().submitMembers(
                            extractedMembers,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<MemberFormData> _extractMembersFromForm() {
    final formData = _formKey.currentState?.value ?? {};
    final List<MemberFormData> extractedMembers = [];
    for (int i = 0; i < members.length; i++) {
      List<Map<String, dynamic>>? policyData;
      policyData = [];
      for (int p = 0; p < widget.selectedPolicies.length; p++) {
        final policy = widget.selectedPolicies[p];
        final plan = formData['policyPlan_${i}_$p'] as AddationBranchModel?;
        final branch = formData['policyBranch_${i}_$p'] as AddationBranchModel?;
        final additionDate = formData['additionDate_${i}_$p'] as String?;
        policyData.add({
          'policy_id': policy.policyId,
          'branch_id': branch?.branchId,
          'plan_id': plan?.branchId,
          'addition_date': additionDate,
        });
      }

      
      extractedMembers.add(
        MemberFormData(
          relationship: formData['relationship_$i'] as RelationshipModel?,
          fullNameArabic: formData['fullNameArabic_$i'] as String?,
          fullNameEnglish: formData['fullNameEnglish_$i'] as String?,
          nationality: formData['nationality_$i'] as NationalityEnum?,
          nationalId: formData['nationalId_$i'] as String?,
          dateOfBirth: formData['dateOfBirth_$i'] as String?,
          hiringDate: formData['hiringDate_$i'] as String?,
          maritalStatus: formData['maritalStatus_$i'] as MaritalStatusEnum?,
          gender: formData['gender_$i'] as GenderEnum?,
          phoneNumber: formData['phoneNumber_$i'] as String?,
          emailAddress: formData['emailAddress_$i'] as String?,
          salary: formData['salary_$i'] as String?,
          iban: formData['iban_$i'] as String?,
          address: formData['address_$i'] as String?,
          photoFileName: formData['photoFileName_$i'] as String?,
          staffNumber: formData['staffNumber_$i'] as String?,
          memberStatus: 'under_addition',
          policies: widget.selectedPolicies,
          policyData: policyData,
        ),
      );
    }
    
    extractedMembers.forEach((element) => Logger().w(element.toJson()),);
    return extractedMembers;
  }
}
