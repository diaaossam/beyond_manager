import 'package:auto_route/auto_route.dart';
import 'package:bond/core/tutorial_coach/tutorial_couch.dart';
import 'package:bond/core/tutorial_coach/tutorial_enum.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_size.dart';
import '../widgets/home_grid_deisgn.dart';
import '../widgets/insurance_design.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tutorial keys for each grid item
  final Map<TutorialKeys, GlobalKey> _tutorialKeys = {
    TutorialKeys.emergencySupport: GlobalKey(),
    TutorialKeys.insurancePolicies: GlobalKey(),
    TutorialKeys.sickLeave: GlobalKey(),
    TutorialKeys.getCovered: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    // Show tutorial after first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTutorial();
    });
  }

  Future<void> _showTutorial() async {
    if (!mounted) return;
    
    await TutorialManagement.showHomeTutorial(
      context: context,
      globalKeys: _tutorialKeys,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AppImage.asset(
                Assets.images.beyondManagerLogo1.path,
                height: SizeConfig.bodyHeight * .1,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              const InsuranceDesign(),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              HomeGridDesign(tutorialKeys: _tutorialKeys),
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
