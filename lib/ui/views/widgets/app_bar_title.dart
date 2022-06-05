// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/platform.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform.isDesktop() && !kIsWeb
        ? Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
  }
}
