import 'package:better_player_plus/better_player_plus.dart';
import 'package:beymanger/core/utils/app_colors.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerDialog extends StatefulWidget {
  final String videoUrl;
  final String? title;
  final String? description;

  const VideoPlayerDialog({
    super.key,
    required this.videoUrl,
    this.title,
    this.description,
  });

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late BetterPlayerController _betterPlayerController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      allowedScreenSleep: false,
      handleLifecycle: true,
      autoDetectFullscreenDeviceOrientation: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: true,
        showControlsOnInitialize: true,
        controlBarColor: Colors.black.withOpacity(0.7),
        iconsColor: Colors.white,
        progressBarPlayedColor: AppColors.primary,
        progressBarHandleColor: AppColors.primary,
        progressBarBackgroundColor: Colors.white.withOpacity(0.3),
        textColor: Colors.white,
        loadingWidget: Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      ),
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      videoFormat: BetterPlayerVideoFormat.other,
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: SizeConfig.bodyHeight * 0.5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Video Player
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _isInitialized
                  ? BetterPlayer(controller: _betterPlayerController)
                  : Container(
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                            SizedBox(height: SizeConfig.bodyHeight * 0.02),
                            AppText(
                              text: 'Loading video...',
                              textSize: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
            ),

            // Close Button
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
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

            // Title and Description Overlay (if provided)
            if (widget.title != null || widget.description != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.title != null)
                        AppText(
                          text: widget.title!,
                          textSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      if (widget.description != null) ...[
                        SizedBox(height: SizeConfig.bodyHeight * 0.005),
                        AppText(
                          text: widget.description!,
                          textSize: 14,
                          color: Colors.white70,
                          maxLines: 2,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Helper function to show video player dialog
void showVideoPlayerDialog({
  required BuildContext context,
  required String videoUrl,
  String? title,
  String? description,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => VideoPlayerDialog(
      videoUrl: videoUrl,
      title: title,
      description: description,
    ),
  );
}
