import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';

class SplashTopLogoDesign extends StatelessWidget {
  const SplashTopLogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.bodyHeight * .5,
      width: SizeConfig.screenWidth * .7,
      child: Image.asset(Assets.gif.logo.path),
    );
  }
}
