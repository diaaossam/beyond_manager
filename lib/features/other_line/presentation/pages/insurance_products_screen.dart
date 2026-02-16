import 'package:auto_route/auto_route.dart';
import 'package:bond/core/enum/recommendation_status.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/all_recomended/recommended_cubit.dart';
import '../widgets/all_recomendation_body.dart';

@RoutePage()
class InsuranceProductsScreen extends StatelessWidget {
  const InsuranceProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<RecommendedCubit>()
            ..getAllRecommended(matchLevelEnum: MatchLevelEnum.all),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.insuranceProducts),
        body: AllRecommendationBody(),
      ),
    );
  }
}
