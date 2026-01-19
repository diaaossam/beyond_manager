import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../cubit/request_demo/request_demo_cubit.dart';
import '../../../data/models/request/request_demo_params.dart';
import 'already_have_account.dart';
import 'terms_widget.dart';

class RequestDemoBodyBody extends StatefulWidget {
  const RequestDemoBodyBody({super.key});

  @override
  State<RequestDemoBodyBody> createState() => _RequestDemoBodyBodyState();
}

class _RequestDemoBodyBodyState extends State<RequestDemoBodyBody> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _isTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: screenPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .04),
              Center(
                child: AppText(
                  text: context.localizations.requestDemo,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                  textSize: 24,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomTextFormField(
                name: "name",
                hintText: context.localizations.fullName,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                name: "email",
                hintText: context.localizations.emailAddress,
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: context.localizations.validation,
                  ),
                  FormBuilderValidators.email(
                    errorText: context.localizations.invalidEmail,
                  ),
                ]),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                name: "phone",
                hintText: context.localizations.phoneNumber,
                keyboardType: TextInputType.phone,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                name: "job",
                hintText: context.localizations.jobTitle,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                name: "companyName",
                hintText: context.localizations.companyName,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                name: "companySize",
                keyboardType: TextInputType.number,
                hintText: context.localizations.companySize,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              TermsRegisterWidget(
                onChanged: (value) {
                  setState(() => _isTermsChecked = value);
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              BlocConsumer<RequestDemoCubit, BaseState<String>>(
                listener: (context, state) {
                  if(state.isSuccess){
                      Navigator.pop(context);
                      AppConstant.showCustomSnakeBar(context, state.data??"", true);

                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isActive: _isTermsChecked,
                    isLoading: state.isLoading,
                    text: context.localizations.requestDemo,
                    press: () async {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        final formData = _formKey.currentState!.value;
                        context.read<RequestDemoCubit>().requestDemo(
                          params: RequestDemoParams(
                            email: formData['email'] ?? '',
                            name: formData['name'] ?? '',
                            job: formData['job'] ?? '',
                            phone: formData['phone'] ?? '',
                            companyName: formData['companyName'] ?? '',
                            companySize: formData['companySize'] ?? '',
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              const AlreadyHaveAccountWidget(),
              SizedBox(height: SizeConfig.bodyHeight * .04),
            ],
          ),
        ),
      ),
    );
  }
}
