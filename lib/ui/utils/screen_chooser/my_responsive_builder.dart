// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/utils/screen_chooser/screen_chooser.dart';

/// A widget with a builder that provides you with the sizingInformation
///
/// This widget is used by the ScreenTypeLayout to provide different widget builders
class MyResponsiveBuilder extends StatelessWidget {
  const MyResponsiveBuilder({
    super.key,
    required this.builder,
  });
  final Widget Function(
    BuildContext context,
    ScreenSize screenSize,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final mediaQuery = MediaQuery.of(context);

      return builder(
          context,
          getScreenSize(mediaQuery.size, Theme.of(context).platform,
              isWeb: kIsWeb));
    });
  }
}
