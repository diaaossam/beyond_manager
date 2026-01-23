import 'package:beymanger/core/utils/app_constant.dart';
import 'package:beymanger/features/reimbursement/data/models/attachment_model.dart';
import 'package:beymanger/features/reimbursement/data/models/reimbursement_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_text.dart';
import '../../../main/presentation/pages/pdf_view_screen.dart';

class ReimbursementCardBody extends StatelessWidget {
  final ReimbursementModel result;

  const ReimbursementCardBody({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Basic Information Section
          _buildSectionTitle("Requested Information"),
          const SizedBox(height: 12),
          _buildInfoRow("Mobile Number", result.mobileNumber ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow("Missing Documents", result.missingDocs ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow("Service Type", result.serviceType ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow("Service Date", result.serviceDate ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow(
              "Approved Amount",
              result.approvedAmount != null && result.approvedAmount!.isNotEmpty
                  ? '${result.approvedAmount} EGP'
                  : 'N/A',
              isAmount: true),
          const SizedBox(height: 8),

          _buildInfoRow(
            'ID Number',
            result.idNumber ?? 'N/A',
          ),
          const SizedBox(height: 8),

          _buildInfoRow(
            'Claimed Amount',
            result.claimedAmount != null
                ? '${result.claimedAmount!.toString()} EGP'
                : 'N/A',
            isAmount: true,
          ),
          const SizedBox(height: 8),
          _buildInfoRow("Payment State", result.paymentState ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow("Batch No", result.batchNo ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow("Breakdown Reason", result.breakdownReason ?? 'N/A'),
          const SizedBox(height: 20),
          _buildSupportingDocumentsSection(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return AppText(
      text: title,
      textSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isAmount = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.3,
          child: AppText(
            text: "$label:",
            textSize: 12,
            color: AppColors.iconGrey,
          ),
        ),
        Expanded(
          child: AppText(
            text: value,
            textSize: 12,
            maxLines: 4,
            color: isAmount ? AppColors.primary : AppColors.black,
            fontWeight: isAmount ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildSupportingDocumentsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Supporting Documents",
            textSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          const SizedBox(height: 16),

          if(result.reimbursement_copy_type != "hard")
          _buildDocumentSection(
            title: "Scanned Copy",
            icon: Icons.description,
            color: const Color(0xFF2196F3),
            lightColor: const Color(0xFFE3F2FD),
            files: result.attachmentFiles ?? [],
            onTap: () => _showDocumentsDialog(
                context, "Scanned Copy", result.attachmentFiles ?? []),
          ),

          const SizedBox(height: 12),

          // Breakdown Files Section
          _buildDocumentSection(
            title: "Breakdown Files",
            icon: Icons.bar_chart,
            color: const Color(0xFFFF9800),
            // Orange
            lightColor: const Color(0xFFFFF3E0),
            // Light orange
            files: result.breakdownFiles ?? [],
            onTap: () => _showDocumentsDialog(
                context, "Breakdown Files", result.breakdownFiles ?? []),
          ),

          const SizedBox(height: 12),

          // Payment Proof Files Section
          _buildDocumentSection(
            title: "Payment Proof Files",
            icon: Icons.check_circle,
            color: const Color(0xFF4CAF50),
            // Green
            lightColor: const Color(0xFFE8F5E8),
            // Light green
            files: result.paymentProofFiles ?? [],
            onTap: () => _showDocumentsDialog(
                context, "Payment Proof Files", result.paymentProofFiles ?? []),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentSection({
    required String title,
    required IconData icon,
    required Color color,
    required Color lightColor,
    required List<dynamic> files,
    required VoidCallback onTap,
  }) {
    int fileCount = files.length;

    return GestureDetector(
      onTap: fileCount > 0 ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: AppText(
                text: title,
                textSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: color,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  AppText(
                    text: "View ($fileCount)",
                    textSize: 11,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDocumentsDialog(
      BuildContext context, String title, List<dynamic> files) {
    if (files.isEmpty) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText(
          text: title,
          textSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: files.length,
            itemBuilder: (context, index) {
              AttachmentModel file = files[index] as AttachmentModel;
              String fileName = file.filename ?? "";
              String downloadUrl = file.downloadUrl ?? "";
              String mimeType = file.mimetype ?? "";

              return ListTile(
                leading: Icon(
                  _getFileIcon(mimeType),
                  color: _getFileColor(mimeType),
                ),
                title: AppText(
                  text: fileName,
                  textSize: 14,
                  color: AppColors.black,
                ),
                subtitle: AppText(
                  text: _getFileTypeDescription(mimeType),
                  textSize: 12,
                  color: AppColors.iconGrey,
                ),
                onTap: () {
                  Navigator.pop(context);
                  _handleFileOpen(context, downloadUrl, mimeType, fileName);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: AppText(
              text: 'Close',
              textSize: 14,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  void _handleFileOpen(
      BuildContext context, String url, String mimeType, String fileName) {
    if (url.isEmpty) return;

    if (_isImageFile(mimeType)) {
      _showImageViewer(context, url, fileName);
    } else if (_isVideoFile(mimeType)) {
      _showVideoPlayer(context, url, fileName);
    } else if (_isDocumentFile(mimeType)) {
      if (mimeType == 'application/pdf') {
        AppConstant.navigateTo(context: context, widget: PdfViewScreen(url: url,));
      } else {
        _openDocumentFile(url, fileName);
      }
    } else {
      _launchUrl(url);
    }
  }

  void _showImageViewer(
      BuildContext context, String imageUrl, String fileName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(height: 16),
                          AppText(
                            text: "Failed to load image",
                            textSize: 16,
                            color: Colors.white,
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AppText(
                  text: fileName,
                  textSize: 14,
                  color: Colors.white,
                  align: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showVideoPlayer(
      BuildContext context, String videoUrl, String fileName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 80,
                  ),
                  const SizedBox(height: 16),
                  AppText(
                    text: fileName,
                    textSize: 16,
                    color: Colors.white,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const AppText(
                    text: "Tap to open video",
                    textSize: 14,
                    color: Colors.white70,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _launchUrl(videoUrl);
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openDocumentFile(String url, String fileName) async {
    try {
      final result = await OpenFile.open(url);

      if (result.type != ResultType.done) {
        _launchUrl(url);
      }
    } catch (e) {
      // Fallback to URL launcher
      _launchUrl(url);
    }
  }

  String _getMimeTypeFromUrl(String url) {
    final extension = url.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'mp4':
        return 'video/mp4';
      case 'avi':
        return 'video/avi';
      case 'pdf':
        return 'application/pdf';
      case 'xlsx':
      case 'xls':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'docx':
      case 'doc':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      default:
        return 'application/octet-stream';
    }
  }

  bool _isImageFile(String mimeType) {
    return mimeType.startsWith('image/');
  }

  bool _isVideoFile(String mimeType) {
    return mimeType.startsWith('video/');
  }

  bool _isDocumentFile(String mimeType) {
    return mimeType == 'application/pdf' ||
        mimeType.contains('spreadsheet') ||
        mimeType.contains('wordprocessing') ||
        mimeType.contains('excel');
  }

  IconData _getFileIcon(String mimeType) {
    if (_isImageFile(mimeType)) return Icons.image;
    if (_isVideoFile(mimeType)) return Icons.video_file;
    if (mimeType == 'application/pdf') return Icons.picture_as_pdf;
    if (mimeType.contains('spreadsheet') || mimeType.contains('excel'))
      return Icons.table_chart;
    if (mimeType.contains('wordprocessing')) return Icons.description;
    return Icons.attach_file;
  }

  Color _getFileColor(String mimeType) {
    if (_isImageFile(mimeType)) return Colors.blue;
    if (_isVideoFile(mimeType)) return Colors.red;
    if (mimeType == 'application/pdf') return Colors.red;
    if (mimeType.contains('spreadsheet') || mimeType.contains('excel'))
      return Colors.green;
    if (mimeType.contains('wordprocessing')) return Colors.blue;
    return AppColors.iconGrey;
  }

  String _getFileTypeDescription(String mimeType) {
    if (_isImageFile(mimeType)) return 'Image file';
    if (_isVideoFile(mimeType)) return 'Video file';
    if (mimeType == 'application/pdf') return 'PDF document';
    if (mimeType.contains('spreadsheet') || mimeType.contains('excel'))
      return 'Excel spreadsheet';
    if (mimeType.contains('wordprocessing')) return 'Word document';
    return 'Document file';
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
