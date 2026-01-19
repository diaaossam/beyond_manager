import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/features/auth/data/models/request/login_params.dart';
import 'package:bond/features/auth/presentation/cubit/login_cubit/login_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/phone_text_form_field.dart';
import '../../cubit/login_cubit/login_cubit.dart';

class LoginButtonDesign extends StatefulWidget {
  const LoginButtonDesign({super.key});

  @override
  State<LoginButtonDesign> createState() => _LoginButtonDesignState();
}

class _LoginButtonDesignState extends State<LoginButtonDesign> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, BaseState<LoginData>>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.router.pushAndPopUntil(
            OtpLoginRoute(phone: _formKey.fieldValue("phone")),
            predicate: (route) => false,
          );
        }
      },
      builder: (context, state) {
        return FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              MobileNumberField(),
              SizedBox(height: SizeConfig.bodyHeight * .17),
              CustomButton(
                text: context.localizations.login,
                isLoading: state.isLoading,
                press: () {
                  if (!_formKey.currentState!.saveAndValidate()) {
                    return;
                  }
                  context.read<LoginCubit>().login(
                    loginParams: LoginParams(
                      phone: _formKey.fieldValue("phone"),
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
