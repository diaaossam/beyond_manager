import 'package:auto_route/auto_route.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_size.dart';
import '../widgets/home_grid_deisgn.dart';
import '../widgets/insurance_design.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AppImage.asset(Assets.images.beyondManagerLogo1.path, height: SizeConfig.bodyHeight * .1),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              const InsuranceDesign(),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              const HomeGridDesign(),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              SizedBox(height: SizeConfig.screenWidth * .04),
              SvgPicture.asset(Assets.icons.beyondCopyright),
            ],
          ),
        ),
      ),
    );
  }
}
