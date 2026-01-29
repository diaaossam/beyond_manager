import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/status_enum.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/features/sick_leave/presentation/cubit/feedback/feedback_cubit.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBackAttachemntDesign extends StatelessWidget {
  final ClientAttachments clientAttachments;
  final MySickLeave myRequestsModel;

  const FeedBackAttachemntDesign({
    super.key,
    required this.clientAttachments,
    required this.myRequestsModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackCubit, BaseState<Map<String, dynamic>>>(
      builder: (context, state) {
        final cubit = context.read<FeedbackCubit>();
        return InkWell(
          onTap: () {
            cubit.downloadReportAndOpen(
              isPdf: false,
              name: clientAttachments.fileName ?? "",
              url: clientAttachments.url ?? "",
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                AppImage.asset(Assets.icons.download),
                const SizedBox(width: 10),
                Expanded(
                  child: AppText(
                    text: clientAttachments.fileName ?? "",
                    color: context.colorScheme.primary,
                    textSize: 14,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                Visibility(
                  visible: myRequestsModel.state == StatusEnum.pending,
                  child: InkWell(
                    onTap: () {
                      // Show delete confirmation dialog
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const Text('Delete Attachment'),
                          content: const Text(
                            'Are you sure you want to delete this attachment?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                cubit.updateAttachment(
                                  sickLeaveId: myRequestsModel.id?.toInt() ?? 0,
                                  attachmentId: clientAttachments.id?.toInt() ?? 0,
                                );
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: context.colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
