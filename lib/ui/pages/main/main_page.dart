// 🐦 Flutter imports:
import 'package:crypto_app/ui/views/widgets/favourite_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_svg/svg.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/views/favourite_assets/favourite_assets_view.dart';
import 'package:crypto_app/ui/views/market_overview/market_overview_view.dart';
import 'package:crypto_app/ui/views/whale_transactions/whale_transactions_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var isMobile = [TargetPlatform.iOS, TargetPlatform.android]
            .contains(Theme.of(context).platform) &&
        MediaQuery.of(context).size.width < 600;

    return Scaffold(
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              showUnselectedLabels: false,
              onTap: onTabTapped, // new
              currentIndex: _selectedIndex, // new
              items: [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
                  activeIcon: FaIcon(FontAwesomeIcons.solidMoneyBillAlt),
                  label: 'Prices',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.star),
                  activeIcon: FaIcon(FontAwesomeIcons.solidStar),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/whale_outline.svg',
                      semanticsLabel: 'Whale unselected icon',
                      height: Theme.of(context).iconTheme.size,
                      width: Theme.of(context).iconTheme.size,
                      color: Theme.of(context)
                          .navigationRailTheme
                          .unselectedIconTheme
                          ?.color,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/whale_filled.svg',
                      semanticsLabel: 'Whale selected icon',
                      height: Theme.of(context).iconTheme.size,
                      width: Theme.of(context).iconTheme.size,
                      color: Theme.of(context)
                          .navigationRailTheme
                          .selectedIconTheme
                          ?.color,
                    ),
                    label: 'Whales')
              ],
            )
          : null,
      body: SafeArea(
        bottom: false,
        child: Row(children: [
          isMobile
              ? Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: NavigationRail(
                        minWidth: 55.0,
                        groupAlignment: 0.0,
                        selectedIndex: _selectedIndex, //_selectedIndex,
                        onDestinationSelected: onTabTapped,
                        labelType: NavigationRailLabelType.all,
                        destinations: [
                          NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
                              selectedIcon:
                                  FaIcon(FontAwesomeIcons.solidMoneyBillAlt),
                              label: Text(
                                'Prices',
                              )),
                          NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.star),
                              selectedIcon: FaIcon(FontAwesomeIcons.solidStar),
                              label: Text(
                                'Favourites',
                              )),
                          // NavigationRailDestination(
                          //     icon: Icon(CupertinoIcons.triangle),
                          //     selectedIcon: Icon(CupertinoIcons.triangle_fill),
                          //     label: Text(
                          //       "Portfolio",
                          //     )),
                          // NavigationRailDestination(
                          //     icon: Icon(CupertinoIcons.news),
                          //     selectedIcon: Icon(CupertinoIcons.news_solid),
                          //     label: Text(
                          //       "News",
                          //     ))
                          NavigationRailDestination(
                              icon: SvgPicture.asset(
                                'assets/whale_outline.svg',
                                semanticsLabel: 'Whale unselected icon',
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size,
                                color: Theme.of(context)
                                    .navigationRailTheme
                                    .unselectedIconTheme
                                    ?.color,
                              ),
                              selectedIcon: SvgPicture.asset(
                                'assets/whale_filled.svg',
                                semanticsLabel: 'Whale selected icon',
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size,
                                color: Theme.of(context)
                                    .navigationRailTheme
                                    .selectedIconTheme
                                    ?.color,
                              ),
                              label: Text(
                                'Whales',
                              ))
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Open settings',
                      onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => AppSettingsPage(),
                        ),
                      ),
                      icon: FaIcon(FontAwesomeIcons.cog),
                    ),
                    Divider(color: Colors.transparent)
                  ],
                ),
          Expanded(
              child: Padding(
            padding: isMobile
                ? const EdgeInsets.only(right: 8.0, left: 8.0)
                : const EdgeInsets.only(right: 8.0),
            child: showPage(_selectedIndex),
          ))
        ]),
      ),
    );
  }

  void onTabTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget showPage(int index) {
    switch (index) {
      case 0:
        return MarketOverviewView();
      case 1:
        return FavouriteAssetsView();
      // case 2:
      //   return Expanded(
      //     child: Scaffold(
      //       body: Center(
      //         child: Text("Portfolio"),
      //       ),
      //     ),
      //   );
      // case 2:
      //   return Expanded(
      //     child: Scaffold(
      //       body: Center(
      //         child: Text("News"),
      //       ),
      //     ),
      //   );
      case 2:
        return WhaleTransactionView();
      default:
        return Icon(CupertinoIcons.exclamationmark);
    }
  }
}
