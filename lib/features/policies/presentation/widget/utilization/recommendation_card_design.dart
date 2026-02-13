import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/policies/data/models/response/deep_study_model.dart';
import 'package:bond/widgets/no_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/helper/download_service.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/download_tile_design.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class RecommendationCardDesign extends StatelessWidget {
  final List<DeepStudyModel>? studies;
  final bool isLoading;
  final VoidCallback? onRetry;

  const RecommendationCardDesign({
    super.key,
    this.studies,
    this.isLoading = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SliverFillRemaining(
        child: LoadingWidget(),
      );
    }


    final list = studies ?? [];
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.3,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.title(
              text: context.localizations.deepDiveStudy,
              textSize: 14,
              fontWeight: FontWeight.w700,
            ),
            12.verticalSpace,
            Row(
              children: [
                Icon(Icons.analytics, size: 18.sp, color: Colors.green),
                6.horizontalSpace,
                AppText(
                  text: list.isEmpty
                      ? context.localizations.noData
                      : '${list.length} ${context.localizations.deepDiveStudy}',
                  textSize: 11,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ],
            ),
            16.verticalSpace,
            if (list.isEmpty)
              Center(
                child:EmptyWidgetDesign(),
              )
            else
              ...list.map(
                (study) => Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.shadow.withValues(alpha: 0.1),
                        spreadRadius: 5,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 12.h),
                  child: Material(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: context.colorScheme.outline
                              .withValues(alpha: 0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AppText.title(
                                  text: study.message ?? '-',
                                  textSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              10.horizontalSpace,
                              if (study.status != null)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green
                                        .withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: AppText(
                                    text: study.status!,
                                    textSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                            ],
                          ),
                          12.verticalSpace,
                          if (study.sequenceNumber != null)
                            AppText.hint(
                              text: 'Study: ${study.sequenceNumber}',
                              textSize: 11,
                            ),
                          4.verticalSpace,
                          if (study.createdByName != null)
                            AppText.hint(
                              text:
                                  'Created by: ${study.createdByName}',
                              textSize: 11,
                            ),
                          4.verticalSpace,
                          if (study.requestDate != null)
                            AppText.hint(
                              text: 'Date: ${study.requestDate}',
                              textSize: 11,
                            ),
                          4.verticalSpace,
                          if (study.policyName != null)
                            AppText.hint(
                              text: 'Policy: ${study.policyName}',
                              textSize: 11,
                            ),
                          if(study.hasReplyAttachment == true)...[
                            4.verticalSpace,
                            Center(
                              child: DownloadTile(
                                enabled: true,
                                label: study.replyAttachmentFilename??"",
                                onTap: () =>DownloadServiceHelper().downloadAndOpenFile(url: study.replyAttachmentUrl??"",name: study.replyAttachmentFilename??""),
                              ),
                            )
                          ]

                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
