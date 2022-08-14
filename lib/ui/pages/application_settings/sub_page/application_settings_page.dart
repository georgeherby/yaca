// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/views/app_settings/app_settings_view.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';

class ApplicationSettingsPage extends StatelessWidget {
  const ApplicationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithBack(title: 'Settings', body: ApplicationSettingsView());
  }
}
