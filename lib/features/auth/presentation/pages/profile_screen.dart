import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../settings/presentation/widgets/dialogs/logout_dialog.dart';
import '../widgets/profile/company_drop_down.dart';
import '../widgets/profile/profile_item_design.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.profile,),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .04,
        ),
        child: ListView(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .04),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.bodyHeight * .04,
                horizontal: SizeConfig.bodyHeight * .02,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFEFAF8),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffE7E7E7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    maxLines: 2,
                    text: UserDataService().getUserData()?.name??"",
                    fontWeight: FontWeight.bold,
                    textSize: 14,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  const CompanyDropDown(),
                  SizedBox(height: SizeConfig.bodyHeight * .005),
                  AppText(
                    maxLines: 2,
                    text: UserDataService().getUserData()?.jobDescription ?? "",
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffEC5800),
                    textSize: 17,
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: AppText(
                maxLines: 2,
                text: context.localizations.information,
                fontWeight: FontWeight.w600,
                textSize: 15,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              children: [
                const Spacer(),
                ProfileItemDesign(
                  title: "workEmail",
                  body: UserDataService().getUserData()?.email ?? "",
                  icon: Assets.icons.email,
                ),
                const Spacer(),
                Container(
                  width: 2,
                  height: SizeConfig.bodyHeight * 0.12,
                  color: context.colorScheme.primary,
                ),
                const Spacer(),
                ProfileItemDesign(
                  title: context.localizations.phoneNumber,
                  body: UserDataService().getUserData()?.phone ?? "",
                  icon: Assets.icons.phone,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .06),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  AppText(
                    text: context.localizations.notes,
                    textSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  const AppText(text: "", maxLines: 10, textSize: 12),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
            CustomButton(
              text: context.localizations.logOut,
              press: () async {
                LogoutDialog.show(context);
              },
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomButton(
            borderColor: context.colorScheme.primary,
            backgroundColor: Colors.transparent,
            textColor: context.colorScheme.primary,
            text: context.localizations.complaint,
            press: () => context.router.push(ComplaintRoute()),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          TextButton(
            onPressed: () => context.router.push(TermsRoute()),
            child: AppText(
              maxLines: 2,
              text: context.localizations.termsAndConditions,
              color: context.colorScheme.primary,
              textDecoration: TextDecoration.underline,
              textSize: 14,
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomButton(
            borderColor: Colors.red,
            backgroundColor: Colors.red,
            text: context.localizations.deleteAccount,
            press: () async {

            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
           Center(
            child: AppText(
              text: "${context.localizations.appVersion} ${ApiConfig.appVersion}",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          ],
        ),
      ),
    );
  }
}
