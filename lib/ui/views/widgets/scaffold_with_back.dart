// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/views/widgets/app_bar_title.dart';
import 'package:crypto_app/ui/views/widgets/general_app_bar.dart';

class ScaffoldWithBack extends StatelessWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;

  const ScaffoldWithBack(
      {Key? key, required this.body, this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(
          hasBackRoute: !kIsWeb,
          platform: Theme.of(context).platform,
          title: AppbarTitle(title ?? ''),
          actions: actions ?? [],
        ),
        body: body);
  }
}
