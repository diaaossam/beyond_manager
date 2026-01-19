import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/emergency/data/models/emergency_params.dart';
import 'package:bond/features/emergency/presentation/cubit/create_emergency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../../settings/presentation/settings_helper.dart';
import '../../../../settings/presentation/widgets/contact_with_us_whats_app.dart';
import 'emergency_header_design.dart';
import 'emergency_header_text.dart';

class CreateEmergenceBody extends StatefulWidget {
  const CreateEmergenceBody({super.key});

  @override
  State<CreateEmergenceBody> createState() => _CreateEmergenceBodyState();
}

class _CreateEmergenceBodyState extends State<CreateEmergenceBody> {
  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: SizeConfig.bodyHeight * .02),
        const CreateEmergencyHeaderDesign(),
        SizedBox(height: SizeConfig.bodyHeight * .04),
        const CreateEmergencyHeaderText(),
        SizedBox(height: SizeConfig.bodyHeight * .04),
        Center(
          child: AppText(
            color: context.colorScheme.scrim,
            text: context.localizations.emergencySupport4,
          ),
        ),
        SizedBox(height: SizeConfig.bodyHeight * .04),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                maxLines: 6,
                controller: note,
                hintText: context.localizations.notes,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .08),
              BlocConsumer<CreateEmergencyCubit, BaseState<String>>(
                listener: (context, state) {
                  if(state.isSuccess){
                    note.clear();
                    SettingsHelper.showAlertDialog(
                      context: context,
                      title: context.localizations.sentSuccess,
                      body: context.localizations.success,
                    );
                  }

                },
                builder: (context, state) {
                  return CustomButton(
                    text: context.localizations.submit,
                    isLoading: state.isLoading,
                    press: () {
                      context
                          .read<CreateEmergencyCubit>()
                          .createEmergencyRequest(
                            params: EmergencyParams(note: note.text),
                          );
                    },
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              const ContactUsWithUsWhatsAppWidget(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }
}
