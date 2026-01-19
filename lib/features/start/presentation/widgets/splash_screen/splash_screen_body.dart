import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/start/presentation/widgets/splash_screen/splash_background_design.dart';
import 'package:bond/features/start/presentation/widgets/splash_screen/splash_top_logo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/deep_link/deep_link.dart';
import '../../../../settings/data/models/app_settings.dart';
import '../../../../settings/presentation/cubit/settings_cubit.dart';
import '../../cubit/start/start_cubit.dart';
import 'app_version_design.dart';
import 'bottom_logo_design.dart';
import 'center_logo_design.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, BaseState<AppSettings>>(
      builder: (context, state) {
        return BlocConsumer<StartCubit, BaseState<PageRouteInfo>>(
          listener: (context, state) {
            if (state.isSuccess && state.data != null) {
              init(route: state.data!, context: context);
            }
          },
          builder: (context, state) {
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                const SplashBackgroundDesign(),
                const SplashTopLogoDesign(),
                const CenterLogoDesign(),
                const AppVersionDesign(),
                const BottomLogoDesign(),
              ],
            );
          },
        );
      },
    );
  }

  void init({
    required PageRouteInfo route,
    required BuildContext context,
  }) async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      if (initialMessage.data.isNotEmpty) {}
    } else {
      await DynamicLinkHandler.instance.initialize(
        callback: (value) {
          Future.delayed(
            const Duration(milliseconds: 2000),
            () => context.router.pushAndPopUntil(
              route,
              predicate: (route) => false,
            ),
          );
        },
      );
    }
  }
}
