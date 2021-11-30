// 🐦 Flutter imports:
import 'package:crypto_app/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/views/widgets/back_chevron_button.dart';

enum LeadingButtonType { BACK, SETTINGS }

class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final PreferredSizeWidget? bottom;
  final List<Widget> actions;
  final TargetPlatform platform;
  final LeadingButtonType? leadingButtonType;

  const GeneralAppBar(
      {Key? key,
      required this.title,
      required this.actions,
      required this.platform,
      required this.leadingButtonType,
      this.bottom})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
      (platform.isDesktop() ? kTitleBarMacOSHeight : kToolbarHeight) +
          (bottom == null ? 0 : kMarqueTapHeight));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0,
      leadingWidth: platform == TargetPlatform.macOS && !kIsWeb
          ? kLeadingButtonWidthMac
          : kLeadingButtonWidth,
      leading: leadingButtonType == LeadingButtonType.BACK
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
                        onTapped: () => context.router.pop(),
                      ),
                    ),
                  ],
                )
              : IconButton(
                  key: Key('back-chevron-other-os'),
                  onPressed: () => context.router.pop(),
                  icon: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: !Theme.of(context).platform.phoneOrTablet() ? 20 : 22,
                  ),
                )
          : leadingButtonType == LeadingButtonType.SETTINGS
              ? (platform.onlyMobile(context))
                  ? IconButton(
                      key: Key('settings-cog-buton'),
                      tooltip: 'Open settings',
                      onPressed: () =>
                          context.router.push(const AppSettingsHomeRoute()),
                      icon: FaIcon(FontAwesomeIcons.cog),
                    )
                  : Container()
              : Container(),
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      actions: actions,
      bottom: bottom,
    );
  }
}
