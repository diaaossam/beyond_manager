import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';

class InsuranceDesign extends StatelessWidget {
  const InsuranceDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*AppConstant.navigateTo(
        context: context,
        widget: const SelectInsuranceScreen(),
      );*/
      },
      child: Padding(
        padding: screenPadding(),
        child: Stack(
          children: [
            AppImage.asset(Assets.images.homeBackground.path),
            Row(
              children: [
                SizedBox(width: SizeConfig.screenWidth * .02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.bodyHeight * .05),
                    AppText(
                      text: context.localizations.beyondService,
                      fontWeight: FontWeight.bold,
                      textSize: 13,
                      maxLines: 2,
                      align: TextAlign.center,
                      color: Colors.white,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .015),
                    Container(
                      height: SizeConfig.bodyHeight * .05,
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * .06,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * .04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: AppText(
                          text: context.localizations.exploreNow,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
