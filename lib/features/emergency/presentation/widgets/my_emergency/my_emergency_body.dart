import 'package:animate_do/animate_do.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:bond/features/emergency/presentation/cubit/emergency_cubit.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../widgets/no_item_design.dart';
import 'my_emergency_item.dart';

class MyEmergencyBody extends StatelessWidget {
  const MyEmergencyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyCubit, BaseState<List<EmergencyModel>>>(
      builder: (context, state) {
        final bloc = context.read<EmergencyCubit>();
        return RefreshIndicator(
          onRefresh: () async => bloc.pagingController.refresh(),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: screenPadding(),
                sliver: PagingListener<int, EmergencyModel>(
                  controller: bloc.pagingController,
                  builder: (context, state, fetchNextPage) => PagedSliverList<int, EmergencyModel>(
                        state: state,
                        fetchNextPage: fetchNextPage,
                        addAutomaticKeepAlives: true,
                        builderDelegate:
                            PagedChildBuilderDelegate<EmergencyModel>(
                              firstPageProgressIndicatorBuilder: (context) => LoadingWidget(),
                              firstPageErrorIndicatorBuilder: (context) => AppFailureWidget(),
                              noItemsFoundIndicatorBuilder: (context) => EmptyWidgetDesign(),
                              itemBuilder: (context, item, index) {
                                return FadeInUp(
                                  duration: Duration(
                                    milliseconds: 300 + (index * 50),
                                  ),
                                  delay: Duration(milliseconds: index * 50),
                                  from: 20,
                                  child: MyEmergencyItemDesign(
                                    model: item,
                                    index: index,
                                  ),
                                );
                              },
                            ),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
