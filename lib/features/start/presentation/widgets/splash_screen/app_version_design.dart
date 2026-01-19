import 'package:bond/core/utils/api_config.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class AppVersionDesign extends StatelessWidget {
  const AppVersionDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: AppText(text: ApiConfig.appVersion, color: Colors.white),
      ),
    );
  }
}
