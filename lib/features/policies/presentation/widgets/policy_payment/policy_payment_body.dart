import 'package:beymanger/features/policies/data/models/policy_payment.dart';
import 'package:beymanger/features/policies/domain/entities/get_active_list_params.dart';
import 'package:beymanger/features/policies/presentation/cubit/policy_payment/policy_payment_bloc.dart';
import 'package:beymanger/features/policies/presentation/widgets/policy_payment/custom_payment_details_body.dart';
import 'package:beymanger/features/policies/presentation/widgets/policy_payment/custom_payment_details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../network/presentation/widgets/filter_expanded/custom_expanded_widget.dart';

class PolicyPaymentBody extends StatefulWidget {
  final int policyId;

  const PolicyPaymentBody({super.key, required this.policyId});

  @override
  State<PolicyPaymentBody> createState() => _PolicyPaymentBodyState();
}

class _PolicyPaymentBodyState extends State<PolicyPaymentBody> {
  @override
  void initState() {
    final bloc = context.read<PolicyPaymentBloc>();
    bloc.pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 0) {
        pageKey = 1;
      }
      bloc.fetchPage(
          getActiveListParams: GetActiveListParams(
              pageSize: pageSize, policyId: widget.policyId, pageKey: pageKey));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView(
        pagingController: context.read<PolicyPaymentBloc>().pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, PolicyPayment item, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: CustomExpandedWidget(
              title: CustomPaymentHeaderExpanded(result: item),
              body: CustomPaymentBody(result: item),
            ),
          ),
        ));
  }
}
