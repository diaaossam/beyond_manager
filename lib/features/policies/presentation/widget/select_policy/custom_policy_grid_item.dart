import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class CustomPolicyGridItem extends StatelessWidget {
  final PoliciesDataModel result;
  final Function(PoliciesDataModel) onItemTap;
  final bool isSelected;
  final bool showCheckbox;

  const CustomPolicyGridItem({
    super.key,
    required this.result,
    required this.onItemTap,
    this.isSelected = false,
    this.showCheckbox = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemTap.call(result),
      child: FadeInLeft(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
            vertical: SizeConfig.bodyHeight * .02,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colorScheme.primary.withValues(alpha: 0.1)
                : context.colorScheme.secondary,
            border: Border.all(
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.outline,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (showCheckbox)
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? context.colorScheme.primary
                              : context.colorScheme.outline,
                          width: 2,
                        ),
                        color: isSelected
                            ? context.colorScheme.primary
                            : Colors.transparent,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  Expanded(
                    child: AppText(
                      text: result.policyNumber ?? "",
                      textSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              AppText(
                text: result.lineOfBusiness ?? "",
                textSize: 11,
                fontWeight: FontWeight.w500,
                color: context.colorScheme.shadow,
                maxLines: 1,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              Row(
                children: [
                  Icon(
                    result.eCards == true
                        ? Icons.phone_android_sharp
                        : Icons.credit_card,
                    size: 18,
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: result.eCards == true
                        ? context.localizations.eCard
                        : context.localizations.physicalCard,
                    color: context.colorScheme.shadow,
                    textSize: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
