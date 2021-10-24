// 🐦 Flutter imports:
import 'package:crypto_app/ui/utils/screen_chooser/screen_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/views/app_settings/app_settings_view.dart';
import 'package:crypto_app/ui/views/widgets/scaffold_with_back.dart';

class AppSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
        title: 'Settings',
        body: AppSettingsView());
  }
}
