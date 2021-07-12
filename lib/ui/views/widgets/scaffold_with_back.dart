// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
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
          hasBackRoute: true,
          platform: Theme.of(context).platform,
          title: Text(
            title ?? '',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          actions: actions ?? [],
        ),
        body: body);
  }
}
