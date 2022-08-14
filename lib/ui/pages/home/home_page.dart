// 🐦 Flutter imports:

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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isPhoneOnly = Theme.of(context).platform.onlyMobile(context);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: isPhoneOnly
          ? ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kCornerRadiusCircular * 3),
                topRight: Radius.circular(kCornerRadiusCircular * 3),
              ),
              child: NavigationBar(
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                onDestinationSelected: onTabTapped,
                selectedIndex: _selectedIndex,
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Ionicons.bar_chart_outline),
                    selectedIcon: Icon(Ionicons.bar_chart),
                    label: 'Market',
                    tooltip: 'Market overview',
                  ),
                  NavigationDestination(
                      icon: SvgPicture.asset('assets/whale_outline.svg',
                          semanticsLabel: 'Whale unselected icon',
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                      selectedIcon: SvgPicture.asset('assets/whale_filled.svg',
                          semanticsLabel: 'Whale selected icon',
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      tooltip: 'Whale transactions',
                      label: 'Whales'),
                ],
              ),
            )
          : null,
      body: SafeArea(
        bottom: false,
        child: Row(children: [
          if (isPhoneOnly)
            Container()
          else
            Column(
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
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          selectedIcon: SvgPicture.asset(
                            'assets/whale_filled.svg',
                            semanticsLabel: 'Whale selected icon',
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                          label: const Text(
                            'Whales',
                          ))
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: IconButton(
                      tooltip: 'Open settings',
                      onPressed: () => context.router
                          .push(const ApplicationSettingsHomeRoute()),
                      icon: Icon(Ionicons.cog_outline,
                          size: Theme.of(context).iconTheme.size),
                    ),
                  ),
                ),
              ],
            ),
          Expanded(
            child: showPage(_selectedIndex),
          )
        ]),
      ),
    );
  }

  Future<void> onTabTapped(int index) async {
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
        return 'market_overview';
      case 1:
        return 'whale_transactions';
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
