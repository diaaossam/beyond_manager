import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class FileUploadField extends StatelessWidget {
  final String label;
  final bool required;
  final String? helperText;
  final String? fileName;
  final VoidCallback onTap;
  final bool hasError;

  const FileUploadField({
    super.key,
    required this.label,
    this.required = false,
    this.helperText,
    this.fileName,
    required this.onTap,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:
              hasError ? context.colorScheme.error : context.colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                text: label,
                fontWeight: FontWeight.w600,
                textSize: 12,
                color: context.colorScheme.onSurface,
              ),
              if (required)
                const AppText(
                  text: " *",
                  fontWeight: FontWeight.w700,
                  textSize: 13,
                  color: Colors.red,
                ),
            ],
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: context.colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.outline,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: AppText(
                      text: context.localizations.chooseFile,
                      fontWeight: FontWeight.w600,
                      textSize: 12,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppText(
                      text: fileName != null
                          ? fileName!.split('/').last
                          : context.localizations.noFileChosen,
                      fontWeight: FontWeight.w400,
                      textSize: 11,
                      color: fileName != null
                          ? context.colorScheme.onSurface
                          : context.colorScheme.shadow,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (helperText != null) ...[
            const SizedBox(height: 4),
            AppText(
              text: helperText!,
              fontWeight: FontWeight.w400,
              textSize: 11,
              color: context.colorScheme.shadow,
              maxLines: 2,
            ),
          ],
        ],
      ),
    );
  }
}

