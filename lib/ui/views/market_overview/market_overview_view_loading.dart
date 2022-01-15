// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MarketOverviewViewLoading extends StatelessWidget {
  const MarketOverviewViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraint.maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformCircularProgressIndicator(),
          ],
        ),
      );
    });
  }
}
