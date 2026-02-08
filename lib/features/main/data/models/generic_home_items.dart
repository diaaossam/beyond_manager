import 'package:bond/core/tutorial_coach/tutorial_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

class GenericHomeItems extends Equatable {
  final String title;
  final String icon;
  final VoidCallback press;
  final TutorialKeys? tutorialKey;

  const GenericHomeItems({
    required this.title,
    required this.icon,
    required this.press,
    this.tutorialKey,
  });

  @override
  List<Object?> get props => [title, icon, press, tutorialKey];
}
