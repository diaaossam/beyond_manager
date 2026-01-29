import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../cubit/create_sick_leave/create_sick_leave_cubit.dart';
import '../widgets/sick_leave/sick_leave_body.dart';

@RoutePage()
class CreateSickLeaveScreen extends StatelessWidget {
  final int policyId;

  const CreateSickLeaveScreen({super.key, required this.policyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateSickLeaveCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.createNewRequest,
          actions: [
            BlocBuilder<CreateSickLeaveCubit, BaseState<String>>(
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    // TODO: Implement excel export if needed
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .04,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: AppImage.asset(Assets.icons.excel),
                        ),
                        AppImage.asset(Assets.icons.downloadExcel),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: SickLeaveBody(policyId: policyId),
      ),
    );
  }
}
