import 'package:crypto_app/old/widgets/scaffold_with_back.dart';
import 'package:crypto_app/ui/views/app_settings/app_settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(title: 'Settings', body: AppSettingsView());
  }
}
