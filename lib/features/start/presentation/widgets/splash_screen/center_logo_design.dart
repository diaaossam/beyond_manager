import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_size.dart';

class CenterLogoDesign extends StatelessWidget {
  const CenterLogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: SizeConfig.bodyHeight * .5,
        width: SizeConfig.screenWidth * .7,
        child: SvgPicture.asset(Assets.icons.splash2),
      ),
    );
  }
}
