import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../data/models/response/search_params.dart';
import '../bloc/search_result/search_result_cubit.dart';
import '../widgets/search_result/search_result_body.dart';

@RoutePage()
class SearchResultScreen extends StatelessWidget {
  final SearchParamsModel searchParamsModel;

  const SearchResultScreen({super.key, required this.searchParamsModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchResultCubit>(),
      child: Scaffold(
        body: SearchResultBody(searchParamsModel: searchParamsModel),
      ),
    );
  }
}
