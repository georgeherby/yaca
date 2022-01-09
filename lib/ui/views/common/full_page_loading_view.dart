import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class FullPageLoadingView extends StatelessWidget {
  const FullPageLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlatformCircularProgressIndicator(),
      ),
    );
  }
}
