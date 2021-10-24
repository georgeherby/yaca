import 'package:crypto_app/ui/utils/screen_chooser/my_responsive_builder.dart';
import 'package:crypto_app/ui/utils/screen_chooser/screen_chooser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenBuilder extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? mobileDesktop;
  final WidgetBuilder tablet;
  final WidgetBuilder? tabletWeb;
  final WidgetBuilder? tabletDesktop;
  final WidgetBuilder desktop;
  final WidgetBuilder? desktopWeb;

  ScreenBuilder({
    Key? key,
    // this.breakpoints,
    required Widget mobile,
    Widget? mobileDesktop,
    required Widget tablet,
    Widget? tabletWeb,
    Widget? tabletDesktop,
    required Widget desktop,
    Widget? desktopWeb,
  })  : mobile = _builderOrNull(mobile)!,
        mobileDesktop = _builderOrNull(mobileDesktop),
        tablet = _builderOrNull(tablet)!,
        tabletWeb = _builderOrNull(tabletWeb),
        tabletDesktop = _builderOrNull(tabletDesktop),
        desktop = _builderOrNull(desktop)!,
        desktopWeb = _builderOrNull(desktopWeb),
        super(key: key);

  const ScreenBuilder.builder({
    Key? key,
    required this.mobile,
    this.mobileDesktop,
    required this.tablet,
    this.tabletWeb,
    this.tabletDesktop,
    required this.desktop,
    this.desktopWeb,
  }) : super(key: key);

  static WidgetBuilder? _builderOrNull(Widget? widget) {
    return widget == null ? null : ((_) => widget);
  }

  @override
  Widget build(BuildContext context) {
    return MyResponsiveBuilder(
      builder: (context, screenSize) {
        var targetPlatform = Theme.of(context).platform;
        if (screenSize.isLarge()) {
          if (kIsWeb) {
            if (desktopWeb != null) return desktopWeb!(context);
          }
          return desktop(context);
        } else if (screenSize.isMedium()) {
          if (kIsWeb) {
            if (tabletWeb != null) return tabletWeb!(context);
          } else {
            if (targetPlatform.isDesktopPlatform()) {
              if (tabletDesktop != null) return tabletDesktop!(context);
            }
          }
          return tablet(context);
        } else if (screenSize.isSmall()) {
          if (targetPlatform.isDesktopPlatform()) {
            if (mobileDesktop != null) return mobileDesktop!(context);
          }
        }

        if (screenSize.isSmall() && targetPlatform.isDesktopPlatform()) {}

        return mobile(context);
      },
    );
  }
}
