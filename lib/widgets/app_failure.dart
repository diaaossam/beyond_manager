import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/extensions/app_localizations_extension.dart';
import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import '../gen/assets.gen.dart';
import 'main_widget/app_text.dart';
import 'main_widget/custom_button.dart';
import 'image_picker/app_image.dart';

class AppFailureWidget extends StatefulWidget {
  final String? title;
  final String? body;
  final String? image;
  final VoidCallback? callback;
  final String? buttonText;
  final double? height;
  final bool showButton;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;

  const AppFailureWidget({
    super.key,
    this.title,
    this.body,
    this.image,
    this.callback,
    this.buttonText,
    this.height,
    this.showButton = true,
    this.icon,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  State<AppFailureWidget> createState() => _AppFailureWidgetState();
}

class _AppFailureWidgetState extends State<AppFailureWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeController.forward();
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
            minHeight: widget.height ?? SizeConfig.bodyHeight * .4,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.bodyHeight * .04,
            vertical: SizeConfig.bodyHeight * .02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAnimatedImage(),
              SizedBox(height: SizeConfig.bodyHeight * .04),

              // Animated Title
              _buildAnimatedTitle(context),

              SizedBox(height: SizeConfig.bodyHeight * .02),
              _buildAnimatedBody(context: context),

              SizedBox(height: SizeConfig.bodyHeight * .04),

              // Optional Animated Button
              if (widget.showButton) _buildAnimatedButton(context, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedImage() {
    return ElasticIn(
      duration: const Duration(milliseconds: 1000),
      child:
          Container(
                padding: EdgeInsets.all(SizeConfig.bodyHeight * .02),
                decoration: BoxDecoration(
                  color: widget.backgroundColor?.withValues(alpha: 0.1) ??
                      Colors.red.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
                child: AppImage.asset(
                  Assets.images.iDError.path,
                  height: SizeConfig.bodyHeight * .25,
                  fit: BoxFit.cover,
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .shimmer(
                duration: 2000.ms,
                color: Colors.white.withValues(alpha: 0.3),
              )
              .then()
              .shake(hz: 2, curve: Curves.easeInOutCubic),
    );
  }


  Widget _buildAnimatedTitle(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: const Duration(milliseconds: 200),
      child:
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.bodyHeight * .02,
            ),
            child: AppText(
              text: widget.title ?? context.localizations.errorTitle,
              textSize: 18,
              align: TextAlign.center,
              maxLines: 3,
              fontWeight: FontWeight.w600,
            ),
          ).animate().shimmer(
            delay: 400.ms,
            duration: 1500.ms,
            color: Colors.white.withValues(alpha: 0.5),
          ),
    );
  }

  Widget _buildAnimatedBody({required BuildContext context}) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.bodyHeight * .015),
        child: AppText(
          text: widget.body ?? context.localizations.errorBody,
          textSize: 13,
          maxLines: 40,
          align: TextAlign.center,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context, ColorScheme colorScheme) {
    if (!widget.showButton) {
      return SizedBox.shrink();
    }
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: const Duration(milliseconds: 600),
      child:
          CustomButton(
                text: widget.buttonText ?? context.localizations.back,
                press:
                    widget.callback ??
                    () => context.router.canPop() ? context.router.pop() : null,
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                duration: 1500.ms,
                begin: const Offset(1, 1),
                end: const Offset(1.02, 1.02),
                curve: Curves.easeInOut,
              ),
    );
  }
}
