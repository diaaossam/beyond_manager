import 'package:flutter/material.dart';

import '../extensions/app_localizations_extension.dart';

enum Language {
  arabic("ar"),
  english("en");

  final String name;

  const Language(this.name);
}

Language handleLanguageByString({required String code}) {
  if (code == "ar") {
    return Language.arabic;
  } else {
    return Language.english;
  }
}

String handleLanguageToString({
  required BuildContext context,
  required String code,
}) {
  if (code == "ar") {
    return context.localizations.arabic;
  } else {
    return context.localizations.english;
  }
}
