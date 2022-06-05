// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';

class ScaffoldWithBack extends StatelessWidget {
  const ScaffoldWithBack(
      {super.key, required this.body, this.title, this.actions});
  final String? title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(
          leadingButtonType: kIsWeb && Theme.of(context).platform.isDesktop()
              ? null
              : LeadingButtonType.back,
          platform: Theme.of(context).platform,
          title: AppBarTitle(title ?? ''),
          actions: actions ?? [],
        ),
        body: body);
  }
}
