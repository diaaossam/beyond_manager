import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../settings/contact_helper.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import '../../data/models/template_model.dart';
import '../cubit/other_line_cubit.dart';
import '../cubit/other_line_state.dart';
import '../widgets/recommendation_banner_design.dart';

@RoutePage()
class OtherLineScreen extends StatelessWidget {
  const OtherLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OtherLineCubit>()
        ..getOtherLineTemplates()
        ..getTopRecommendation(),
      child: BlocBuilder<OtherLineCubit, BaseState<OtherLineStateData>>(
        builder: (context, state) {
          final cubit = context.read<OtherLineCubit>();
          final templates = state.data?.templates ?? [];
          return Scaffold(
            appBar: CustomAppBar(title: context.localizations.insuranceOptions),
            body: state.builder(
              onTapRetry: () async {
                cubit.getOtherLineTemplates();
                cubit.getTopRecommendation();
              },
              onSuccess: (data) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                  ),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: context.localizations.stay,
                            textSize: 16,
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .01),
                          AppText(
                            text: "100%",
                            textSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.primary,
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .01),
                          AppText(
                            text: context.localizations.insured,
                            fontWeight: FontWeight.bold,
                            textSize: 16,
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .02),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.colorScheme.primaryContainer,
                            ),
                            child: AppImage.asset(Assets.icons.checkmark),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .1,
                        ),
                        child: AppText(
                          align: TextAlign.center,
                          maxLines: 5,
                          fontWeight: FontWeight.w600,
                          text: context.localizations.insuranceOptionsText1,
                        ),
                      ),
                      if(data.recommendedModel != null)...[
                        SizedBox(height: SizeConfig.bodyHeight * .02),
                        RecommendationBannerDesign(model: data.recommendedModel!,),
                      ],
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      Row(
                        children: [
                          Stack(
                            children: [
                              AppImage.asset(Assets.icons.backgroundOther),
                              AppImage.asset(Assets.icons.offer1),
                            ],
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .03),
                          Expanded(
                            child: AppText(
                              text: context.localizations.offers1,
                              textSize: 12,
                              maxLines: 8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      Row(
                        children: [
                          Stack(
                            children: [
                              AppImage.asset(Assets.icons.backgroundOther),
                              AppImage.asset(Assets.icons.service),
                            ],
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .03),
                          AppText(
                            text: context.localizations.service1,
                            textSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              AppImage.asset(Assets.icons.backgroundOther),
                              AppImage.asset(Assets.icons.support),
                            ],
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .03),
                          AppText(
                            text: context.localizations.support1,
                            textSize: 12,
                          ),
                          const Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              AppImage.asset(Assets.icons.backgroundOther),
                              AppImage.asset(Assets.icons.stars),
                            ],
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .03),
                          AppText(
                            text: context.localizations.stars1,
                            textSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      Center(
                        child: AppText(
                          text: context.localizations.availableLines,
                          fontWeight: FontWeight.w600,
                          textSize: 16,
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      if (templates.length >= 4)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLineItem(
                                  context,
                                  icon: Assets.icons.otherLine1,
                                  title: context.localizations.otherLine1,
                                  template: templates[0],
                                  screenTitle:
                                      context.localizations.otherLine11,
                                  height: SizeConfig.bodyHeight * .07,
                                ),
                                SizedBox(height: SizeConfig.bodyHeight * .03),
                                _buildLineItem(
                                  context,
                                  icon: Assets.icons.otherLine3,
                                  title: context.localizations.otherLine3,
                                  template: templates[2],
                                  screenTitle:
                                      context.localizations.otherLine33,
                                  height: SizeConfig.bodyHeight * .06,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildLineItem(
                                  context,
                                  icon: Assets.icons.otherLine2,
                                  title: context.localizations.otherLine2,
                                  template: templates[1],
                                  screenTitle:
                                      context.localizations.otherLine22,
                                  height: SizeConfig.bodyHeight * .065,
                                ),
                                SizedBox(height: SizeConfig.bodyHeight * .03),
                                _buildLineItem(
                                  context,
                                  icon: Assets.icons.otherLine4,
                                  title: context.localizations.otherLine4,
                                  template: templates[3],
                                  screenTitle:
                                      context.localizations.otherLine44,
                                  height: SizeConfig.bodyHeight * .07,
                                ),
                              ],
                            ),
                          ],
                        ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      _buildWhatsAppContact(context),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLineItem(
    BuildContext context, {
    required String icon,
    required String title,
    required TemplateModel template,
    required String screenTitle,
    required double height,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppImage.asset(icon, height: height),
        SizedBox(width: SizeConfig.screenWidth * .03),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: title, textSize: 11),
            const SizedBox(height: 4),
            InkWell(
              onTap: () => context.router.push(
                InsuranceRoute(templateModel: template, title: screenTitle),
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    AppText(
                      text: context.localizations.getAQuote,
                      textSize: 12,
                    ),
                    const SizedBox(width: 3),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: context.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWhatsAppContact(BuildContext context) {
    return BlocBuilder<SettingsCubit, BaseState>(
      builder: (context, state) {
        final phoneNumber = state.data?.sickLeave ?? "";
        return InkWell(
          onTap: () =>
              ContactHelper.contactUsWithWhatsApp(phoneNumber: phoneNumber),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .02,
              vertical: SizeConfig.bodyHeight * .02,
            ),
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.bodyHeight * .015,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              border: Border.all(color: context.colorScheme.outline),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.primaryContainer,
                  ),
                  child: AppImage.asset(Assets.icons.whats),
                ),
                SizedBox(width: SizeConfig.screenWidth * .02),
                Expanded(
                  child: AppText(
                    text: "${context.localizations.whats1}\n$phoneNumber",
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: context.colorScheme.primary,
                ),
                SizedBox(width: SizeConfig.screenWidth * .02),
              ],
            ),
          ),
        );
      },
    );
  }
}
