import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/features/network/data/models/response/search_params.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/no_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../widgets/custom_expanded_tile_design.dart';
import 'search_result_body_card.dart';
import 'search_result_title_card.dart';

class SearchResultList extends StatelessWidget {
  final PagingController<int, HospitalModel> pagingController;
  final SearchParamsModel searchParamsModel;

  const SearchResultList({
    super.key,
    required this.searchParamsModel,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, BaseState<List<HospitalModel>>>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          sliver: PagingListener<int, HospitalModel>(
            controller: pagingController,
            builder: (context, pagingState, fetchNextPage) => PagedSliverList<int, HospitalModel>(
              state: pagingState,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<HospitalModel>(
                firstPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
                firstPageErrorIndicatorBuilder: (context) => const AppFailureWidget(),
                noItemsFoundIndicatorBuilder: (context) => const EmptyWidgetDesign(),
                itemBuilder: (context, item, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .01,
                    ),
                    child: CustomExpandedTile(
                      title: SearchResultTitleCard(hospital: item),
                      body: SearchResultBodyCard(hospital: item),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
