// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/views/market_overview/market_overview_view.dart';
import 'package:crypto_app/ui/views/whale_transactions/whale_transactions_view.dart';

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
    var _isPhoneOnly = Theme.of(context).platform.onlyMobile(context);

    return Scaffold(
      bottomNavigationBar: _isPhoneOnly
          ? BottomNavigationBar(
              onTap: onTabTapped, // new
              currentIndex: _selectedIndex, // new
              items: [
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.chartBar,
                    size: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedIconTheme
                        ?.size,
                  ),
                  activeIcon: FaIcon(
                    FontAwesomeIcons.solidChartBar,
                    size: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedIconTheme
                        ?.size,
                  ),
                  label: 'Market',
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/whale_outline.svg',
                      semanticsLabel: 'Whale unselected icon',
                      height: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme
                          ?.size,
                      width: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme
                          ?.size,
                      color: Theme.of(context)
                          .navigationRailTheme
                          .unselectedIconTheme
                          ?.color,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/whale_filled.svg',
                      semanticsLabel: 'Whale selected icon',
                      height: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme
                          ?.size,
                      width: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme
                          ?.size,
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
          _isPhoneOnly
              ? Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: NavigationRail(
                        minWidth: 80.0,
                        groupAlignment: 0.0,
                        selectedIndex: _selectedIndex, //_selectedIndex,
                        onDestinationSelected: onTabTapped,
                        labelType: NavigationRailLabelType.all,
                        destinations: [
                          NavigationRailDestination(
                            icon: FaIcon(FontAwesomeIcons.chartBar),
                            selectedIcon:
                                FaIcon(FontAwesomeIcons.solidChartBar),
                            label: Text(
                              'Market',
                            ),
                          ),

                          // NavigationRailDestination(
                          //  icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
                          //       selectedIcon:
                          //           FaIcon(FontAwesomeIcons.solidMoneyBillAlt),
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
                        platformPageRoute(
                          context: context,
                          fullscreenDialog: true,
                          builder: (context) => AppSettingsPage(),
                        ),
                      ),
                      icon: FaIcon(FontAwesomeIcons.cog),
                    ),
                    SizedBox(height: 8)
                  ],
                ),
          Expanded(
            child: showPage(_selectedIndex),
          )
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
        return WhaleTransactionView();
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
      // case 2:
      //   return WhaleTransactionView();
      default:
        return Text('Uknown page');
    }
  }
}
