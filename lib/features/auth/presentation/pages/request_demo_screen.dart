import 'package:bond/features/auth/presentation/cubit/request_demo/request_demo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../widgets/register/request_demo_body.dart';

class RequestDemoScreen extends StatelessWidget {
  const RequestDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RequestDemoCubit>(),
      child: Scaffold(body: const RequestDemoBodyBody()),
    );
  }
}
