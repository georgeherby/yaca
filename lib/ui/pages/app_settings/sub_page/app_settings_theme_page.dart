import 'package:crypto_app/app_router.dart';
import 'package:crypto_app/ui/views/app_settings/theme_choice_view.dart';
import 'package:flutter/material.dart';

class AppSettingsThemePage extends StatelessWidget {
  const AppSettingsThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChoiceView();
  }
}
