import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/network/data/models/response/tpa_model.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search/search_cubit.dart';
import 'main_expanded_filter_design.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  void initState() {
    context.read<SearchCubit>().getAllTpa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        context.read<SearchCubit>().clearAllData();
      },
      child: BlocBuilder<SearchCubit, BaseState<List<TpaModel>>>(
        builder: (context, state) {
          if (state.isLoading && state.identifier == 'get_all_tpa') {
            return const LoadingWidget();
          } else if (state.isFailure) {
            return AppFailureWidget(
              title: state.error.toString(),
              callback: () => context.read<SearchCubit>().getAllTpa(),
            );
          } else {
            return const MainExpandedFilterDesign();
          }
        },
      ),
    );
  }
}
