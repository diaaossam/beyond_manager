import 'package:flutter/material.dart';
import 'color_scheme.dart';

/// Helper class for easy access to common colors
/// Uses AppColorScheme for consistent theming
class AppColors {
  AppColors._();

  // Primary colors
  static Color get primary => AppColorScheme.light.primary;
  static Color get onPrimary => AppColorScheme.light.onPrimary;
  static Color get secondary => AppColorScheme.light.secondary;
  static Color get surface => AppColorScheme.light.surface;
  static Color get onSurface => AppColorScheme.light.onSurface;
  static Color get error => AppColorScheme.light.error;

  // Common greys
  static Color get shadow => AppColorScheme.light.shadow;
  static Color get iconGrey => const Color(0xff707070);
  static Color get outline => AppColorScheme.light.outline;

  // Other colors
  static Color get white => Colors.white;
  static Color get black => Colors.black;
  static Color get transparent => Colors.transparent;
}
