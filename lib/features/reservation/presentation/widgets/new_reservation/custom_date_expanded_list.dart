import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({super.key});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
