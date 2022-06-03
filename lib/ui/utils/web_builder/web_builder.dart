// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebBuilder extends StatelessWidget {
  final Widget web;
  final Widget other;

  const WebBuilder({super.key, required this.web, required this.other});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return kIsWeb ? web : other;
    });
  }
}
