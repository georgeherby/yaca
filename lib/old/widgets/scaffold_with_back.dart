import 'package:crypto_app/old/widgets/back_chevron_button.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          toolbarHeight: Theme.of(context).platform == TargetPlatform.macOS ?  kTitleBarMacOSHeight : kToolbarHeight,
          title: Text(
            title ?? '',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          actions: actions ?? [],
          centerTitle: true,
          leadingWidth: Theme.of(context).platform == TargetPlatform.macOS
              ? kLeadingButtonWidthMac
              : kLeadingButtonWidth,
          leading: Theme.of(context).platform == TargetPlatform.macOS
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 24,
                      width: 32,
                      alignment: AlignmentDirectional.center,
                      child: BackChevronButton(
                        onTapped: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(CupertinoIcons.chevron_left)),
        ),
        body: body);
  }
}
