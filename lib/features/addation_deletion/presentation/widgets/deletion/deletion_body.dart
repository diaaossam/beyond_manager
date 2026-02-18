import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/widget_extensions.dart';
import 'package:bond/features/addation_deletion/presentation/cubit/deletion/deletion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/custom_search_text_form_field.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../../policies/data/models/request/get_active_list_params.dart';
import '../../../data/models/response/deletion_response_model.dart';
import '../../../data/models/response/policies_data_addation.dart';
import 'deletion_member_card.dart';

class DeletionBody extends StatefulWidget {
  final List<PoliciesDataModel> policies;

  const DeletionBody({super.key, required this.policies});

  @override
  State<DeletionBody> createState() => _DeletionBodyState();
}

class _DeletionBodyState extends State<DeletionBody> {
  Set<num> selectedMemberIds = {};
  ActiveListParams? getActiveListParams;
  Timer? _debounce;
  List<DeletionMemberModel> selectedMembers = [];

  @override
  void initState() {
    super.initState();
    final bloc = context.read<DeletionCubit>();
    List<num> policyIds = widget.policies
        .map((policy) => policy.policyId ?? 0)
        .toList();
    getActiveListParams = ActiveListParams(
      pageSize: 8,
      policyId: policyIds.first.toInt(),
      polices: policyIds,
      pageKey: 1,
    );
    bloc.initPagination(params: getActiveListParams!);
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletionCubit, BaseState<DeletionResponseModel>>(
      listener: (context, state) {
      },
      builder: (context, state) {
        final bloc =context.read<DeletionCubit>();
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: screenPadding(),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      AppText.body(
                        text: context.localizations.selectMemberToDeleteBody,
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.shadow,
                        align: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      CustomButton(
                        text: context.localizations.viewDeletionGuide,
                        iconData: Icons.folder_outlined,
                        press: () => context.router.push(const DeletionGuidelinesRoute()),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.warning_amber,
                              color: Color(0xFFF59E0B),
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: context.colorScheme.onSurface,
                                    height: 1.4,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "${context.localizations.important} ",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: context.colorScheme.onSurface,
                                        height: 1.4,fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                      context.localizations.importantBody,
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: context.colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.name,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                      const Duration(milliseconds: 300),
                                          () {
                                        getActiveListParams =
                                            getActiveListParams?.copyWith(
                                              name: value.toString(),
                                            );
                                        bloc.fetchActiveList(
                                          params: getActiveListParams!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: SizeConfig.bodyHeight * .01),
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.insuranceID,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                      const Duration(milliseconds: 300),
                                          () {
                                        getActiveListParams =
                                            getActiveListParams?.copyWith(
                                              insuranceId: value.toString(),
                                            );

                                        bloc.fetchActiveList(
                                          params: getActiveListParams!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: SizeConfig.bodyHeight * .01),
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.staffId,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                      const Duration(milliseconds: 300),
                                          () {
                                        getActiveListParams =
                                            getActiveListParams?.copyWith(
                                              staffId: value.toString(),
                                            );

                                        bloc.pagingController.refresh();
                                        bloc.fetchActiveList(
                                          params: getActiveListParams!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .015),
                          Row(
                            children: [
                              AppImage.asset(Assets.icons.search),
                              SizedBox(width: SizeConfig.screenWidth * .015),
                              AppText(
                                text: context.localizations.search,
                                textSize: 13,
                              ),
                              const Spacer(),
                              AppText(
                                text: "${context.localizations.count} ${state.data?.totalCount}",
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
                10.verticalSpace.toSliver(),
                PagingListener<int, DeletionMemberModel>(
                  controller: bloc.pagingController,
                  builder: (context, state, fetchNextPage) => PagedSliverList<int, DeletionMemberModel>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    addAutomaticKeepAlives: true,
                    builderDelegate:PagedChildBuilderDelegate<DeletionMemberModel>(
                      firstPageProgressIndicatorBuilder: (context) => LoadingWidget(),
                      firstPageErrorIndicatorBuilder: (context) => AppFailureWidget(
                        callback: () => bloc.pagingController.refresh(),
                      ),
                      noItemsFoundIndicatorBuilder: (context) => EmptyWidgetDesign(),
                      itemBuilder: (context, item, index) {
                        final isSelected = selectedMemberIds.contains(item.id);
                        return DeletionMemberCard(
                          deletionMemberModel: item,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedMemberIds.remove(item.id);
                                selectedMembers.removeWhere((member) => member.id == item.id);
                              } else {
                                selectedMemberIds.add(item.id!);
                                selectedMembers.add(item);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: selectedMemberIds.isNotEmpty ? Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group,
                          color: context.colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        AppText(
                          text: context.localizations.selectedMembers(selectedMemberIds.length),
                          fontWeight: FontWeight.w600,
                          textSize: 14,
                          color: context.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
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
                          text: context.localizations.continueButton,
                          press: () {
                                },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
              : null,
        );
      },
    );
  }

}
