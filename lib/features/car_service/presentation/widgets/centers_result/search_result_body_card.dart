import 'package:bond/features/settings/contact_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../data/models/company_model.dart';
import '../../../data/models/service_center_model.dart';

class CarServiceBodyCard extends StatelessWidget {
  final ServiceCenterModel serviceCenterModel;
  final CompanyModel companyModel;

  const CarServiceBodyCard({
    super.key,
    required this.serviceCenterModel,
    required this.companyModel,
  });

  List<String> _getPhone() {
    if (serviceCenterModel.hotline != null &&
        serviceCenterModel.hotline!.isNotEmpty) {
      List<String> list = serviceCenterModel.hotline.toString().split("&");
      return list;
    }
    if (serviceCenterModel.phone != null &&
        serviceCenterModel.phone!.isNotEmpty) {
      List<String> list = serviceCenterModel.phone.toString().split("&");
      return list;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (serviceCenterModel.phone != null &&
                serviceCenterModel.phone!.isNotEmpty ||
            serviceCenterModel.hotline != null &&
                serviceCenterModel.hotline!.isNotEmpty) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(text: "${context.localizations.phoneNumber}: "),
              const SizedBox(width: 8),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final phone = _getPhone()[index];
                    return InkWell(
                      onTap: () => ContactHelper.contactUsWithPhoneNumber(
                        phoneNumber: phone,
                      ),
                      child: AppText(
                        color: context.colorScheme.primary,
                        textDecoration: TextDecoration.underline,
                        text: phone,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: _getPhone().length,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: "${context.localizations.address}: "),
            const SizedBox(width: 4),
            Expanded(
              child: AppText(
                text: serviceCenterModel.location ?? "",
                fontWeight: FontWeight.w500,
                maxLines: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.bodyHeight * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: "${context.localizations.area}: "),
            const SizedBox(width: 4),
            Expanded(
              child: AppText(
                text: serviceCenterModel.area ?? "",
                fontWeight: FontWeight.w600,
                maxLines: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.bodyHeight * .02),
        Row(
          children: [
            AppText(text: "${context.localizations.serviceCenters}: "),
            const SizedBox(width: 4),
            Expanded(
              child: AppText(
                text: "${serviceCenterModel.serviceCenterName}",
                fontWeight: FontWeight.bold,
                maxLines: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.bodyHeight * .02),
        CustomButton(
          height: 40,
          text: context.localizations.neededPaper,
          press: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Container(
                    height: SizeConfig.bodyHeight * .5,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .04,
                      vertical: SizeConfig.bodyHeight * .02,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.bodyHeight * .02),
                          AppText(
                            text: context.localizations.neededPaper,
                            fontWeight: FontWeight.bold,
                            textSize: 16,
                          ),
                          SizedBox(height: SizeConfig.bodyHeight * .02),
                          SizedBox(
                            width: double.infinity,
                            child: AppText(
                              fontWeight: FontWeight.w500,
                              textSize: 12,
                              textHeight: 1.8,
                              maxLines: 20,
                              text:
                                  companyModel.carReimbursementConditions ?? "",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: SizeConfig.bodyHeight * .02),
      ],
    );
  }
}
