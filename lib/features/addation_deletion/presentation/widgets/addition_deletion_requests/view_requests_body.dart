import 'dart:async';

import 'package:bond/features/addation_deletion/presentation/widgets/addition_deletion_requests/request_card.dart';
import 'package:bond/features/addation_deletion/presentation/widgets/addition_deletion_requests/summary_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/custom_search_text_form_field.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/request/ticket_params.dart';
import '../../../data/models/response/addition_deletion_ticket.dart';
import '../../cubit/tickets/tickets_model_cubit.dart';

class ViewRequestsBody extends StatefulWidget {
  const ViewRequestsBody({super.key});

  @override
  State<ViewRequestsBody> createState() => _ViewRequestsBodyState();
}

class _ViewRequestsBodyState extends State<ViewRequestsBody> {
  Timer? _debounce;
  TicketParams params = TicketParams();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TicketsAdditionCubit,
          BaseState<AdditionDeletionTicket>>(
        builder: (context, state) {
          final cubit = context.read<TicketsAdditionCubit>();
          final data = state.data;
          return SingleChildScrollView(
            child: Padding(
              padding: screenPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  AppText.body(
                    text: context.localizations.viewRequestsBody,
                    textSize: 12,
                    color: context.colorScheme.shadow,
                    maxLines: 2,
                    align: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  SummaryCards(additionDeletionTicket: data ?? AdditionDeletionTicket(),),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  Row(
                    children: [
                      AppImage.asset(Assets.icons.search),
                      SizedBox(width: SizeConfig.screenWidth * .015),
                      AppText(
                        text: context.localizations.search,
                        textSize: 13,
                      ),
                      Spacer(),
                      AppText(
                        text: "${data?.returnedTicketsCount ?? 0} ${context
                            .localizations.requests}",
                        color: context.colorScheme.shadow,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .01),
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchTextFormField(
                          hintText: context.localizations.stage,
                          onChange: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce = Timer(
                              const Duration(milliseconds: 300),
                                  () {
                                params = params.copyWith(
                                  stage: value.toString(),
                                );
                                cubit.fetchTicketList(ticketParams: params);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: SizeConfig.bodyHeight * .01),
                      Expanded(
                        child: CustomSearchTextFormField(
                          hintText: context.localizations.name,
                          onChange: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce = Timer(
                              const Duration(milliseconds: 300),
                                  () {
                                params = params.copyWith(
                                  memberName: value.toString(),
                                );
                                cubit.fetchTicketList(ticketParams: params);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: SizeConfig.bodyHeight * .01),
                      Expanded(
                        child: CustomSearchTextFormField(
                          hintText: context.localizations.staffId,
                          onChange: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce = Timer(
                              const Duration(milliseconds: 300),
                                  () {
                                params = params.copyWith(
                                  staffid: value.toString(),
                                );
                                cubit.fetchTicketList(ticketParams: params);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  _buildRequestCardsList(context, data),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRequestCardsList(
    BuildContext context,
    AdditionDeletionTicket? data,
  ) {
    final tickets = data?.result ?? [];

    if (tickets.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .05),
        child: AppText(
          text: context.localizations.noRequestsFound,
          textSize: 14,
          color: context.colorScheme.shadow,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: tickets.map((ticket) {
        final stage = (ticket.stage ?? '').toLowerCase().replaceAll(' ', '_');
        final isWaitingHr = stage == 'waiting_hr';
        return RequestCard(
          ticket: ticket,
          actionRequiredReason: isWaitingHr
              ? context.localizations.missingIbanReason
              : null,
          actionRequiredWhatToDo: isWaitingHr
              ? context.localizations.missingIbanWhatToDo
              : null,
          onDownloadReport: () {

          },
          onContactSupport: () {
            // TODO: Contact support
          },
        );
      }).toList(),
    );
  }
}
