import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../network/presentation/widgets/search_result/search_result_ttf.dart';
import '../../../../network/presentation/widgets/sliver_app_bar.dart';
import '../../../data/models/company_model.dart';
import '../../../data/models/service_center_model.dart';
import 'center_service_result_list.dart';

class CentersResultBody extends StatefulWidget {
  final List<ServiceCenterModel> list;
  final CompanyModel companyModel;

  const CentersResultBody({
    super.key,
    required this.list,
    required this.companyModel,
  });

  @override
  State<CentersResultBody> createState() => _CentersResultBodyState();
}

class _CentersResultBodyState extends State<CentersResultBody> {
  List<ServiceCenterModel> list = [];

  @override
  void initState() {
    list = widget.list;
    super.initState();
  }

  void filterData(String query) {
    list = widget.list
        .where((value) => value.serviceCenterName
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(list);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverSearchAppBar(
          bottom: SearchResultTff(
            onChanged: (p0) {
              if (p0.isNotEmpty) {
                filterData(p0);
              } else {
                setState(() => list = widget.list);
              }
            },
          ),
        ),
      ],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: SizeConfig.bodyHeight * .023,
            ),
          ),
          CenterServiceList(
            list: list,
            companyModel: widget.companyModel,
          ),
        ],
      ),
    );
  }
}
