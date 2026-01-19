import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../cubit/terms_cubit.dart';

@RoutePage()
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TermsCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.termsAndConditions),
        body: BlocBuilder<TermsCubit, BaseState<String>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingWidget();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: screenPadding(),
                      child: AppText(
                        text: state.data ?? "",
                        textSize: 15,
                        maxLines: 2000,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
