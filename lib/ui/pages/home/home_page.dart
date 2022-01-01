// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/market_overview/market_overview_view.dart';
import 'package:yaca/ui/views/whale_transactions/whale_transactions_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
          ? NavigationBar(
              onDestinationSelected: onTabTapped,
              selectedIndex: _selectedIndex,
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Ionicons.bar_chart_outline,
                    size: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedIconTheme
                        ?.size,
                  ),
                  selectedIcon: Icon(
                    Ionicons.bar_chart,
                    size: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedIconTheme
                        ?.size,
                  ),
                  label: 'Market',
                ),
                NavigationDestination(
                    icon: SvgPicture.asset('assets/whale_outline.svg',
                        semanticsLabel: 'Whale unselected icon',
                        height: kBottomNavBarIconSize,
                        width: kBottomNavBarIconSize,
                        color: Theme.of(context).iconTheme.color),
                    selectedIcon: SvgPicture.asset('assets/whale_filled.svg',
                        semanticsLabel: 'Whale selected icon',
                        height: kBottomNavBarIconSize,
                        width: kBottomNavBarIconSize,
                        color: Theme.of(context).iconTheme.color),
                    label: 'Whale transactions'),
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
                          const NavigationRailDestination(
                            icon: Icon(Ionicons.bar_chart_outline),
                            selectedIcon: Icon(Ionicons.bar_chart),
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
                              label: const Text(
                                'Whale trasactions',
                              ))
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Open settings',
                      onPressed: () =>
                          context.router.push(const AppSettingsHomeRoute()),
                      icon: Icon(Ionicons.cog,
                          size: Theme.of(context).iconTheme.size),
                    ),
                    const SizedBox(height: 8)
                  ],
                ),
          Expanded(
            child: showPage(_selectedIndex),
          )
        ]),
      ),
    );
  }

  void onTabTapped(int index) async {
    if (_selectedIndex != index) {
      // await FirebaseAnalytics.instance
      //     .setCurrentScreen(screenName: getScreenName(index));
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  String getScreenName(int index) {
    switch (index) {
      case 0:
        return "market_overview";
      case 1:
        return "whale_transactions";
      default:
        throw Exception('Unknown page index: $index');
    }
  }

  Widget showPage(int index) {
    switch (index) {
      case 0:
        return const MarketOverviewView();
      case 1:
        return const WhaleTransactionView();
      default:
        throw Exception('Unknown page index: $index');
    }
  }
}
