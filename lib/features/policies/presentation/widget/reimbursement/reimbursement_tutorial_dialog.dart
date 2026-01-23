import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:beymanger/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ReimbursementTutorialDialog extends StatelessWidget {
  const ReimbursementTutorialDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tutorial Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_circle_outline,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            
            SizedBox(height: SizeConfig.bodyHeight * 0.03),
            
            // Title
            AppText(
              text: 'Reimbursement Tutorial',
              textSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            
            SizedBox(height: SizeConfig.bodyHeight * 0.02),
            
            // Description
            AppText(
              text: 'Learn how to use the reimbursement feature effectively. Watch the video tutorial to understand how to search, filter, and manage your reimbursement requests.',
              textSize: 14,
              color: AppColors.iconGrey,
              align: TextAlign.center,
            ),
            
            SizedBox(height: SizeConfig.bodyHeight * 0.03),
            
            // Video Placeholder (Replace with actual video player)
            Container(
              width: double.infinity,
              height: SizeConfig.bodyHeight * 0.2,
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.lightGrey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_filled,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * 0.01),
                  AppText(
                    text: 'Video Tutorial',
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  AppText(
                    text: 'Tap to play',
                    textSize: 12,
                    color: AppColors.iconGrey,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: SizeConfig.bodyHeight * 0.03),
            
            // Features List
            _buildFeatureItem(
              'Search by member name, ID, or staff ID',
              Icons.search,
            ),
            _buildFeatureItem(
              'Filter by claim status, service type, and date',
              Icons.filter_list,
            ),
            _buildFeatureItem(
              'Sort by newest or oldest requests',
              Icons.sort,
            ),
            _buildFeatureItem(
              'View detailed information for each claim',
              Icons.info_outline,
            ),
            
            SizedBox(height: SizeConfig.bodyHeight * 0.04),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Close',
                    press: () => Navigator.pop(context),
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    height: 45,
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.03),
                Expanded(
                  child: CustomButton(
                    text: 'Watch Tutorial',
                    press: () {
                      // Handle video playback
                      Navigator.pop(context);
                      _showVideoPlayer(context);
                    },
                    height: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.bodyHeight * 0.01),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.03),
          Expanded(
            child: AppText(
              text: text,
              textSize: 14,
              color: AppColors.iconGrey,
            ),
          ),
        ],
      ),
    );
  }

  void _showVideoPlayer(BuildContext context) {
    // Implement video player functionality
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: double.infinity,
          height: SizeConfig.bodyHeight * 0.4,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_circle_filled,
                size: 60,
                color: Colors.white,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              AppText(
                text: 'Video Player',
                textSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: 'Video tutorial will be implemented here',
                textSize: 14,
                color: Colors.white70,
              ),
              SizedBox(height: SizeConfig.bodyHeight * 0.02),
              CustomButton(
                text: 'Close',
                press: () => Navigator.pop(context),
                backgroundColor: AppColors.primary,
                height: 40,
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
