import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/service_center_model.dart';

class CarServiceTitleCard extends StatelessWidget {
  final ServiceCenterModel serviceCenterModel;

  const CarServiceTitleCard({super.key, required this.serviceCenterModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.bodyHeight * .015),
        AppText(
          text: serviceCenterModel.serviceCenterName ?? "",
          color: context.colorScheme.primary,
          fontWeight: FontWeight.bold,
          textSize: 12 ,
        ),
        SizedBox(height: SizeConfig.bodyHeight * .015),
        Row(
          children: [
            AppText(text: "${context.localizations.city}: "),
            Expanded(
              child: AppText(
                text: serviceCenterModel.city ?? "",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.bodyHeight * .015),
      ],
    );
  }
}
