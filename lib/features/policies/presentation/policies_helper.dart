import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

class PoliciesHelper {
  static String policiesStatus({required int value}) {
    switch (value) {
      case 0:
        return "All";
      case 1:
        return "Active";
      case 2:
        return "Expired";
      case 3:
        return "Cancelled";
      default:
        return "All";
    }
  }

  List<String> get options => ["All", "Active", "Expired", "Cancelled"];

  Color setUpStatusColor({
    required String status,
    required BuildContext context,
  }) {
    if (status.toLowerCase().contains("active")) {
      return context.colorScheme.tertiary;
    }
    if (status.toLowerCase().contains("expire")) {
      return context.colorScheme.error;
    }
    if (status.toLowerCase().contains("pending")) {
      return context.colorScheme.primary;
    } else {
      return context.colorScheme.shadow;
    }
  }
}
