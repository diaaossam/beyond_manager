import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../data/models/request/ticket_params.dart';
import '../cubit/tickets/tickets_model_cubit.dart';
import '../widgets/addition_deletion_requests/view_requests_body.dart';

@RoutePage()
class ViewTrackRequestsScreen extends StatelessWidget {
  const ViewTrackRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TicketsAdditionCubit>()..fetchTicketList(ticketParams: TicketParams()),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.viewTrackRequests),
        body: ViewRequestsBody(),
      ),
    );
  }

}
