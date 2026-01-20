import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/policy_payment/policy_payment_bloc.dart';
import '../widget/policy_payment/policy_payment_body.dart';

@RoutePage()
class PolicyPaymentScreen extends StatelessWidget {
  final int policyId;

  const PolicyPaymentScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PolicyPaymentCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.paymentDetails),
        body: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.screenWidth * .04,
            right: SizeConfig.screenWidth * .04,
            left: SizeConfig.screenWidth * .04,
          ),
          child: PolicyPaymentBody(policyId: policyId),
        ),
      ),
    );
  }
}
