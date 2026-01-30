import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../../widgets/main_widget/custom_button.dart';
import 'attached_files_grid.dart';

class SickLeaveBottomBar extends StatelessWidget {
  final List<File> files;
  final bool isLoading;
  final VoidCallback onUploadAttachments;
  final VoidCallback onSubmit;
  final void Function(File file) onRemoveFile;

  const SickLeaveBottomBar({
    super.key,
    required this.files,
    required this.isLoading,
    required this.onUploadAttachments,
    required this.onSubmit,
    required this.onRemoveFile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .04,
        vertical: SizeConfig.bodyHeight * .01,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AttachedFilesGrid(
            files: files,
            onRemoveFile: onRemoveFile,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton.outline(
                  textSize: 12,
                  text: context.localizations.uploadAttachments,
                  press: onUploadAttachments,
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * .02),
              Expanded(
                child: CustomButton(
                  text: context.localizations.submit,
                  textSize: 12,
                  isLoading: isLoading,
                  press: onSubmit,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
        ],
      ),
    );
  }
}
