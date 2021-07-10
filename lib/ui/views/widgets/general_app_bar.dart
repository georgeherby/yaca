// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/views/widgets/back_chevron_button.dart';

class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final PreferredSizeWidget? bottom;
  final List<Widget> actions;
  final TargetPlatform platform;
  final bool hasBackRoute;

  const GeneralAppBar(
      {Key? key,
      required this.title,
      required this.actions,
      required this.platform,
      required this.hasBackRoute,
      this.bottom})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight((platform == TargetPlatform.macOS
          ? kTitleBarMacOSHeight
          : kToolbarHeight) +
      (bottom == null ? 0 : kTickerTapHeight));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0,
      leadingWidth: platform == TargetPlatform.macOS
          ? kLeadingButtonWidthMac
          : kLeadingButtonWidth,
      leading: hasBackRoute
          ? platform == TargetPlatform.macOS
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 28,
                      width: 32,
                      alignment: AlignmentDirectional.center,
                      child: BackChevronButton(
                        key: Key('back-chevron-macos'),
                        onTapped: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                )
              : IconButton(
                  key: Key('back-chevron-other-os'),
                  onPressed: () => Navigator.pop(context),
                  icon: FaIcon(FontAwesomeIcons.chevronLeft),
                )
          : (platform.isDesktop())
              ? Container()
              : IconButton(
                  key: Key('settings-cog-buton'),
                  tooltip: 'Open settings',
                  onPressed: () => Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => AppSettingsPage(),
                    ),
                  ),
                  icon: FaIcon(FontAwesomeIcons.cog),
                ),
      brightness: Theme.of(context).brightness,
      actions: actions,
      bottom: bottom,
    );
  }
}
