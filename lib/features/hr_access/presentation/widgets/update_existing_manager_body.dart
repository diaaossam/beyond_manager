import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/hr_access/data/models/response/manager_form_data.dart';
import 'package:bond/features/hr_access/data/models/response/manager_list_item.dart';
import 'package:bond/features/hr_access/data/models/response/policy_access_item.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../settings/presentation/settings_helper.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../cubit/update_hr_access/update_hr_access_cubit.dart';
import '../cubit/update_hr_access/update_hr_access_data.dart';
import 'manager_form_design.dart';

class UpdateExistingManagerBody extends StatefulWidget {
  const UpdateExistingManagerBody({super.key});

  @override
  State<UpdateExistingManagerBody> createState() => _UpdateExistingManagerBodyState();
}

class _UpdateExistingManagerBodyState extends State<UpdateExistingManagerBody> {
  ManagerListItem? _selectedManager;
  final _formKey = GlobalKey<FormBuilderState>();

  ManagerFormData _managerToFormData(
    ManagerListItem? manager,
    List<MainPolicyModel> policies,
  ) {
    if (manager == null) return ManagerFormData();
    final firstLine = manager.policyLines != null && manager.policyLines!.isNotEmpty
        ? manager.policyLines!.first
        : null;
    MainPolicyModel? policyModel;
    if (firstLine?.policyId != null) {
      final pid = firstLine!.policyId!;
      final match = policies.where((p) => p.policyId == pid);
      policyModel = match.isEmpty
          ? MainPolicyModel(policyId: pid, policyNumber: pid.toString())
          : match.first;
    }
    return ManagerFormData(
      policy: policyModel,
      name: manager.name,
      email: null,
      jobTitle: null,
      mobileNumber: manager.phone,
      accessPayment: firstLine?.accessPayment ?? manager.accessPayment ?? false,
      accessPolicyDetails:
          firstLine?.accessPolicyDetails ?? manager.accessPolicyDetails ?? false,
      accessUtilization:
          firstLine?.accessUtilization ?? manager.accessUtilization ?? false,
      accessActiveList:
          firstLine?.accessActiveList ?? manager.accessActiveList ?? false,
      accessAdditionAndDeletions:
          firstLine?.accessAdditionAndDeletions ??
          manager.accessAdditionAndDeletions ??
          false,
      reimbursement: manager.reimbursement ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateHrAccessCubit, BaseState<UpdateHrAccessData>>(
      listener: (context, state) {
        if (state.isSuccess && state.identifier == "update_manager") {
          SettingsHelper.showAlertDialog(
            context: context,
            title: context.localizations.sentRequestSuccessTitle,
            body: context.localizations.sentRequestSuccessBody,
          );
        }
      },
      builder: (context, state) {
        final managers = state.data?.managers ?? [];
        final policies = state.data?.policies ?? [];
        final hasSelection = _selectedManager != null;
        final initialManager = hasSelection ? _managerToFormData(_selectedManager, policies) : ManagerFormData();
        return FormBuilder(
          key: _formKey,
          initialValue: hasSelection ? _formInitialValue(_selectedManager!, policies) : {},
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
                        _buildSelectManagerCard(context, state, managers),
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                        Container(
                          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(
                              left: BorderSide(color: Color(0xFFEF4444), width: 4),
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
                                        text: context.localizations.updateManagerTip,
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
                        if (hasSelection) ...[
                          SizedBox(height: SizeConfig.bodyHeight * .03),
                          ManagerFormDesign(
                            formKey: _formKey,
                            index: 0,
                            manager: initialManager,
                            onRemove: null,
                            policiesForDropdown: policies,
                            isLoadingPolicies:
                                state.isLoading && state.identifier == "policies",
                          ),
                        ],
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                child: _buildBottomButtons(context, state, hasSelection),
              ),
            ],
          ),
        );
      },
    );
  }

  Map<String, dynamic> _formInitialValue(
    ManagerListItem manager,
    List<MainPolicyModel> policies,
  ) {
    final firstLine = manager.policyLines != null && manager.policyLines!.isNotEmpty
        ? manager.policyLines!.first
        : null;
    MainPolicyModel? policyModel;
    if (firstLine?.policyId != null) {
      final pid = firstLine!.policyId!;
      final match = policies.where((p) => p.policyId == pid);
      policyModel = match.isEmpty
          ? MainPolicyModel(policyId: pid, policyNumber: pid.toString())
          : match.first;
    }
    return {
      'policy_0': policyModel,
      'name_0': manager.name,
      'email_0': null,
      'jobTitle_0': null,
      'mobileNumber_0': manager.phone,
      'accessPayment_0': firstLine?.accessPayment ?? manager.accessPayment ?? false,
      'accessPolicyDetails_0':
          firstLine?.accessPolicyDetails ?? manager.accessPolicyDetails ?? false,
      'accessUtilization_0':
          firstLine?.accessUtilization ?? manager.accessUtilization ?? false,
      'accessActiveList_0':
          firstLine?.accessActiveList ?? manager.accessActiveList ?? false,
      'accessAdditionAndDeletions_0': firstLine?.accessAdditionAndDeletions ??
          manager.accessAdditionAndDeletions ??
          false,
      'reimbursement_0': manager.reimbursement ?? false,
    };
  }

  Widget _buildSelectManagerCard(
    BuildContext context,
    BaseState<UpdateHrAccessData> state,
    List<ManagerListItem> managers,
  ) {
    return Container(
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
          AppText(
            text: "${context.localizations.selectManager} *",
            fontWeight: FontWeight.w700,
            textSize: 13,
            color: context.colorScheme.onSurface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          if (state.isLoading && state.identifier == "managers")
            const Center(child: LoadingWidget())
          else
            InputDecorator(
              decoration: InputDecoration(
                hintText: context.localizations.selectAManager,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ManagerListItem>(
                  value: _selectedManager,
                  isExpanded: true,
                  items: managers
                      .map((e) => DropdownMenuItem<ManagerListItem>(
                            value: e,
                            child: AppText(text: e.name ?? '', textSize: 13),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedManager = v),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(
    BuildContext context,
    BaseState<UpdateHrAccessData> state,
    bool hasSelection,
  ) {
    final isLoading = state.isLoading && state.identifier == "update_manager";
    if (!hasSelection) {
      return Center(
        child: CustomButton.outline(
          text: context.localizations.back,
          press: () => context.router.back(),
          width: SizeConfig.screenWidth * 0.5,
          borderColor: context.colorScheme.outline,
          textColor: context.colorScheme.onSurface,
        ),
      );
    }
    return Row(
      children: [
        Expanded(
          child: CustomButton.outline(
            text: context.localizations.back,
            press: () => context.router.back(),
            borderColor: context.colorScheme.outline,
            textColor: context.colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: isLoading
              ? const Center(child: LoadingWidget())
              : CustomButton(
                  text: context.localizations.submitChanges,
                  iconData: Icons.check,
                  press: () async {
                    if (!_formKey.currentState!.saveAndValidate()) return;
                    final managerId = _selectedManager?.managerId;
                    if (managerId == null) return;
                    final formData = _formKey.currentState?.value ?? {};
                    final policy = formData['policy_0'] as MainPolicyModel?;
                    final policies = [
                      PolicyAccessItem(
                        policyId: policy?.policyId,
                        policyName: policy?.policyNumber,
                        accessPayment: formData['accessPayment_0'] == true,
                        accessPolicyDetails: formData['accessPolicyDetails_0'] == true,
                        accessUtilization: formData['accessUtilization_0'] == true,
                        accessActiveList: formData['accessActiveList_0'] == true,
                        accessAdditionAndDeletions:
                            formData['accessAdditionAndDeletions_0'] == true,
                      ),
                    ];
                    context.read<UpdateHrAccessCubit>().updateManager(
                          managerId: managerId,
                          name: formData['name_0'] as String? ?? '',
                          reimbursement: formData['reimbursement_0'] == true,
                          policies: policies,
                        );
                  },
                ),
        ),
      ],
    );
  }
}
