import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bond/config/helper/secure_file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

@RoutePage()
class AdditionAttachmentsScreen extends StatefulWidget {
  const AdditionAttachmentsScreen({super.key});

  @override
  State<AdditionAttachmentsScreen> createState() =>
      _AdditionAttachmentsScreenState();
}

class _AdditionAttachmentsScreenState extends State<AdditionAttachmentsScreen> {
  final List<File> _photos = [];
  final List<File> _acknowledgments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.uploadAttachments),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: screenPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      AppText(
                        text: context.localizations.uploadAttachments,
                        fontWeight: FontWeight.w700,
                        textSize: 16,
                        color: context.colorScheme.onSurface,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .01),
                      AppText(
                        text: context.localizations.pleaseUploadAttachments,
                        fontWeight: FontWeight.w400,
                        textSize: 12,
                        color: context.colorScheme.shadow,
                        maxLines: 3,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      _buildFilesSection(
                        context: context,
                        title: context.localizations.photoUpload,
                        helperText: context
                            .localizations.automaticallyRenamedWithStaffNumber,
                        files: _photos,
                        onAddFile: () => _pickFile(_photos),
                        onRemoveFile: (index) =>
                            setState(() => _photos.removeAt(index)),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .03),
                      _buildFilesSection(
                        context: context,
                        title: context.localizations.acknowledgmentStatement,
                        helperText:
                            context.localizations.uploadSignedAcknowledgment,
                        files: _acknowledgments,
                        onAddFile: () => _pickFile(_acknowledgments),
                        onRemoveFile: (index) =>
                            setState(() => _acknowledgments.removeAt(index)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.outline(
                      text: context.localizations.back,
                      press: () {
                        context.router.back();
                      },
                      borderColor: context.colorScheme.outline,
                      textColor: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      text: context.localizations.submitRequest,
                      press: _onSubmit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFile(List<File> targetList) async {
    final file = await SecureFilePicker.pickFile();
    setState(() {
      targetList.add(file);
    });
  }

  Widget _buildFilesSection({
    required BuildContext context,
    required String title,
    required String helperText,
    required List<File> files,
    required VoidCallback onAddFile,
    required void Function(int index) onRemoveFile,
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: 13,
            color: context.colorScheme.onSurface,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .005),
          AppText(
            text: helperText,
            fontWeight: FontWeight.w400,
            textSize: 11,
            color: context.colorScheme.shadow,
            maxLines: 3,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          if (files.isEmpty)
            AppText(
              text: context.localizations.noFileChosen,
              fontWeight: FontWeight.w400,
              textSize: 11,
              color: context.colorScheme.shadow,
            )
          else
            Column(
              children: files.asMap().entries.map((entry) {
                final index = entry.key;
                final file = entry.value;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.colorScheme.outline),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.insert_drive_file, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppText(
                          text: file.path.split('/').last,
                          fontWeight: FontWeight.w400,
                          textSize: 11,
                          color: context.colorScheme.onSurface,
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close,
                            size: 18, color: Colors.red),
                        onPressed: () => onRemoveFile(index),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              onPressed: onAddFile,
              icon: const Icon(Icons.add),
              label: AppText(
                text: context.localizations.chooseFile,
                fontWeight: FontWeight.w600,
                textSize: 12,
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    if (_photos.isEmpty && _acknowledgments.isEmpty) {
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.attachmentsValidation,
        false,
      );
      return;
    }

    // TODO: integrate API call to upload attachments for the created ticket.

    Navigator.of(context).pop();
  }
}

