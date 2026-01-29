import 'dart:async';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/presentation/widget/reimburment/reimbursement_filter_sheet.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/custom_expanded_tile_design.dart';
import '../../../../../config/helper/excel_helper.dart';
import '../../../data/models/request/reimbursement_filter_model.dart';
import '../../../data/models/response/reimbursement_model.dart';
import '../../cubit/reimbursement/reimbursement_cubit.dart';
import 'reimbursement_title_card.dart';
import 'reumbursement_card_body.dart';

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
  bool isSearch = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<ReimbursementCubit>();
    currentFilter = ReimbursementFilterModel(
      pageSize: 8,
      policyId: widget.policyId,
      pageKey: 1,
    );
    bloc.initPagination(initialParams: currentFilter);
    bloc.fetchFirstReimbursement(params: currentFilter!);
  }

  void showFilterSheet({required BuildContext context}) {
    print(context.read<ReimbursementCubit>().state.data?.status);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ReimbursementFilterSheet(
        policyId: widget.policyId,
        list: context.read<ReimbursementCubit>().state.data?.status ?? [],
        currentFilter: currentFilter,
        onApplyFilters: (filter) {
          setState(() {
            currentFilter = filter;
            isSearch = true;
          });

          context.read<ReimbursementCubit>().fetchUtilization(params: filter);
          setState(() {
            isSearch = false;
          });
        },
        onClearFilters: () {
          setState(() {
            currentFilter = ReimbursementFilterModel(
              pageSize: 8,
              policyId: widget.policyId,
              pageKey: 1,
            );
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
    context.read<ReimbursementCubit>().fetchUtilization(params: currentFilter!);
    setState(() {
      isSearch = false;
    });
  }

  void _handleBackToAll() {
    setState(() {
      currentFilter = ReimbursementFilterModel(
        pageSize: 8,
        policyId: widget.policyId,
        pageKey: 1,
      );
      isViewingSpecificMember = false;
      viewingMemberName = null;
      isSearch = true;
    });

    context.read<ReimbursementCubit>().fetchUtilization(params: currentFilter!);
    setState(() {
      isSearch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ReimbursementCubit,
      BaseState<ReimbursementResponseModel>
    >(
      builder: (context, state) {
        final bloc = context.read<ReimbursementCubit>();
        return state.builder(
          onTapRetry: () => bloc.fetchUtilization(
            params: ReimbursementFilterModel(policyId: widget.policyId),
          ),
          onSuccess: (data) {
            return Scaffold(
              appBar: CustomAppBar(
                title: isViewingSpecificMember
                    ? '$viewingMemberName\'s Claims'
                    : context.localizations.reimbursementRequests,
                  actions: [
                    if ((state.data?.result ?? []).isNotEmpty)
                      InkWell(
                        onTap: () async {
                          final response = await context
                              .read<ReimbursementCubit>()
                              .policiesRepositoryImpl
                              .getReimursement(
                            params: ReimbursementFilterModel(
                              policyId: widget.policyId,
                            ),
                          );
                          final model = response.getOrElse(() => ReimbursementResponseModel());
                          ExcelHelper().createReimbursementExcel(
                            reimbursementList: model.result ?? [],
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * .04,
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: AppImage.asset(Assets.icons.excel),
                              ),
                              AppImage.asset(Assets.icons.downloadExcel),
                            ],
                          ),
                        ),
                      ),
                  ],

              ),
              body: Padding(
                padding: screenPadding(),
                child: RefreshIndicator(
                  onRefresh: () async => bloc.pagingController.refresh(),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(height: SizeConfig.bodyHeight * .01),
                      ),
                      if (isViewingSpecificMember)
                        SliverToBoxAdapter(
                          child: CustomButton(
                            text: "Back To All",
                            press: _handleBackToAll,
                          ),
                        ),

                      SliverToBoxAdapter(
                        child: SizedBox(height: SizeConfig.bodyHeight * .01),
                      ),
                      if (!isViewingSpecificMember) ...[
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              AppImage.asset(Assets.icons.search),
                              SizedBox(width: SizeConfig.screenWidth * .015),
                              AppText(
                                text: context.localizations.search,
                                textSize: 16,
                              ),
                              const Spacer(),
                              AppText(
                                text:
                                    "${context.localizations.lastUpdated} ${state.data?.lastUpdatedDate ?? ''}",
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(height: SizeConfig.bodyHeight * .02),
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
                                          const Duration(milliseconds: 300),
                                          () {
                                            setState(() => isSearch = true);
                                            currentFilter = currentFilter
                                                ?.copyWith(
                                                  name: value.toString(),
                                                );

                                            bloc.fetchUtilization(
                                              params: currentFilter!,
                                            );
                                            setState(() => isSearch = false);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.bodyHeight * .01),
                                  Expanded(
                                    child: CustomSearchTextFormField(
                                      hintText:
                                          context.localizations.insuranceID,
                                      onChange: (value) {
                                        if (_debounce?.isActive ?? false)
                                          _debounce!.cancel();
                                        _debounce = Timer(
                                          const Duration(milliseconds: 300),
                                          () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            currentFilter = currentFilter
                                                ?.copyWith(
                                                  insuranceId: value.toString(),
                                                );

                                            bloc.fetchUtilization(
                                              params: currentFilter!,
                                            );
                                            setState(() => isSearch = false);
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
                                        if (_debounce?.isActive ?? false)
                                          _debounce!.cancel();
                                        _debounce = Timer(
                                          const Duration(milliseconds: 300),
                                          () {
                                            setState(() {
                                              isSearch = true;
                                            });
                                            currentFilter = currentFilter
                                                ?.copyWith(
                                                  staffId: value.toString(),
                                                );

                                            bloc.fetchUtilization(
                                              params: currentFilter!,
                                            );
                                            setState(() => isSearch = false);
                                          },
                                        );
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
                      if (state.data?.totalCount != null)
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              AppText(
                                text: "Total Members: ${state.data?.totalCount}",
                              ),
                              if (!isViewingSpecificMember)
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox.shrink(),
                                      IconButton(
                                        icon: const Icon(Icons.filter_alt),
                                        onPressed: () =>
                                            showFilterSheet(context: context),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      PagingListener<int, ReimbursementModel>(
                        controller: bloc.pagingController,
                        builder: (context, pagingState, fetchNextPage) =>
                            PagedSliverList<int, ReimbursementModel>(
                              state: pagingState,
                              fetchNextPage: fetchNextPage,
                              addAutomaticKeepAlives: true,
                              builderDelegate:
                                  PagedChildBuilderDelegate<ReimbursementModel>(
                                    firstPageProgressIndicatorBuilder:
                                        (context) => const LoadingWidget(),
                                    firstPageErrorIndicatorBuilder: (context) =>
                                        AppFailureWidget(
                                          callback: () =>
                                              bloc.pagingController.refresh(),
                                        ),
                                    noItemsFoundIndicatorBuilder: (context) =>
                                        const EmptyWidgetDesign(),
                                    itemBuilder: (context, item, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        child: CustomExpandedTile(
                                          title: ReimbursementTitleCard(
                                            request: item,
                                            onViewAllClaims:
                                                isViewingSpecificMember
                                                ? null
                                                : () {
                                                    _handleViewAllClaims(item);
                                                  },
                                          ),
                                          body: ReimbursementCardBody(
                                            result: item,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
