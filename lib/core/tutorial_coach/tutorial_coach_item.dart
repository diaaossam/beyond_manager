import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialCouchItem {
  final String identify;
  final GlobalKey? keyTarget;
  final String title;
  final String description;
  final ContentAlign align;
  final TargetPosition? targetPosition;

  TutorialCouchItem({
    required this.identify,
    this.keyTarget,
    required this.title,
    required this.description,
    required this.align,
    this.targetPosition,
  });
}
