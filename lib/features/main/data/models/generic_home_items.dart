import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

class GenericHomeItems extends Equatable {
  final String title;
  final String icon;
  final VoidCallback press;

  const GenericHomeItems({
    required this.title,
    required this.icon,
    required this.press,
  });

  @override
  List<Object> get props => [title, icon, press];
}
