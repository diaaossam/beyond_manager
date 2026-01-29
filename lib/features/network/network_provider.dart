import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/network/presentation/bloc/network_bloc.dart';
import 'package:bond/features/network/presentation/bloc/search/search_cubit.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkProviders extends StatelessWidget {
  final Widget child;

  const NetworkProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<NetworkBloc>()),
        BlocProvider(create: (context) => sl<SearchCubit>()),
        BlocProvider(create: (context) => sl<SearchResultCubit>()),
      ],
      child: child,
    );
  }
}
