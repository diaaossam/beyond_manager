import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../data/models/company_model.dart';
import '../../data/models/service_center_model.dart';
import '../widgets/centers_result/centers_result_body.dart';

@RoutePage()
class CarServiceResult extends StatelessWidget {
  final List<ServiceCenterModel> list;
  final CompanyModel companyModel;

  const CarServiceResult({
    super.key,
    required this.list,
    required this.companyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CentersResultBody(list: list, companyModel: companyModel),
    );
  }
}
