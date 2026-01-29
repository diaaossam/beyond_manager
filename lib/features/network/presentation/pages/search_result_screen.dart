import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchScreenResultScreen extends StatelessWidget {
  const SearchScreenResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchResultCubit>(),
      child: const Scaffold(
        body: Center(child: Text("Search Results")),
      ),
    );
  }
}
