import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/widgets/app_failure.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/custom_divider_design.dart';
import '../../../../../widgets/custom_expanded_tile_design.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../cubit/policy_payment/policy_payment_bloc.dart';
import '../../../data/models/policy_payment.dart';
import 'custom_payment_details_body.dart';
import 'custom_payment_details_header.dart';

class PolicyPaymentBody extends StatefulWidget {
  final int policyId;

  const PolicyPaymentBody({super.key, required this.policyId});

  @override
  State<PolicyPaymentBody> createState() => _PolicyPaymentBodyState();
}

class _PolicyPaymentBodyState extends State<PolicyPaymentBody> {
  @override
  void initState() {
    super.initState();
    context.read<PolicyPaymentCubit>().initPayment(policyId: widget.policyId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolicyPaymentCubit, BaseState<MainPolicyPayment>>(
      builder: (context, state) {
        final cubit = context.read<PolicyPaymentCubit>();

        return RefreshIndicator(
          onRefresh: () async => cubit.pagingController.refresh(),
          child: CustomScrollView(
            slivers: [
              PagingListener<int, PolicyPayment>(
                controller: cubit.pagingController,
                builder: (context, pagingState, fetchNextPage) {
                  return PagedSliverList<int, PolicyPayment>(
                    state: pagingState,
                    fetchNextPage: fetchNextPage,
                    addAutomaticKeepAlives: true,
                    builderDelegate: PagedChildBuilderDelegate<PolicyPayment>(
                      firstPageProgressIndicatorBuilder: (context) =>
                          const LoadingWidget(),
                      firstPageErrorIndicatorBuilder: (context) =>
                          const AppFailureWidget(),
                      noItemsFoundIndicatorBuilder: (context) =>
                          const EmptyWidgetDesign(),
                      itemBuilder: (context, item, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.bodyHeight * .005,
                        ),
                        child:CustomExpandedTile(
                          title: CustomPaymentHeaderExpanded(
                            result: item,
                          ),
                          body: CustomPaymentBody(
                            result: item,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

