// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebBuilder extends StatelessWidget {
  const WebBuilder({super.key, required this.web, required this.other});
  final Widget web;
  final Widget other;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return kIsWeb ? web : other;
    });
  }
}
