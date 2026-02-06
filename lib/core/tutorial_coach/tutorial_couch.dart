import 'dart:developer';
import 'dart:ui';
import 'package:bond/core/tutorial_coach/tutorial_coach_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../extensions/color_extensions.dart';
import '../../generated/l10n.dart';

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
      textSkip: S.current.skip,
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
  static void showMainUserTutorial(
    ValueChanged<List<GlobalKey>> onKeys,
    BuildContext context,
  ) {
    final List<GlobalKey> globalKeys = List.generate(
      UserNavItem.values.length,
      (index) => GlobalKey(),
    );
    onKeys(globalKeys);
    if (getIt<SharedPreferences>().containsKey(PrefsKeys.showTutorialMain)) {
      return;
    }
    getIt<SharedPreferences>().setBool(PrefsKeys.showTutorialMain, true);
    final tutorialCouch = TutorialCouch();
    tutorialCouch.createTutorial(
      context: context,
      items: UserNavItem.values
          .mapIndexed(
            (index, e) => TutorialCouchItem(
              identify: e.name,
              keyTarget: globalKeys[index],
              title: e.title,
              description: e.description,
              align: switch (e) {
                UserNavItem.home =>
                  AppVariables.language == "ar"
                      ? ContentAlign.left
                      : ContentAlign.right,
                UserNavItem.services =>
                  AppVariables.language == "ar"
                      ? ContentAlign.left
                      : ContentAlign.right,
                UserNavItem.ai =>
                  AppVariables.language == "ar"
                      ? ContentAlign.left
                      : ContentAlign.right,
                UserNavItem.bookings =>
                  AppVariables.language == "ar"
                      ? ContentAlign.right
                      : ContentAlign.left,
                UserNavItem.account =>
                  AppVariables.language == "ar"
                      ? ContentAlign.right
                      : ContentAlign.left,
              },
            ),
          )
          .toList(),
    );
    Future.delayed(Duration.zero, () {
      if (context.mounted) tutorialCouch.show(context);
    });
  }

  static void showServiceDetailsTutorial(
    BuildContext context,
    ValueChanged<Map<String, GlobalKey>> onKeys,
  ) {
    final tutorialCouch = TutorialCouch();
    final globalKeys = {
      "filter": GlobalKey(),
      "location": GlobalKey(),
      "date": GlobalKey(),
    };
    onKeys(globalKeys);
    if (getIt<SharedPreferences>().containsKey(PrefsKeys.showTutorialService)) {
      return;
    }
    getIt<SharedPreferences>().setBool(PrefsKeys.showTutorialService, true);

    tutorialCouch.createTutorial(
      items: [
        TutorialCouchItem(
          identify: "filter",
          keyTarget: AppVariables.language == "ar"
              ? null
              : globalKeys["filter"]!,
          targetPosition: AppVariables.language == "ar"
              ? TargetPosition(Size(50, 50), Offset(15, 120))
              : null,
          title: S.current.filter,
          description: S.current.filterDescription,
          align: AppVariables.language == "ar"
              ? ContentAlign.right
              : ContentAlign.left,
        ),
        TutorialCouchItem(
          identify: "location",
          keyTarget: globalKeys["location"]!,
          title: S.current.location,
          description: S.current.locationDescription,
          align: AppVariables.language == "ar"
              ? ContentAlign.left
              : ContentAlign.right,
        ),
        TutorialCouchItem(
          identify: "date",
          keyTarget: globalKeys["date"]!,
          title: S.current.date,
          description: S.current.dateDescription,
          align: AppVariables.language == "ar"
              ? ContentAlign.right
              : ContentAlign.left,
        ),
      ],
      context: context,
    );
    Future.delayed(Duration.zero, () {
      if (context.mounted) tutorialCouch.show(context);
    });
  }

  static void showServiceProviderDetailsutorial({
    required BuildContext context,
    required ValueChanged<Map<TutorialKeys, GlobalKey>> onKeys,
  }) {
    final tutorialCouch = TutorialCouch();
    final globalKeys = {
      TutorialKeys.ourWorks: GlobalKey(),
      TutorialKeys.services: GlobalKey(),
      TutorialKeys.rates: GlobalKey(),
      TutorialKeys.details: GlobalKey(),
    };
    onKeys(globalKeys);
    if (getIt<SharedPreferences>().containsKey(
      PrefsKeys.showTutorialProvider,
    )) {
      return;
    }
    getIt<SharedPreferences>().setBool(PrefsKeys.showTutorialProvider, true);

    tutorialCouch.createTutorial(
      context: context,
      items: [
        TutorialCouchItem(
          identify: TutorialKeys.ourWorks.name,
          keyTarget: globalKeys[TutorialKeys.ourWorks]!,
          title: S.current.ourWorks,
          description: S.current.showOldWorks,
          align: AppVariables.language == "ar"
              ? ContentAlign.left
              : ContentAlign.right,
        ),
        TutorialCouchItem(
          identify: TutorialKeys.services.name,
          keyTarget: globalKeys[TutorialKeys.services]!,
          title: S.current.services,
          description: S.current.showAvailableService,
          align: AppVariables.language == "ar"
              ? ContentAlign.left
              : ContentAlign.right,
        ),
        TutorialCouchItem(
          identify: TutorialKeys.rates.name,
          keyTarget: globalKeys[TutorialKeys.rates]!,
          title: S.current.rate,
          description: S.current.showProviderRate,
          align: AppVariables.language == "ar"
              ? ContentAlign.left
              : ContentAlign.right,
        ),
        TutorialCouchItem(
          identify: TutorialKeys.details.name,
          keyTarget: globalKeys[TutorialKeys.details]!,
          title: S.current.details,
          description: S.current.showDetailsAndEmployee,
          align: AppVariables.language == "ar"
              ? ContentAlign.right
              : ContentAlign.left,
        ),
      ],
    );
    Future.delayed(Duration.zero, () {
      if (context.mounted) tutorialCouch.show(context);
    });
  }
}
