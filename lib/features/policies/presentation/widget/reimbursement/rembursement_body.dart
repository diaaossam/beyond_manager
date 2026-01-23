import 'dart:async';

import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/excel_helper/excel_helper.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/features/reimbursement/data/models/reimbursement_model.dart';
import 'package:beymanger/features/reimbursement/presentation/cubit/reimbursement_cubit.dart';
import 'package:beymanger/widgets/custom_app_bar.dart';
import 'package:beymanger/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_text.dart';
import '../../../../network/presentation/widgets/filter_expanded/custom_expanded_widget.dart';
import '../../../../policies/presentation/widgets/search_custom_text_form_field.dart';
import '../../../data/models/reimbursement_filter_model.dart';
import '../reimbursement_filter_sheet.dart';
import '../reimbursement_title_card.dart';
import '../reumbursement_card_body.dart';

class RembursementBody extends StatefulWidget {
  final int policyId;

  const RembursementBody({super.key, required this.policyId});

  @override
  State<RembursementBody> createState() => _RembursementBodyState();
}

class _RembursementBodyState extends State<RembursementBody> {
  ReimbursementFilterModel? currentFilter;
  bool isViewingSpecificMember = false;
  String? viewingMemberName;

  @override
  void initState() {
    final bloc = context.read<ReimbursementCubit>();
    bloc.pagingController.addPageRequestListener((pageKey) {
      if (!isSearch) {
        if (pageKey == 0) {
          pageKey = 1;
          currentFilter = ReimbursementFilterModel(
              pageSize: 8, policyId: widget.policyId, pageKey: pageKey);
        }
        bloc.fetchPage(params: currentFilter!.copyWith(pageKey: pageKey));
      }
    });
    super.initState();
  }

  bool isSearch = false;
  Timer? _debounce;

  void showFilterSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ReimbursementFilterSheet(
        policyId: widget.policyId,
        list: context.read<ReimbursementCubit>().claimStatusOptions,
        currentFilter: currentFilter,
        onApplyFilters: (filter) {
          setState(() {
            currentFilter = filter;
            isSearch = true;
          });

          context.read<ReimbursementCubit>().pagingController.refresh();
          context.read<ReimbursementCubit>().fetchPage(params: filter);
          setState(() {
            isSearch = false;
          });
        },
        onClearFilters: () {
          setState(() {
            currentFilter = ReimbursementFilterModel(
                pageSize: 8, policyId: widget.policyId, pageKey: 1);
            isSearch = false;
          });
          // Refresh the paging controller
          context.read<ReimbursementCubit>().pagingController.refresh();
          setState(() {
            isSearch = false;
          });
        },
      ),
    );
  }

  void _handleViewAllClaims(ReimbursementModel item) {
    setState(() {
      currentFilter = ReimbursementFilterModel(
        policyId: widget.policyId,
        name: item.memberName ?? '',
        insuranceId: item.idNumber ?? '',
        userManagerId: 1,
        pageSize: 100,
        sortBy: 'oldest',
      );
      isViewingSpecificMember = true;
      viewingMemberName = item.memberName ?? '';
      isSearch = true;
    });

    context.read<ReimbursementCubit>().pagingController.refresh();
    context.read<ReimbursementCubit>().fetchPage(params: currentFilter!);
    setState(() {
      isSearch = false;
    });
  }

  void _handleBackToAll() {
    setState(() {
      currentFilter = ReimbursementFilterModel(
        pageSize: 8, 
        policyId: widget.policyId, 
        pageKey: 1
      );
      isViewingSpecificMember = false;
      viewingMemberName = null;
      isSearch = true;
    });

    context.read<ReimbursementCubit>().pagingController.refresh();
    context.read<ReimbursementCubit>().fetchPage(params: currentFilter!);
    setState(() {
      isSearch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReimbursementCubit, ReimbursementState>(
      builder: (context, state) {
        final bloc = context.read<ReimbursementCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            text: isViewingSpecificMember 
                ? '$viewingMemberName\'s Claims'
                : context.localizations.reimbursementRequests,
            isHaveActions: bloc.showExcel,
            onActionPress: () async {
              final list = await context
                  .read<ReimbursementCubit>()
                  .getReimbursementList(
                    params: ReimbursementFilterModel(
                      policyId: widget.policyId,
                      pageSize: 1000, // Get all records for Excel
                      pageKey: 1,
                    ),
                  );

              ExcelHelper().createReimbursementExcel(
                reimbursementList: list,
              );
            },
          ),
          body: Padding(
            padding: screenPadding(),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: SizeConfig.bodyHeight * .01,
                    ),
                  ),
                  if (isViewingSpecificMember)
                   SliverToBoxAdapter(child:  CustomButton(text: "Back To All", press: _handleBackToAll),),
                   /*if
                  (bloc.videoTutorial.isNotEmpty && !isViewingSpecificMember)
                  SliverToBoxAdapter(
                    child: InkWell(
                      onTap: () => showVideoPlayerDialog(context: context,videoUrl:bloc.videoTutorial ,),
                      child: Container(
                        decoration: BoxDecoration(color:AppColors.primary.withValues(alpha: 0.2) ,borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:Colors.white,width: 1)
                              ),
                              child: const Icon(Icons.question_mark_outlined,color: Colors.white,),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const AppText(text: "How to Use Reimbursement Management",fontWeight: FontWeight.w600,textSize: 13,),
                                  SizedBox(height: SizeConfig.bodyHeight*.005,),
                                  const AppText(text: "Learn how to search, filter, and manage medical reimbursement requests",maxLines: 3,),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      AppText(text: "Show Guide",color: AppColors.primary,textSize: 12,fontWeight: FontWeight.bold,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),*/
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: SizeConfig.bodyHeight * .01,
                    ),
                  ),
                  if(!isViewingSpecificMember)...[
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.search),
                          SizedBox(width: SizeConfig.screenWidth * .015),
                          AppText(
                              text: context.localizations.search, textSize: 16),
                          const Spacer(),
                          AppText(
                              text:
                              "${context.localizations.lastUpdated} ${bloc.lastUpdateDate}")
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: SizeConfig.bodyHeight * .02,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
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
                                        const Duration(milliseconds: 300), () {
                                      setState(() => isSearch = true);
                                      currentFilter = currentFilter?.copyWith(
                                          name: value.toString());

                                      bloc.pagingController.refresh();
                                      bloc
                                          .fetchPage(params: currentFilter!)
                                          .then((_) {
                                        setState(() => isSearch = false);
                                      });
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: SizeConfig.bodyHeight * .01),
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.insuranceID,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false)
                                      _debounce!.cancel();
                                    _debounce = Timer(
                                        const Duration(milliseconds: 300), () {
                                      setState(() {
                                        isSearch = true;
                                      });
                                      currentFilter = currentFilter?.copyWith(
                                          insuranceId: value.toString());

                                      bloc.pagingController.refresh();
                                      bloc
                                          .fetchPage(params: currentFilter!)
                                          .then((_) {
                                        setState(() => isSearch = false);
                                      });
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: SizeConfig.bodyHeight * .01),
                              Expanded(
                                child: CustomSearchTextFormField(
                                  hintText: context.localizations.staffId,
                                  onChange: (value) {
                                    if (_debounce?.isActive ?? false)
                                      _debounce!.cancel();
                                    _debounce = Timer(
                                        const Duration(milliseconds: 300), () {
                                      setState(() {
                                        isSearch = true;
                                      });
                                      currentFilter = currentFilter?.copyWith(
                                          staffId: value.toString());

                                      bloc.pagingController.refresh();
                                      bloc
                                          .fetchPage(params: currentFilter!)
                                          .then((_) {
                                        setState(() => isSearch = false);
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .01),
                          /*Row(
                          children: [
                            Expanded(
                              child: CustomSearchTextFormField(
                                hintText: context.localizations.staffId,
                                onChange: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce!.cancel();
                                  _debounce = Timer(
                                      const Duration(milliseconds: 300), () {
                                    setState(() {
                                      isSearch = true;
                                    });
                                    currentFilter = currentFilter?.copyWith(
                                        staffId: value.toString());

                                    bloc.pagingController.refresh();
                                    bloc
                                        .fetchPage(params: currentFilter!)
                                        .then((_) {
                                      setState(() => isSearch = false);
                                    });
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: SizeConfig.bodyHeight * .01),
                            Expanded(
                              child: CustomSearchTextFormField(
                                hintText: context.localizations.policyNumber,
                                onChange: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce!.cancel();
                                  _debounce = Timer(
                                      const Duration(milliseconds: 300), () {
                                    setState(() {
                                      isSearch = true;
                                    });
                                    currentFilter = currentFilter?.copyWith(
                                        policyNumber: value.toString());

                                    bloc.pagingController.refresh();
                                    bloc
                                        .fetchPage(params: currentFilter!)
                                        .then((_) {
                                      setState(() => isSearch = false);
                                    });
                                  });
                                },
                              ),
                            ),
                          ],
                        ),*/
                        ],
                      ),
                    ),
                  ],
                  if (bloc.totalMembers != null)
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          AppText(
                              text: "Total Members: ${bloc.totalMembers}"),
                          if(!isViewingSpecificMember)
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox.shrink(),
                                IconButton(
                                  icon: const Icon(Icons.filter_alt),
                                  onPressed: () => showFilterSheet(context: context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                  PagedSliverList(
                      pagingController: bloc.pagingController,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, ReimbursementModel item, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CustomExpandedWidget(
                              title: ReimbursementTitleCard(
                                request: item,
                                onViewAllClaims: isViewingSpecificMember ? null : () {
                                  _handleViewAllClaims(item);
                                },
                              ),
                              body: ReimbursementCardBody(
                                result: item,
                              ),
                            ),
                          );
                        },
                      ))
                ],
              ),
            ),
        );
      },
    );
  }
}
