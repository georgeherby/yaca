// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/app_router.dart';
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/ui/views/market_overview/market_overview_view.dart';
import 'package:crypto_app/ui/views/whale_transactions/whale_transactions_view.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                    ),
                    activeIcon: SvgPicture.asset('assets/whale_filled.svg',
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
                            .bottomNavigationBarTheme
                            .selectedItemColor),
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
                      onPressed: () =>
                          context.router.push(const AppSettingsHomeRoute()),
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
      default:
        return Text('Uknown page');
    }
  }
}
