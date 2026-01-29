import 'package:auto_route/annotations.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MedicalFilterScreen extends StatelessWidget {
  const MedicalFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Medical Filter"),
      body: Center(child: Text("Filter Options")),
    );
  }
}
