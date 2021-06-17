// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarStatic extends StatelessWidget with PreferredSizeWidget {
  final Widget body;
  final VoidCallback? refreshTapped;

  const AppBarStatic({Key? key, required this.body, this.refreshTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMobile = [TargetPlatform.iOS, TargetPlatform.android]
            .contains(Theme.of(context).platform) &&
        MediaQuery.of(context).size.width < 600;

    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: Theme.of(context).appBarTheme.elevation!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.25,
                    0.75,
                  ],
                  colors: [
                    // Color(0xFF5866DF),
                    // Color(0xFFF35491),
                    Color(0xFF385AEF),
                    Color(0xFF6725CD),
                  ]),
            ),
            child: Row(
              children: [
                Spacer(
                  flex: 5,
                ),
                isMobile
                    ? IconButton(
                        tooltip: 'Open settings',
                        onPressed: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => AppSettingsPage(),
                          ),
                        ),
                        icon: FaIcon(FontAwesomeIcons.cog),
                      )
                    : Container(),
                isMobile ? Spacer() : Container(),
                Expanded(
                  flex: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      body,
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                refreshTapped != null
                    ? IconButton(
                        icon: FaIcon(FontAwesomeIcons.syncAlt),
                        onPressed: refreshTapped)
                    : Container(),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
