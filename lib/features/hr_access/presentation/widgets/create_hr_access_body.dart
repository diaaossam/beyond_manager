import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../settings/presentation/settings_helper.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';

import '../../data/models/response/manager_form_data.dart';
import '../cubit/create_hr_access/create_hr_access_cubit.dart';
import '../cubit/create_hr_access/create_hr_access_data.dart';
import 'manager_form_design.dart';

class CreateHrAccessBody extends StatefulWidget {
  const CreateHrAccessBody({super.key});

  @override
  State<CreateHrAccessBody> createState() => _CreateHrAccessBodyState();
}

class _CreateHrAccessBodyState extends State<CreateHrAccessBody> {
  List<ManagerFormData> managers = [ManagerFormData()];
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
                                    text: context.localizations.hrAccessTip,
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
                    ...managers.asMap().entries.map((entry) {
                      int index = entry.key;
                      ManagerFormData manager = entry.value;
                      return ManagerFormDesign(
                        formKey: _formKey,
                        index: index,
                        manager: manager,
                        onRemove: managers.length > 1
                            ? () => setState(() => managers.removeAt(index))
                            : null,
                      );
                    }),
                    Center(
                      child: CustomButton.outline(
                        text: context.localizations.addAnotherManager,
                        press: () => setState(() => managers.add(ManagerFormData())),
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
            child: BlocConsumer<CreateHrAccessCubit, BaseState<CreateHrAccessData>>(
              listener: (context, state) {
                if (state.isSuccess && state.identifier == "submit_managers") {
                  SettingsHelper.showAlertDialog(
                    context: context,
                    title: context.localizations.sentRequestSuccessTitle,
                    body: context.localizations.sentRequestSuccessBody,
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.identifier == "submit_managers") {
                  return const LoadingWidget();
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
                      child: CustomButton(
                        text: context.localizations.submitRequest,
                        press: () async {
                          if (!_formKey.currentState!.saveAndValidate()) {
                            return;
                          }
                          final List<ManagerFormData> extractedManagers =
                              _extractManagersFromForm();
                          context.read<CreateHrAccessCubit>().submitManagers(
                                extractedManagers,
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

  List<ManagerFormData> _extractManagersFromForm() {
    final formData = _formKey.currentState?.value ?? {};
    final List<ManagerFormData> extractedManagers = [];

    for (int i = 0; i < managers.length; i++) {
      extractedManagers.add(
        ManagerFormData(
          policy: formData['policy_$i'] as MainPolicyModel?,
          name: formData['name_$i'] as String?,
          email: formData['email_$i'] as String?,
          jobTitle: formData['jobTitle_$i'] as String?,
          mobileNumber: formData['mobileNumber_$i'] as String?,
          accessPayment: formData['accessPayment_$i'] == true,
          accessPolicyDetails: formData['accessPolicyDetails_$i'] == true,
          accessUtilization: formData['accessUtilization_$i'] == true,
          accessActiveList: formData['accessActiveList_$i'] == true,
          accessAdditionAndDeletions:
              formData['accessAdditionAndDeletions_$i'] == true,
          reimbursement: formData['reimbursement_$i'] == true,
        ),
      );
    }

    return extractedManagers;
  }
}
