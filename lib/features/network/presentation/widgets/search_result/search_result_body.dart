import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:bond/features/network/presentation/widgets/sliver_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../data/models/response/search_params.dart';
import 'search_result_list.dart';
import 'search_result_ttf.dart';

class SearchResultBody extends StatefulWidget {
  final SearchParamsModel searchParamsModel;

  const SearchResultBody({super.key, required this.searchParamsModel});

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  late PagingController<int, HospitalModel> pagingController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SearchResultCubit>();
    cubit.initPagingController(searchParams: widget.searchParamsModel);
    pagingController = cubit.pagingController!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, BaseState<List<HospitalModel>>>(
      builder: (context, state) {
        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverSearchAppBar(
              bottom: SearchResultTff(
                onChanged: (value) {
                  SearchParamsModel paramsModel = widget.searchParamsModel.copyWith(
                    provider: value.isNotEmpty ? value : null,
                    pageNumber: 1,
                  );
                  context.read<SearchResultCubit>().updateSearchParams(paramsModel);
                },
              ),
            ),
          ],
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .015),
              ),
              SliverPadding(
                padding: screenPadding(),
                sliver: SliverToBoxAdapter(
                  child: AppText(
                    text:
                        "${context.localizations.count}: ${context.read<SearchResultCubit>().totalCount}",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.bodyHeight * .015),
              ),
              SearchResultList(
                pagingController: pagingController,
                searchParamsModel: widget.searchParamsModel,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
