import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/car_service_cubit.dart';
import '../widgets/car_service_body.dart';

@RoutePage()
class CarServiceScreen extends StatelessWidget {
  const CarServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CarServiceCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.serviceCenters),
        body: const CarServiceBody(),
      ),
    );
  }
}
