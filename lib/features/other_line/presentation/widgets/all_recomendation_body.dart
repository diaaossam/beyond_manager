import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/other_line/presentation/cubit/all_recomended/recommendation_data.dart';
import 'package:bond/features/other_line/presentation/cubit/all_recomended/recommended_cubit.dart';
import 'package:bond/features/other_line/presentation/widgets/recommendation_card_item.dart';
import 'package:bond/features/other_line/presentation/widgets/success_create_crm_dialog.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/enum/recommendation_status.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/chips_choice_widget.dart';
import '../../../../widgets/main_widget/app_text.dart';

class AllRecommendationBody extends StatefulWidget {
  const AllRecommendationBody({super.key});

  @override
  State<AllRecommendationBody> createState() => _AllRecommendationBodyState();
}

class _AllRecommendationBodyState extends State<AllRecommendationBody> {
  MatchLevelEnum selectedMatchLevel = MatchLevelEnum.all;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendedCubit, BaseState<RecommendationData>>(
      listener: (context, state) {
        if(state.isSuccess &&state.identifier == "createCrmLead"){
          SuccessCreateCrmDialog.show(context, product: state.data!.crmLeadResponse!);
        }
      },
      builder: (context, state) {
        return state.builder(
          onTapRetry: () {},
          onSuccess: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .1),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: context.colorScheme.primaryContainer
                                    .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.shield_outlined,
                                size: 28,
                                color: context.colorScheme.primary,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: context.localizations.yourIndustry,
                                    textSize: 10,
                                    color: context.colorScheme.shadow,
                                  ),
                                  5.verticalSpace,
                                  AppText(
                                    text: data.recommendedMainModel!.industry!.name,
                                    textSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: context.colorScheme.onSurface,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * .02),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .1),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: context.colorScheme.primaryContainer
                                    .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: AppImage.asset(
                                Assets.icons.insurance,
                                size: 20.h,
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text:
                                        context.localizations.productsAvailable,
                                    textSize: 10,
                                    color: context.colorScheme.shadow,
                                  ),
                                  5.verticalSpace,
                                  AppText(
                                    text: data.recommendedMainModel!.totalCount.toString(),
                                    textSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: context.colorScheme.onSurface,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.shadow.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _legendItem(
                            context,
                            context.colorScheme.primary,
                            context.localizations.highMatch70,
                          ),
                          _legendItem(
                            context,
                            context.colorScheme.tertiary,
                            context.localizations.mediumMatch40,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      _legendItem(
                        context,
                        context.colorScheme.shadow,
                        context.localizations.lowMatchBelow40,
                      ),
                    ],
                  ),
                ),
                ChipsChoiceWidget<MatchLevelEnum>(
                  items: MatchLevelEnum.values,
                  labelBuilder: (MatchLevelEnum item) => item.name,
                  onSelected: (MatchLevelEnum value) {
                    setState(() => selectedMatchLevel = value);
                    context.read<RecommendedCubit>().getAllRecommended(
                      matchLevelEnum: value,
                    );
                  },
                  selectedItem: selectedMatchLevel,
                ),
                SizedBox(height: SizeConfig.bodyHeight * .02),
                Expanded(
                  child: ListView.builder(
                    itemCount: (data.recommendedMainModel!.recommendations??[]).length,
                    itemBuilder: (context, index) {
                      final item = (data.recommendedMainModel!.recommendations ?? [])[index];
                      return RecommendationCardItem(
                      model: item,
                      onGetQuote: () => context.read<RecommendedCubit>().createCrmLead(id: item.id??0),
                    );
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.bodyHeight * .03),
              ],
            );
          },
        );
      },
    );
  }

  Widget _legendItem(BuildContext context, Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: SizeConfig.screenWidth * .02),
        AppText(
          text: label,
          textSize: 11,
          color: context.colorScheme.onSurface,
        ),
      ],
    );
  }
}
