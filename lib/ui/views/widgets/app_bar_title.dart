// 🐦 Flutter imports:
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/utils/screen_chooser/screen_builder.dart';

class AppbarTitle extends StatelessWidget {
  final String title;

  const AppbarTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform.isDesktop() && !kIsWeb
        ? Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          )
        : Text(
            title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          );
  }
}
