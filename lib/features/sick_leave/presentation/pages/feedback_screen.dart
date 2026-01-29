import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/status_enum.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/features/sick_leave/presentation/cubit/feedback/feedback_cubit.dart';
import 'package:bond/features/sick_leave/presentation/widgets/feed_back_attachment.dart';
import 'package:bond/widgets/custom_search_text_form_field.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({
    super.key,
    required this.myRequestsModel,
  });

  final MySickLeave myRequestsModel;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FeedbackCubit>(),
      child: BlocConsumer<FeedbackCubit, BaseState<Map<String, dynamic>>>(
        listener: (context, state) {
          // Handle loading
          if (state.isLoading) {
            setState(() => _isLoading = true);
          } else {
            setState(() => _isLoading = false);
          }

          // Handle success
          if (state.isSuccess) {
            final data = state.data;
            if (data != null) {
              if (state.identifier == 'update_attachment') {
                if (data['id'] != null) {
                  if (widget.myRequestsModel.clientAttachments != null) {
                    if (widget.myRequestsModel.clientAttachments!.isNotEmpty) {
                      widget.myRequestsModel.clientAttachments!.removeWhere(
                          (element) =>
                              element.id!.toInt() == data['id']!.toInt());
                      AppConstant.showToast(
                        color: context.colorScheme.tertiary,
                        msg: 'Attachment updated successfully',
                        gravity: ToastGravity.TOP,
                      );
                    }
                  }
                } else {
                  widget.myRequestsModel.clientAttachments
                      ?.add(ClientAttachments(
                    url: "",
                    fileName: data['file_name'],
                    id: data['attachment_id'],
                  ));
                  AppConstant.showToast(
                    color: context.colorScheme.tertiary,
                    msg: 'Attachment added successfully',
                    gravity: ToastGravity.TOP,
                  );
                }
              }
            }
          }
        },
        builder: (context, state) {
          final cubit = context.read<FeedbackCubit>();
          return Scaffold(
            appBar: CustomAppBar(title: context.localizations.feedback),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .04),
              child: ListView(
                children: [
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.bodyHeight * .009,
                            horizontal: SizeConfig.screenWidth * .03),
                        decoration: BoxDecoration(
                          color: _getColor(widget.myRequestsModel.state),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: widget.myRequestsModel.state!.name,
                              textSize: 12,
                              fontWeight: FontWeight.w500,
                              color: widget.myRequestsModel.state ==
                                      StatusEnum.pending
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: AppText(
                        color: context.colorScheme.onSurface,
                        textSize: 18,
                        fontWeight: FontWeight.bold,
                        text: context.localizations.summary),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  CustomSearchTextFormField(
                    maxLines: 6,
                    isEnable: false,
                    controller: TextEditingController(
                        text: widget.myRequestsModel.summary),
                    hintText: context.localizations.notes,
                    onChange: (p0) {},
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .04),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: AppText(
                        color: context.colorScheme.onSurface,
                        textSize: 18,
                        fontWeight: FontWeight.bold,
                        text: context.localizations.feedback),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  CustomSearchTextFormField(
                    maxLines: 6,
                    isEnable: false,
                    controller: TextEditingController(
                        text: widget.myRequestsModel.feedback),
                    hintText: context.localizations.notes,
                    onChange: (p0) {},
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .04),
                  if (widget.myRequestsModel.clientAttachments != null)
                    Column(
                      children: [
                        Row(
                          children: [
                            AppText(
                                color: context.colorScheme.onSurface,
                                textSize: 18,
                                fontWeight: FontWeight.bold,
                                text: context.localizations.myAttachment),
                            SizedBox(
                              width: SizeConfig.screenWidth * .1,
                            ),
                            CustomButton(
                              text: context.localizations.add,
                              press: () async {
                                if (Platform.isIOS) {
                                  _showIOSPicker(context, cubit);
                                } else {
                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles(
                                          type: FileType.any,
                                          allowMultiple: true);
                                  if (result != null && mounted) {
                                    cubit.updateAttachment(
                                        sickLeaveId: widget.myRequestsModel.id
                                                ?.toInt() ??
                                            0,
                                        file: File(result.files.single.path!));
                                  }
                                }
                              },
                              height: 30,
                              width: SizeConfig.screenWidth * .2,
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.bodyHeight * .02),
                        if (!_isLoading)
                          ...List.generate(
                              widget.myRequestsModel.clientAttachments!.length,
                              (index) => FeedBackAttachemntDesign(
                                    clientAttachments: widget.myRequestsModel
                                        .clientAttachments![index],
                                    myRequestsModel: widget.myRequestsModel,
                                  )),
                      ],
                    ),
                  SizedBox(height: SizeConfig.bodyHeight * .04),
                  if (widget.myRequestsModel.state == StatusEnum.done ||
                      widget.myRequestsModel.state == StatusEnum.notApproved)
                    _isLoading &&
                            state.identifier == 'open_report'
                        ? const LoadingWidget()
                        : CustomButton(
                            textColor: context.colorScheme.primary,
                            isActive: (widget
                                        .myRequestsModel.responseAttachments !=
                                    null &&
                                widget.myRequestsModel.responseAttachments!
                                    .isNotEmpty),
                            backgroundColor: Colors.transparent,
                            text: context.localizations.downloadReport,
                            press: () {
                              if (widget.myRequestsModel.responseAttachments !=
                                      null &&
                                  widget.myRequestsModel.responseAttachments!
                                      .isNotEmpty) {
                                cubit.downloadReportAndOpen(
                                    name: "",
                                    isPdf: true,
                                    url: widget.myRequestsModel
                                            .responseAttachments!.first.url ??
                                        "");
                              }
                            }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showIOSPicker(BuildContext context, FeedbackCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (bottomSheetContext) {
        return Container(
          height: SizeConfig.bodyHeight * .3,
          width: SizeConfig.screenWidth,
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.bodyHeight * .06),
          child: Row(
            children: [
              SizedBox(width: SizeConfig.screenWidth * .1),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final medias = await picker.pickMedia();
                    if (medias != null && mounted) {
                      Navigator.pop(bottomSheetContext);
                      cubit.updateAttachment(
                          sickLeaveId:
                              widget.myRequestsModel.id?.toInt() ?? 0,
                          file: File(medias.path));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.perm_media_outlined, size: 50),
                        SizedBox(height: 10),
                        AppText(text: "Media", fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .04),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.any);
                    if (result != null && mounted) {
                      Navigator.pop(bottomSheetContext);
                      cubit.updateAttachment(
                          sickLeaveId:
                              widget.myRequestsModel.id?.toInt() ?? 0,
                          file: File(result.files.single.path!));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.file_copy, size: 50),
                        SizedBox(height: 10),
                        AppText(text: "Files", fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .1),
            ],
          ),
        );
      },
    );
  }

  Color _getColor(StatusEnum? state) {
    switch (state) {
      case null:
        return Colors.red;
      case StatusEnum.done:
        return const Color(0xff14c286);
      case StatusEnum.pending:
        return Colors.amberAccent;
      case StatusEnum.processing:
        return Colors.blueAccent;
      default:
        return Colors.red;
    }
  }
}
