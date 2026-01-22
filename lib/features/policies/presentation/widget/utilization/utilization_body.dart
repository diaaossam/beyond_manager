import 'dart:async';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/models/response/utilization_model.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/custom_expanded_tile_design.dart';
import '../../../../settings/presentation/pages/web_view_screen.dart';
import '../../cubit/utilization/utilization_bloc.dart';
import 'custom_utilization_body.dart';
import 'custom_utilization_header.dart';
import 'utilization_card.dart';

class UtilitzationBody extends StatefulWidget {
  final int policyId;

  const UtilitzationBody({super.key, required this.policyId});

  @override
  State<UtilitzationBody> createState() => _UtilitzationBodyState();
}

class _UtilitzationBodyState extends State<UtilitzationBody> {
  bool isSearch = false;
  Timer? _debounce;
  ActiveListParams? getActiveListParams;

  @override
  void initState() {
    final bloc = context.read<UtilizationCubit>();
    getActiveListParams = ActiveListParams(
      pageSize: 8,
      policyId: widget.policyId,
      pageKey: 1,
    );
    bloc.initPagination();
    bloc.fetchFirstUtilization(params: getActiveListParams!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UtilizationCubit, BaseState<UtilizationModel>>(
      builder: (context, state) {
        final bloc = context.read<UtilizationCubit>();
        return state.builder(
          onTapRetry: () => bloc.fetchUtilization(
            params: ActiveListParams(policyId: widget.policyId),
          ),
          onSuccess: (data) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .04,
              ),
              child: RefreshIndicator(
                onRefresh: () async => bloc.pagingController.refresh(),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: data.isMedical ?? false,
                        child: Row(
                          children: [
                            AppImage.asset(Assets.icons.search),
                            SizedBox(width: SizeConfig.screenWidth * .015),
                            AppText(
                              text: context.localizations.search,
                              textSize: 13,
                            ),
                            const Spacer(),
                            AppText(
                              text:
                                  "${context.localizations.lastUpdated} ${data.lastUpdatedDate ?? ''}",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: data.isMedical ?? false,
                        child: SizedBox(height: SizeConfig.bodyHeight * .02),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: data.isMedical ?? false,
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
                                          getActiveListParams =
                                              getActiveListParams?.copyWith(
                                            memberName: value.toString(),
                                            pageKey: 1,
                                          );
                                          bloc.fetchUtilization(
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
                                            pageKey: 1,
                                          );
                                          bloc.fetchUtilization(
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
                                            pageKey: 1,
                                          );
                                          bloc.fetchUtilization(
                                            params: getActiveListParams!,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * .01),
                            CustomButton(
                              isActive: (data.dashboardLink?.toString() ?? '').isNotEmpty,
                              text: "Utilization Dashboard",
                              press: () {
                                final dashboardUrl = data.dashboardLink?.toString() ?? '';
                                if (dashboardUrl.isEmpty) {
                                  AppConstant.showCustomSnakeBar(
                                    context,
                                    "There is no data ",
                                    false,
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WebViewScreen(url: dashboardUrl),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: SizeConfig.bodyHeight * .02),
                    ),
                    PagingListener<int, Utilization>(
                      controller: bloc.pagingController,
                      builder: (context, pagingState, fetchNextPage) =>
                          PagedSliverList<int, Utilization>(
                        state: pagingState,
                        fetchNextPage: fetchNextPage,
                        addAutomaticKeepAlives: true,
                        builderDelegate: PagedChildBuilderDelegate<Utilization>(
                          firstPageProgressIndicatorBuilder: (context) =>
                              const LoadingWidget(),
                          firstPageErrorIndicatorBuilder: (context) =>
                              AppFailureWidget(
                            callback: () => bloc.pagingController.refresh(),
                          ),
                          noItemsFoundIndicatorBuilder: (context) =>
                              const EmptyWidgetDesign(),
                          itemBuilder: (context, item, index) {
                            if (data.isMedical == true) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: CustomExpandedTile(
                                  body: CustomUtilizationBody(result: item),
                                  title: CustomUtilizationHeaderExpanded(result: item),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: CustomUtilizationCardExpanded(result: item),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
