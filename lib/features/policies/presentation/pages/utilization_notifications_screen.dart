import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/utilization/utilization_notification_cubit.dart';
import '../widget/utilization/request_deep_dive_dialog.dart';
import '../widget/utilization/utilization_notifications_body.dart';

@RoutePage()
class UtilizationNotificationsScreen extends StatefulWidget {
  final int policyId;

  const UtilizationNotificationsScreen({super.key, required this.policyId});

  @override
  State<UtilizationNotificationsScreen> createState() =>
      _UtilizationNotificationsScreenState();
}

class _UtilizationNotificationsScreenState extends State<UtilizationNotificationsScreen> {
  int _selectedTabIndex = 0;

  void _onTabIndexChanged(int index) {
    setState(() => _selectedTabIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UtilizationNotificationCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.utilizationNotifications,
        ),
        body: UtilizationNotificationsBody(
          policyId: widget.policyId,
          onTabIndexChanged: _onTabIndexChanged,
          selectedTabIndex: _selectedTabIndex,
        ),
        floatingActionButton: _selectedTabIndex == 1
            ? FloatingActionButton.extended(
                onPressed: () {
                  RequestDeepDiveDialog.show(context, widget.policyId);
                },
                icon: const Icon(Icons.add),
                label: Text(
                  context.localizations.requestNewDeepDiveStudy,
                ),
              )
            : null,
      ),
    );
  }
}
