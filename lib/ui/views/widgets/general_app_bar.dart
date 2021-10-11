// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
  Size get preferredSize => Size.fromHeight(
      (platform.isDesktop() ? kTitleBarMacOSHeight : kToolbarHeight) +
          (bottom == null ? 0 : kMarqueTapHeight));

  @override
  Widget build(BuildContext context) {
    print(platform);
    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0,
      leadingWidth: platform == TargetPlatform.macOS && !kIsWeb
          ? kLeadingButtonWidthMac
          : kLeadingButtonWidth,
      leading: hasBackRoute
          ? platform == TargetPlatform.macOS && !kIsWeb
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
          : (!platform.onlyMobile(context))
              ? Container()
              : IconButton(
                  key: Key('settings-cog-buton'),
                  tooltip: 'Open settings',
                  onPressed: () => Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      fullscreenDialog: true,
                      builder: (context) => AppSettingsPage(),
                    ),
                  ),
                  icon: FaIcon(FontAwesomeIcons.cog),
                ),
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      actions: actions,
      bottom: bottom,
    );
  }
}
