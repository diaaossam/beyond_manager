import 'package:bond/features/auth/presentation/pages/request_demo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../core/utils/app_size.dart';

class AuthHelper {
  Future<void> showRequestDemoForm({required BuildContext context}) async {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) =>  const RequestDemoScreen(),
    );
  }
}
