// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:ionicons/ionicons.dart';
import 'package:macos_ui/macos_ui.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/ui/consts/constants.dart';

enum LeadingButtonType { back, settings }

class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  const GeneralAppBar(
      {super.key,
      required this.title,
      required this.actions,
      required this.platform,
      required this.leadingButtonType,
      this.bottom});
  final Widget title;
  final PreferredSizeWidget? bottom;
  final List<Widget> actions;
  final TargetPlatform platform;
  final LeadingButtonType? leadingButtonType;

  @override
  Size get preferredSize => Size.fromHeight(
      (platform.isDesktop() ? kTitleBarDesktopHeight : kTitleBarMobileHeight) +
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
      leading: leadingButtonType == LeadingButtonType.back
          ? platform == TargetPlatform.macOS && !kIsWeb
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 28,
                      width: 32,
                      alignment: AlignmentDirectional.center,
                      child: MacosTheme(
                        data: MacosThemeData(
                            brightness: Theme.of(context).brightness),
                        child: MacosBackButton(
                          key: const Key('back-chevron-macos'),
                          onPressed: () => context.router.pop(),
                        ),
                      ),
                    ),
                  ],
                )
              : IconButton(
                  key: const Key('back-chevron-other-os'),
                  onPressed: () => context.router.pop(),
                  icon: Icon(
                    Ionicons.chevron_back_outline,
                    size: !Theme.of(context).platform.phoneOrTablet() ? 20 : 22,
                  ),
                )
          : leadingButtonType == LeadingButtonType.settings
              ? (platform.onlyMobile(context))
                  ? IconButton(
                      key: const Key('settings-cog-buton'),
                      tooltip: 'Open settings',
                      onPressed: () => context.router
                          .push(const ApplicationSettingsHomeRoute()),
                      icon: const Icon(Ionicons.cog_outline),
                    )
                  : Container()
              : Container(),
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      actions: actions,
      bottom: bottom,
    );
  }
}
