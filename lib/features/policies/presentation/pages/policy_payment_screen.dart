import 'package:beymanger/config/dependencies/core_di.dart';
import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/presentation/cubit/policy_payment/policy_payment_bloc.dart';
import 'package:beymanger/features/policies/presentation/widgets/policy_payment/policy_payment_body.dart';
import 'package:beymanger/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final int policyId;

  const PaymentDetailsScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PolicyPaymentBloc>(),
      child: BlocConsumer<PolicyPaymentBloc, PolicyPaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(text: context.localizations.paymentDetails),
            body: Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.screenWidth * .04,
                  right: SizeConfig.screenWidth * .04,
                  left: SizeConfig.screenWidth * .04),
              child: PolicyPaymentBody(
                policyId: policyId,
              ),
            ),
          );
        },
      ),
    );
  }
}
