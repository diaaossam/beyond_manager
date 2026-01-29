import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/features/car_service/presentation/cubit/car_service_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/car_service_body.dart';

@RoutePage()
class CarServiceScreen extends StatelessWidget {
  const CarServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CarServiceCubit>(),
      child: const Scaffold(
        appBar: CustomAppBar(title: "Car Service"),
        body: CarServiceBody(),
      ),
    );
  }
}
