// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/ui/constants/constants.dart';

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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.zero,
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                        key: const Key('back-chevron-macos'),
                        onPressed: () => context.router.pop(),
                        child: const Icon(Icons.chevron_left_rounded),
                      ),
                    ),
                  ],
                )
              : IconButton(
                  key: const Key('back-chevron-other-os'),
                  onPressed: () => context.router.pop(),
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    size: Theme.of(context).platform == TargetPlatform.macOS
                        ? 20
                        : Theme.of(context).appBarTheme.iconTheme?.size,
                  ),
                )
          : leadingButtonType == LeadingButtonType.settings
              ? (platform.onlyMobile(context))
                  ? IconButton(
                      key: const Key('settings-cog-button'),
                      tooltip: 'Open settings',
                      onPressed: () => context.router
                          .push(const ApplicationSettingsHomeRoute()),
                      icon: Icon(
                        CupertinoIcons.settings,
                        size: Theme.of(context).platform == TargetPlatform.macOS
                            ? 20
                            : Theme.of(context).appBarTheme.iconTheme?.size,
                      ),
                    )
                  : Container()
              : Container(),
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      actions: actions,
      bottom: bottom,
    );
  }
}
