import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/search/search_body.dart';

@RoutePage()
class MedicalFilterScreen extends StatelessWidget {
  const MedicalFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title:context.localizations.medicalNetwork),
      body: SearchBody(),
    );
  }
}
