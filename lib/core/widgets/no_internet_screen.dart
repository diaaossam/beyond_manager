import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

import '../../gen/assets.gen.dart';

class NoInternetScreen extends StatefulWidget {
  final VoidCallback? onRetry;

  const NoInternetScreen({
    super.key,
    this.onRetry,
  });

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.bodyHeight*.2,),
                AppImage.asset(Assets.images.noNetwork.path),
                SizedBox(height: 30.h),
                FadeInDown(
                  delay: const Duration(milliseconds: 400),
                  child: AppText.title(text: context.localizations.noInternet),
                ),
                SizedBox(height: 16.h),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  child: AppText.body(text: context.localizations.noInternetBody),
                ),
                SizedBox(height: 48.h),
                if (widget.onRetry != null)
                  FadeInUp(
                    delay: const Duration(milliseconds: 800),
                    child: CustomButton(text: context.localizations.retry, press: widget.onRetry!),
                  ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
