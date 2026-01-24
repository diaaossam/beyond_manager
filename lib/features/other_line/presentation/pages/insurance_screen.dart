import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../data/models/template_model.dart';
import '../../insurance_helper.dart';
import '../cubit/insurance/insurance_cubit.dart';
import '../cubit/insurance/insurance_data.dart';

@RoutePage()
class InsuranceScreen extends StatelessWidget {
  final String title;
  final TemplateModel templateModel;

  final TextEditingController name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController note = TextEditingController();

  InsuranceScreen({
    super.key,
    required this.title,
    required this.templateModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InsuranceCubit>(),
      child: BlocConsumer<InsuranceCubit, BaseState<InsuranceData>>(
        listener: (context, state) {
          if (state.identifier == 'openExcel' && state.isSuccess) {
            if (state.data?.excelPath != null) {
              OpenFile.open(state.data!.excelPath!);
            }
          }

          // Handle openExcel failure
          if (state.identifier == 'openExcel' && state.isFailure) {
            AppConstant.showCustomSnakeBar(
              context,
              state.error?.toString() ?? 'Failed to download file',
              false,
            );
          }

          // Handle uploadInsurance success
          if (state.identifier == 'uploadInsurance' && state.isSuccess) {
            InsuranceHelper.showAlertDialog(
              context,
              context.localizations.requestDialog2Title,
              context.localizations.requestDialog2Body,
              false,
            );
          }

          // Handle uploadInsurance failure
          if (state.identifier == 'uploadInsurance' && state.isFailure) {
            AppConstant.showCustomSnakeBar(
              context,
              state.error?.toString() ?? 'Failed to upload insurance',
              false,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<InsuranceCubit>();
          final isUploading =
              state.identifier == 'uploadInsurance' &&
              state.status == BaseStatus.loading;
          final isDownloading =
              state.identifier == 'openExcel' &&
              state.status == BaseStatus.loading;

          return Scaffold(
            appBar: CustomAppBar(title: title),
            body: Form(
              key: formKey,
              child: AbsorbPointer(
                absorbing: isUploading,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .04),
                      AppText(text: "Name", fontWeight: FontWeight.bold),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      CustomTextFormField(
                        controller: name,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .06),
                      AppText(
                        text: context.localizations.notes,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      CustomTextFormField(
                        maxLines: 4,
                        controller: note,
                        hintText: context.localizations.notes1,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .04),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${context.localizations.optional} * ",
                              style: TextStyle(
                                color: context.colorScheme.error,
                                fontFamily: AppStrings.englishFont,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: context.localizations.notesDesc,
                              style: TextStyle(
                                fontFamily: AppStrings.englishFont,
                                color: context.colorScheme.onSurface,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .04),
                      isDownloading
                          ? const LoadingWidget()
                          : CustomButton(
                              text: context.localizations.downloadTemp,
                              press: () => cubit.openExcel(
                                url: templateModel.template ?? "",
                                fileName: templateModel.templateName ?? "",
                              ),
                            ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      CustomButton.outline(
                        text: "Upload File",
                        textColor: context.colorScheme.primary,
                        borderColor: context.colorScheme.primary,
                        iconData: Icons.upload,
                        iconColor: context.colorScheme.primary,
                        press: () => cubit.pickFile(),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      Visibility(
                        visible: cubit.listFiles.isNotEmpty,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.listFiles.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                          itemBuilder: (_, index) => Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: context.colorScheme.surfaceContainer,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText(
                                    text: cubit.listFiles[index].path
                                        .toString()
                                        .split("/")
                                        .last,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () => cubit.removeFileFromList(
                                    file: cubit.listFiles[index],
                                  ),
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: context.colorScheme.error,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: cubit.listFiles.isNotEmpty,
                        child: SizedBox(height: SizeConfig.bodyHeight * .02),
                      ),
                      isUploading
                          ? const LoadingWidget()
                          : CustomButton(
                              text: context.localizations.getAQuote,
                              press: () async {
                                if (formKey.currentState!.validate()) {
                                  String type = '';
                                  if (templateModel.title == "motor") {
                                    type = "motor";
                                  } else if (templateModel.title == "medical") {
                                    type = "individual_and_family";
                                  } else if (templateModel.title ==
                                      "property") {
                                    type = "property";
                                  } else if (templateModel.title == "life") {
                                    type = "life";
                                  }
                                  if (cubit.listFiles.isEmpty) {
                                    AppConstant.showCustomSnakeBar(
                                      context,
                                      "Please upload file first",
                                      false,
                                    );
                                    return;
                                  }
                                  cubit.uploadInsurance(
                                    type: type,
                                    note: note.text,
                                    username: name.text,
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
