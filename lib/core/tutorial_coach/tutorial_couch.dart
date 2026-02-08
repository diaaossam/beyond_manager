import 'dart:developer';
import 'dart:ui';
import 'package:bond/core/tutorial_coach/tutorial_coach_item.dart';
import 'package:bond/core/tutorial_coach/tutorial_enum.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../extensions/color_extensions.dart';
import '../extensions/app_localizations_extension.dart';

class TutorialCouch {
  late TutorialCoachMark tutorialCoachMark;

  void createTutorial({
    required List<TutorialCouchItem> items,
    required BuildContext context,
  }) {
    List<TargetFocus> targets = [];
    for (var item in items) {
      targets.add(
        TargetFocus(
          identify: item.identify,
          keyTarget: item.keyTarget,
          targetPosition: item.targetPosition,
          contents: [
            TargetContent(
              align: item.align,
              builder: (context, controller) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onPrimary,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        item.description,
                        style: TextStyle(color: context.colorScheme.onPrimary),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      );
    }
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: context.colorScheme.primary,
      textSkip: context.localizations.skip,
      alignSkip: AlignmentDirectional.topStart,
      useSafeArea: true,
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        log("finish");
      },
      onClickTarget: (target) {
        log('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        log("target: $target");
        log(
          "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}",
        );
      },
      onClickOverlay: (target) {
        log('onClickOverlay: $target');
      },
      onSkip: () {
        log("skip");
        return true;
      },
    );
  }

  void show(BuildContext context) {
    tutorialCoachMark.show(context: context);
  }
}

class TutorialManagement {
  /// Show home screen tutorial
  static Future<void> showHomeTutorial({
    required BuildContext context,
    required Map<TutorialKeys, GlobalKey> globalKeys,
  }) async {
    // Check if tutorial was already shown
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(PrefsKeys.showTutorialHome)) {
      return;
    }

    // Mark tutorial as shown
    await prefs.setBool(PrefsKeys.showTutorialHome, true);

    // Check if widgets are mounted and keys are attached
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (!context.mounted) return;

    final tutorialCouch = TutorialCouch();
    final localizations = context.localizations;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    tutorialCouch.createTutorial(
      context: context,
      items: [
        TutorialCouchItem(
          identify: TutorialKeys.emergencySupport.name,
          keyTarget: globalKeys[TutorialKeys.emergencySupport],
          title: localizations.emergencySupport2,
          description: localizations.emergencySupport2,
          align: isRTL ? ContentAlign.left : ContentAlign.right,
        ),
        TutorialCouchItem(
          identify: TutorialKeys.insurancePolicies.name,
          keyTarget: globalKeys[TutorialKeys.insurancePolicies],
          title: localizations.insurancePolicies2,
          description: localizations.insurancePolicies2,
          align: isRTL ? ContentAlign.right : ContentAlign.left,
        ),
        TutorialCouchItem(
          identify: TutorialKeys.sickLeave.name,
          keyTarget: globalKeys[TutorialKeys.sickLeave],
          title: localizations.sickLeaveService,
          description: localizations.sickLeaveService,
          align: isRTL ? ContentAlign.left : ContentAlign.right,
        ),
        TutorialCouchItem(
          identify: TutorialKeys.getCovered.name,
          keyTarget: globalKeys[TutorialKeys.getCovered],
          title: localizations.getCovered,
          description: localizations.getCovered,
          align: isRTL ? ContentAlign.right : ContentAlign.left,
        ),
      ],
    );

    if (context.mounted) {
      tutorialCouch.show(context);
    }
  }

  /// Reset tutorial (useful for testing or user request)
  static Future<void> resetHomeTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(PrefsKeys.showTutorialHome);
  }
}
