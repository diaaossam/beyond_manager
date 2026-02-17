import 'package:bond/widgets/main_widget/app_drop_down.dart';
import 'package:collection/collection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/hr_access/data/models/response/manager_list_item.dart';
import 'package:bond/features/hr_access/data/models/response/policy_access_item.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../settings/presentation/settings_helper.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../cubit/update_hr_access/update_hr_access_cubit.dart';
import '../cubit/update_hr_access/update_hr_access_data.dart';
import 'update_manager_policy_card.dart';

class UpdateExistingManagerBody extends StatefulWidget {
  const UpdateExistingManagerBody({super.key});

  @override
  State<UpdateExistingManagerBody> createState() =>
      _UpdateExistingManagerBodyState();
}

class _UpdateExistingManagerBodyState extends State<UpdateExistingManagerBody> {
  ManagerListItem? _selectedManager;
  bool _reimbursement = false;
  List<PolicyAccessItem> _policyBlocks = [];

  void _initFromManager(
    ManagerListItem? manager,
    List<MainPolicyModel> policies,
  ) {
    if (manager == null) {
      _reimbursement = false;
      _policyBlocks = [];
      return;
    }
    _reimbursement = manager.reimbursement ?? false;
    final ids = manager.policyIds ?? [];
    final lines = manager.policyLines ?? [];
    if (ids.length == 1) {
      final pid = ids.first;
      final line = lines.firstWhereOrNull((l) => l.policyId == pid) ??
          (lines.isNotEmpty ? lines.first : null);
      final policyModel =
          policies.firstWhereOrNull((p) => p.policyId == pid);
      _policyBlocks = [
        PolicyAccessItem(
          policyId: pid,
          policyName: policyModel?.policyNumber ?? pid.toString(),
          accessPayment: line?.accessPayment ?? manager.accessPayment ?? false,
          accessPolicyDetails:
              line?.accessPolicyDetails ?? manager.accessPolicyDetails ?? false,
          accessUtilization:
              line?.accessUtilization ?? manager.accessUtilization ?? false,
          accessActiveList:
              line?.accessActiveList ?? manager.accessActiveList ?? false,
          accessAdditionAndDeletions: line?.accessAdditionAndDeletions ??
              manager.accessAdditionAndDeletions ??
              false,
        ),
      ];
    } else {
      _policyBlocks = [];
    }
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
        return Column(
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
                        text: "${context.localizations.selectManager} *",
                        fontWeight: FontWeight.w700,
                        textSize: 13,
                        color: context.colorScheme.onSurface,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      if (state.isLoading && state.identifier == "managers")
                        const Center(child: LoadingWidget())
                      else
                        AppDropDown<ManagerListItem>(
                          initialValue: _selectedManager,
                          items: managers
                              .map((e) => DropdownMenuItem<ManagerListItem>(
                            value: e,
                            child: AppText(text: e.name ?? '', textSize: 12,fontWeight: FontWeight.w600,),
                          )).toList(),
                          onChanged: (v) {
                            setState(() {
                              _selectedManager = v;
                              _initFromManager(v, state.data?.policies ?? []);
                            });
                          },
                        ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      Container(
                        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            left: BorderSide(color:context.colorScheme.primary , width: 4),
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
                                      style: const TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: context.localizations.updateManagerTip,
                                      style: const TextStyle(fontWeight: FontWeight.w500),
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
                        _buildNameAndGlobalCard(context),
                        SizedBox(height: SizeConfig.bodyHeight * .03),
                        _buildPoliciesSection(context, state, policies),
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
        );
      },
    );
  }


  Widget _buildNameAndGlobalCard(BuildContext context) {
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
            text: context.localizations.globalAccessRights,
            fontWeight: FontWeight.w700,
            textSize: 14,
            color: context.colorScheme.onSurface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          InkWell(
            onTap: () => setState(() => _reimbursement = !_reimbursement),
            child: Row(
              children: [
                Checkbox(
                  value: _reimbursement,
                  onChanged: (_) => setState(() => _reimbursement = !_reimbursement),
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                Expanded(
                  child: AppText(
                    text: context.localizations.reimbrursement,
                    textSize: 12,
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoliciesSection(
    BuildContext context,
    BaseState<UpdateHrAccessData> state,
    List<MainPolicyModel> policies,
  ) {
    final manager = _selectedManager!;
    final ids = manager.policyIds ?? [];
    final lines = manager.policyLines ?? [];
    final isMulti = ids.length > 1;
    final alreadyAddedIds =
        _policyBlocks.map((b) => b.policyId).whereType<num>().toSet();
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
            text: context.localizations.policiesAndAccessPermissions,
            fontWeight: FontWeight.w700,
            textSize: 14,
            color: context.colorScheme.onSurface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          if (isMulti) ...[
            CustomButton.outline(text: context.localizations.selectPolicy, press: (){
              _showSelectPolicySheet(
                context,
                ids,
                lines,
                policies,
                manager,
                alreadyAddedIds,
              );
            }),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
          ..._policyBlocks.asMap().entries.map((e) {
            return UpdateManagerPolicyCard(
              index: e.key,
              policy: e.value,
              onRemove: () => setState(() {
                _policyBlocks = List.from(_policyBlocks)..removeAt(e.key);
              }),
              onPolicyUpdated: (updated) => setState(() {
                _policyBlocks = _policyBlocks
                    .map((p) => p.policyId == updated.policyId ? updated : p)
                    .toList();
              }),
            );
          }),
          SizedBox(height: SizeConfig.bodyHeight * .02),
        ],
      ),
    );
  }


  Future<void> _showSelectPolicySheet(
    BuildContext context,
    List<num> policyIds,
    List<PolicyLines> lines,
    List<MainPolicyModel> policies,
    ManagerListItem manager,
    Set<num> alreadyAddedIds,
  ) async {
    final availableIds = policyIds.where((id) => !alreadyAddedIds.contains(id)).toList();
    if (availableIds.isEmpty) return;

    final selected = <num>{};
    final result = await showModalBottomSheet<Set<num>>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5,
            expand: false,
            builder: (_, scroll) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: screenPadding(),
                child: Column(
                  children: [
                    AppBar(
                      title: AppText(
                        text: context.localizations.selectPolicy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        controller: scroll,
                        children: availableIds.map((pid) {
                          final policyModel =
                              policies.firstWhereOrNull((p) => p.policyId == pid);
                          final name =
                              policyModel?.policyNumber ?? pid.toString();
                          return CheckboxListTile.adaptive(
                            value: selected.contains(pid),
                            onChanged: (_) {
                              setModalState(() {
                                if (selected.contains(pid)) {
                                  selected.remove(pid);
                                } else {
                                  selected.add(pid);
                                }
                              });
                            },
                            title: AppText(text: name, textSize: 12,fontWeight: FontWeight.w600,),
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        }).toList(),
                      ),
                    ),
                    CustomButton(text: context.localizations.confirm, press: ()=> Navigator.pop(ctx, selected)),
                    SizedBox(height: SizeConfig.bodyHeight * .02),


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

    if (result != null && result.isNotEmpty && mounted) {
      setState(() {
        for (final pid in result) {
          final line = lines.firstWhereOrNull((l) => l.policyId == pid) ??
              (lines.isNotEmpty ? lines.first : null);
          final policyModel =
              policies.firstWhereOrNull((p) => p.policyId == pid);
          _policyBlocks.add(PolicyAccessItem(
            policyId: pid,
            policyName: policyModel?.policyNumber ?? pid.toString(),
            accessPayment: line?.accessPayment ?? manager.accessPayment ?? false,
            accessPolicyDetails:
                line?.accessPolicyDetails ?? manager.accessPolicyDetails ?? false,
            accessUtilization:
                line?.accessUtilization ?? manager.accessUtilization ?? false,
            accessActiveList:
                line?.accessActiveList ?? manager.accessActiveList ?? false,
            accessAdditionAndDeletions: line?.accessAdditionAndDeletions ??
                manager.accessAdditionAndDeletions ??
                false,
          ));
        }
      });
    }
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
                  isLoading: state.isLoading,
                  press: () {
                    final managerId = _selectedManager?.managerId;
                    if (managerId == null) return;
                    final policyIds = _policyBlocks
                        .map((b) => b.policyId)
                        .whereType<num>()
                        .toList();
                    final policyLines = _policyBlocks
                        .map((p) => PolicyAccessItem(
                              policyId: p.policyId,
                              policyName: p.policyName,
                              accessPayment: p.accessPayment,
                              accessPolicyDetails: p.accessPolicyDetails,
                              accessUtilization: p.accessUtilization,
                              accessActiveList: p.accessActiveList,
                              accessAdditionAndDeletions:
                                  p.accessAdditionAndDeletions,
                            ))
                        .toList();
                    context.read<UpdateHrAccessCubit>().updateManager(
                          managerId: managerId,
                          name: _selectedManager!.name ?? '',
                          reimbursement: _reimbursement,
                          policyIds: policyIds,
                          policyLines: policyLines,
                        );
                  },
                ),
        ),
      ],
    );
  }
}
