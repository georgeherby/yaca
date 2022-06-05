// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/utils/screen_chooser/screen_builder.dart';

class RefreshableList extends StatelessWidget {
  const RefreshableList(
      {super.key, required this.onRefresh, required this.child});
  final Widget child;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      mobile: _buildRefreshIndicator(context),
      mobileDesktop: child,
      tablet: _buildRefreshIndicator(context),
      tabletWeb: _buildRefreshIndicator(context),
      tabletDesktop: child,
      desktop: child,
      desktopWeb: child,
    );
  }

  Widget _buildRefreshIndicator(BuildContext context) {
    return RefreshIndicator(onRefresh: onRefresh, child: child);
  }
}
