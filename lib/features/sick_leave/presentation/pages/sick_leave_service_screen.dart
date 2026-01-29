import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/features/sick_leave/presentation/pages/create_sick_leave_screen.dart';
import 'package:bond/features/sick_leave/presentation/pages/my_sick_leave_screen.dart';
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_analtyics.dart';
import 'package:bond/features/sick_leave/presentation/widgets/sick_leave_service_item.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SickLeaveServiceScreen extends StatelessWidget {
  final int policyId;

  const SickLeaveServiceScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.sickLeaveService1),
      body: CustomScrollView(
        slivers: [
          SickLeaveServiceItem(
            icon: Assets.icons.create,
            title: context.localizations.createNewRequestSickLeave,
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateSickLeaveScreen(policyId: policyId),
              ),
            ),
          ),
          SickLeaveServiceItem(
            icon: Assets.icons.myRequest,
            title: context.localizations.trackNewRequestSickLeave,
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MySickLeaveScreen(policyId: policyId),
              ),
            ),
          ),
          SickLeaveServiceItem(
            icon: Assets.icons.myRequest,
            title: context.localizations.companySickLeaveAna,
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SickLeaveAnalyticsScreen(policyId: policyId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
