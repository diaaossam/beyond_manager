import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../../widgets/main_widget/app_text.dart';

class AttachedFilesGrid extends StatelessWidget {
  final List<File> files;
  final void Function(File file) onRemoveFile;

  const AttachedFilesGrid({
    super.key,
    required this.files,
    required this.onRemoveFile,
  });

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: files.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (_, index) => _FileItem(
            file: files[index],
            onRemove: () => onRemoveFile(files[index]),
          ),
        ),
        SizedBox(height: SizeConfig.bodyHeight * .01),
      ],
    );
  }
}

class _FileItem extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const _FileItem({
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withValues(alpha: 0.3),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppText(
              text: file.path.split("/").last,
              textSize: 11,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: onRemove,
            child: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
