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
        MediaQuery.of(context).size.width < 480;

    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: Theme.of(context).appBarTheme.elevation!,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor
                // gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     stops: [
                //       0.20,
                //       0.80,
                //     ],
                //     colors: [
                //       // Color(0xFF385AEF),
                //       // Color(0xFF6725CD),
                //       Theme.of(context).primaryColor,
                //       Theme.of(context).accentColor,
                //     ]),
                ),
            child: Row(
              children: [
                isMobile ? SizedBox(width: 8) : Container(),
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
                        tooltip: 'Refresh',
                        onPressed: refreshTapped)
                    : Container(),
                refreshTapped != null ? SizedBox(width: 8) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 1.5);
}
