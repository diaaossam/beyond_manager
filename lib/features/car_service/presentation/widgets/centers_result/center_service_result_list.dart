import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/custom_expanded_tile_design.dart';
import '../../../data/models/company_model.dart';
import '../../../data/models/service_center_model.dart';
import 'search_result_body_card.dart';
import 'search_result_title_card.dart';

class CenterServiceList extends StatelessWidget {
  final List<ServiceCenterModel> list;
  final CompanyModel companyModel;

  const CenterServiceList({
    super.key,
    required this.list,
    required this.companyModel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: screenPadding(),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: SizeConfig.bodyHeight * .01,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return CustomExpandedTile(
            title: CarServiceTitleCard(
              serviceCenterModel: item,
            ),
            body: CarServiceBodyCard(
              serviceCenterModel: item,
              companyModel: companyModel,
            ),
          );
        },
      ),
    );
  }
}
