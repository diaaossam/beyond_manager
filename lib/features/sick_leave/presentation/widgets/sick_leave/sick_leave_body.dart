import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:bond/features/sick_leave/data/models/request/sick_leave_params.dart';
import 'package:bond/features/sick_leave/presentation/cubit/create_sick_leave/create_sick_leave_cubit.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/image_picker/pick_multi_media_sheet.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/loading/modern_button_loading.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SickLeaveBody extends StatefulWidget {
  final int policyId;

  const SickLeaveBody({
    super.key,
    required this.policyId,
  });

  @override
  State<SickLeaveBody> createState() => _SickLeaveBodyState();
}

class _SickLeaveBodyState extends State<SickLeaveBody> {
  bool isSearch = false;
  int? selectedRadio;
  String otherInsured = "";
  Timer? _debounce;
  ActiveListParams? activeListParams;

  int? insuredMemberId;
  String? otherName;

  late final PagingController<int, Result> _pagingController;

  @override
  void initState() {
    super.initState();
    activeListParams = ActiveListParams(
      pageSize: 8,
      policyId: widget.policyId,
      pageKey: 1,
    );
    
    _pagingController = PagingController(
      getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        if (!isSearch) {
          // TODO: Implement fetch active list from repository
          // For now, return empty list
          return [];
        }
        return [];
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _pagingController.dispose();
    super.dispose();
  }

  Result? _selectedMember;

  void _handleUploadAttachments() {
    // Check if "Other" field has value
    if (otherInsured.isNotEmpty && otherName != null) {
      _showCombinedUploadBottomSheet(null);
      return;
    }

    // Check if a member is selected from the list
    if (selectedRadio != null && _selectedMember != null) {
      _showCombinedUploadBottomSheet(_selectedMember);
      return;
    }

    // No member selected, show error
    AppConstant.showToast(
      color: Colors.red,
      msg: context.localizations.chooseMember,
      gravity: ToastGravity.TOP,
    );
  }

  void _showCombinedUploadBottomSheet(Result? selectedMember) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (bottomContext) {
        return PickMediaFileSheetMultiImages(
          onPickFile: (files) {
            context.read<CreateSickLeaveCubit>().updateFiles(files: files);
            if (selectedMember != null) {
              setState(() => insuredMemberId = selectedMember.memberId);
            }
            Navigator.pop(bottomContext);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateSickLeaveCubit, BaseState<String>>(
      listener: (context, state) {
        if (state.isSuccess && state.identifier == 'create_sick_leave') {
          setState(() {
            insuredMemberId = null;
            selectedRadio = null;
            _selectedMember = null;
          });
          AppConstant.showToast(
            color: context.colorScheme.tertiary,
            msg: 'Request submitted successfully',
            gravity: ToastGravity.TOP,
          );
          Future.delayed(
            const Duration(seconds: 1),
            () => context.maybePop(),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<CreateSickLeaveCubit>();
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: context.colorScheme.surface,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomSearchTextFormField(
                          hintText: context.localizations.name,
                          onChange: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce = Timer(
                              const Duration(milliseconds: 800),
                              () {
                                setState(() {
                                  isSearch = true;
                                  selectedRadio = null;
                                  _selectedMember = null;
                                  otherName = value;
                                });
                                activeListParams =
                                    activeListParams?.copyWith(name: value.toString());
                                _pagingController.refresh();
                                setState(() => isSearch = false);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      Expanded(
                        child: CustomSearchTextFormField(
                          hintText: context.localizations.insuranceID,
                          onChange: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce = Timer(
                              const Duration(milliseconds: 800),
                              () {
                                setState(() {
                                  isSearch = true;
                                  selectedRadio = null;
                                  _selectedMember = null;
                                });
                                activeListParams = activeListParams?.copyWith(
                                  insuranceId: value.toString(),
                                );
                                _pagingController.refresh();
                                setState(() => isSearch = false);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      Expanded(
                        child: CustomSearchTextFormField(
                          hintText: context.localizations.staffId,
                          onChange: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce = Timer(
                              const Duration(milliseconds: 800),
                              () {
                                setState(() {
                                  isSearch = true;
                                  selectedRadio = null;
                                  _selectedMember = null;
                                });
                                activeListParams = activeListParams?.copyWith(
                                  staffId: value.toString(),
                                );
                                _pagingController.refresh();
                                setState(() => isSearch = false);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .005),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .04,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomSearchTextFormField(
                    prefixIcon: Icons.add,
                    hintText: context.localizations.other,
                    onChange: (p0) {
                      setState(() {
                        selectedRadio = null;
                        _selectedMember = null;
                        otherInsured = p0.toString();
                      });
                      if (p0!.isNotEmpty) {
                        otherName = p0;
                        insuredMemberId = null;
                      } else {
                        otherName = null;
                      }
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .01),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .04,
                ),
                sliver: SliverToBoxAdapter(
                  child: AppText(
                    text: context.localizations.chooseMember,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .01),
              ),
              PagingListener<int, Result>(
                controller: _pagingController,
                builder: (context, state, fetchNextPage) => PagedSliverList<int, Result>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<Result>(
                    firstPageProgressIndicatorBuilder: (context) =>
                        const LoadingWidget(),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: AppText(
                          text: 'No members found',
                        ),
                      ),
                    ),
                  itemBuilder: (context, item, index) {
                    return FadeInUp(
                      duration: Duration(milliseconds: 300 + (index * 50)),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.bodyHeight * .01,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: SizeConfig.screenWidth * .04),
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              radius: 25,
                              child: AppText(
                                textSize: 14,
                                fontWeight: FontWeight.w600,
                                text: _getInitials(item.member ?? ""),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * .03),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: item.member ?? "",
                                    fontWeight: FontWeight.w600,
                                    textSize: 13,
                                  ),
                                  SizedBox(height: SizeConfig.bodyHeight * .01),
                                  if (item.insuranceID != null)
                                    AppText(
                                      text: "Insurance: ${item.insuranceID}",
                                      textSize: 13,
                                    ),
                                  SizedBox(height: SizeConfig.bodyHeight * .01),
                                  if (item.staff != null)
                                    AppText(
                                      text: "${context.localizations.staffId}: ${item.staff}",
                                      textSize: 13,
                                    ),
                                ],
                              ),
                            ),
                            Radio(
                              value: index,
                              groupValue: selectedRadio,
                              onChanged: (value) {
                                if (otherInsured.isNotEmpty) {
                                  AppConstant.showToast(
                                    color: Colors.red,
                                    msg: context.localizations.clearOtherFirst,
                                    gravity: ToastGravity.TOP,
                                  );
                                  return;
                                }
                                if (selectedRadio == index) {
                                  insuredMemberId = null;
                                  _selectedMember = null;
                                  setState(() => selectedRadio = null);
                                } else {
                                  insuredMemberId = item.memberId;
                                  _selectedMember = item;
                                  setState(() => selectedRadio = index);
                                }
                              },
                            ),
                            SizedBox(width: SizeConfig.screenWidth * .04),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .04,
              vertical: SizeConfig.bodyHeight * .01,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (cubit.listFiles.isNotEmpty) ...[
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.listFiles.length,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (_, index) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.colorScheme.outline.withValues(alpha: 0.3),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppText(
                              text: cubit.listFiles[index].path
                                  .toString()
                                  .split("/")
                                  .last,
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () => cubit.removeFileFromList(
                              file: cubit.listFiles[index],
                            ),
                            child: Icon(
                              Icons.remove_circle,
                              color: context.colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                ],
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        textSize: 14,
                        textColor: context.colorScheme.primary,
                        backgroundColor: Colors.transparent,
                        text: context.localizations.uploadAttachments,
                        press: _handleUploadAttachments,
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      child: state.isLoading &&
                              state.identifier == 'create_sick_leave'
                          ? const ModernButtonLoading()
                          : CustomButton(
                              text: context.localizations.submit,
                              press: () {
                                if (cubit.listFiles.isEmpty) {
                                  AppConstant.showToast(
                                    color: Colors.red,
                                    msg: context.localizations.attachmentsValidation,
                                    gravity: ToastGravity.TOP,
                                  );
                                  return;
                                }
                                cubit.createNewSickLeave(
                                  sickLeaveParams: SickLeaveParams(
                                    insuredMemberId: insuredMemberId,
                                    other: otherName,
                                    policyId: widget.policyId,
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return "";
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return "${parts[0][0]}${parts[1][0]}".toUpperCase();
    }
    return name.substring(0, name.length > 2 ? 2 : name.length).toUpperCase();
  }
}
