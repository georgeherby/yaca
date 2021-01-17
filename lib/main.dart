import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:crypto_app/core/viewmodels/app_settings_view_model.dart';
import 'package:crypto_app/old/api/whalealerts/whale_transactions_api.dart';
import 'package:crypto_app/old/market/widgets/app_bar_static.dart';
import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/screens/favourite_assets_screen.dart';
import 'package:crypto_app/ui/screens/top_100_screen.dart';

import 'core/viewmodels/asset_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppSettingsViewModel themeChangeProvider = AppSettingsViewModel();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  Future getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
    debugPrint("getCurrentAppTheme =  ${themeChangeProvider.darkTheme}");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppSettingsViewModel>(
          create: (_) => themeChangeProvider,
        ),
        ChangeNotifierProvider<AssetViewModel>(
          create: (_) => AssetViewModel(),
        ),
      ],
      child: Consumer<AppSettingsViewModel>(
        builder: (BuildContext context, AppSettingsViewModel vm, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: vm.darkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: LightThemeColors().primary,
              accentColor: LightThemeColors().accent,
              appBarTheme: AppBarTheme(
                elevation: 2,
                color: LightThemeColors().appBarColour,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              navigationRailTheme: NavigationRailThemeData(
                backgroundColor: LightThemeColors().scaffoldBackground,
                unselectedIconTheme: IconThemeData(color: Colors.black54),
                unselectedLabelTextStyle: TextStyle(color: Colors.black54),
                selectedIconTheme: IconThemeData(color: LightThemeColors().primary),
                selectedLabelTextStyle: TextStyle(color: LightThemeColors().primary),
              ),
              buttonTheme: ButtonThemeData(buttonColor: LightThemeColors().primary),
              scaffoldBackgroundColor: LightThemeColors().scaffoldBackground,
              iconTheme: IconThemeData(color: Colors.black),
              chipTheme: ChipThemeData(
                padding: EdgeInsets.all(0),
                elevation: 0,
                pressElevation: 0,
                brightness: Brightness.light,
                secondaryLabelStyle: TextStyle(),
                labelStyle: TextStyle(color: Colors.black),
                disabledColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                selectedColor: LightThemeColors().primary,
                secondarySelectedColor: LightThemeColors().primary,
                shadowColor: Colors.transparent,
                selectedShadowColor: Colors.transparent,
              ),
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: DarkThemeColors().primary,
              accentColor: DarkThemeColors().accent,
              appBarTheme: AppBarTheme(
                  elevation: 2,
                  color: DarkThemeColors().appBarColour,
                  brightness: Brightness.dark,
                  iconTheme: IconThemeData(color: Colors.white)),
              navigationRailTheme: NavigationRailThemeData(
                backgroundColor: DarkThemeColors().scaffoldBackground,
                unselectedIconTheme: IconThemeData(color: Colors.white54),
                unselectedLabelTextStyle: TextStyle(color: Colors.white54),
                selectedIconTheme: IconThemeData(color: DarkThemeColors().primary),
                selectedLabelTextStyle: TextStyle(color: DarkThemeColors().primary),
              ),
              buttonTheme: ButtonThemeData(buttonColor: LightThemeColors().primary),

              scaffoldBackgroundColor: DarkThemeColors().scaffoldBackground,
              iconTheme: IconThemeData(color: Colors.white),
              chipTheme: ChipThemeData(
                padding: EdgeInsets.all(0),
                elevation: 0,
                pressElevation: 0,
                brightness: Brightness.dark,
                secondaryLabelStyle: TextStyle(),
                labelStyle: TextStyle(color: Colors.white),
                disabledColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                selectedColor: LightThemeColors().primary,
                secondarySelectedColor: LightThemeColors().primary,
                shadowColor: Colors.transparent,
                selectedShadowColor: Colors.transparent,
              ),
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(key: const Key("home_screen_key"), title: 'Cryptocurrency'),
          );
        },
      ),
    );
  }
}

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
    return Scaffold(
      body: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: NavigationRail(
                minWidth: 55.0,
                groupAlignment: 0.0,
                selectedIndex: _selectedIndex, //_selectedIndex,
                onDestinationSelected: (int index) {
                  if (_selectedIndex != index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
                },
                labelType: NavigationRailLabelType.all,
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(CupertinoIcons.money_dollar_circle),
                      selectedIcon: Icon(CupertinoIcons.money_dollar_circle_fill),
                      label: Text(
                        "Prices",
                      )),
                  NavigationRailDestination(
                      icon: Icon(CupertinoIcons.star),
                      selectedIcon: Icon(CupertinoIcons.star_fill),
                      label: Text(
                        "Favourites",
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
                      icon: Icon(CupertinoIcons.tree),
                      selectedIcon: Icon(CupertinoIcons.tree),
                      label: Text(
                        "Whales",
                      ))
                ],
              ),
            ),
            IconButton(
              tooltip:
                  "Enable ${Provider.of<AppSettingsViewModel>(context, listen: false).darkTheme ? 'light mode' : 'dark mode'}",
              icon: Provider.of<AppSettingsViewModel>(context, listen: false).darkTheme
                  ? Icon(CupertinoIcons.sun_max)
                  : Icon(CupertinoIcons.moon),
              onPressed: () =>
                  Provider.of<AppSettingsViewModel>(context, listen: false).invertTheme(),
            )
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: showPage(_selectedIndex),
        ))
      ]),
    );
  }

  Widget showPage(int index) {
    switch (index) {
      case 0:
        return PricesScreen();
      case 1:
        return FavouriteAssetsScreen();
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
        return Scaffold(
          appBar: AppBarStatic(),
          body: FutureBuilder(
            future: fetchWhaleTransactions(http.Client()),
            builder: (BuildContext context, AsyncSnapshot<WhaleTransactions> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Icon(CupertinoIcons.exclamationmark),
                );
              }

              if (snapshot.hasData) {
                List<Transactions> trans = snapshot.data!.transactions.reversed.toList();

                return ListView.builder(
                    itemCount: trans.length,
                    itemBuilder: (context, index) {
                      Transactions transaction = trans[index];
                      DateTime date =
                          DateTime.fromMillisecondsSinceEpoch(transaction.timestamp * 1000);
                      DateFormat formatDate = DateFormat("HH:mm EEE dd MMM ");

                      // return ListTile(
                      //   leading: CircleAvatar(
                      //     child: Text(
                      //       "${transaction.symbol.toUpperCase()}",
                      //       textAlign: TextAlign.center,
                      //       maxLines: 1,
                      //     ),
                      //   ),
                      //   title: Text(
                      //       "${transaction.amount} ${transaction.symbol.toUpperCase()} for ${transaction.amountUsd.coinCurrencyFormat('en_US', false)}. Avg ${(transaction.amountUsd / transaction.amount).coinCurrencyFormat('en_US')}"),
                      //   subtitle: Text(
                      //       "From ${transaction.from.owner ?? "Unknown"} to ${transaction.to.owner ?? "Unknown"} "),
                      //   trailing: Text(formatDate.format(date)),
                      // );

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CircleAvatar(
                                child: Text(
                                  "${transaction.symbol.toUpperCase()}",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${transaction.amount} ${transaction.symbol.toUpperCase()} for ${transaction.amountUsd.coinCurrencyFormat('en_US', false)}"),
                                Text(
                                    "Avg ${(transaction.amountUsd / transaction.amount).coinCurrencyFormat('en_US')}"),
                                Text(
                                    "From ${transaction.from.owner ?? "Unknown"} to ${transaction.to.owner ?? "Unknown"} "),
                              ],
                            ),
                            Spacer(flex: 5),
                            Text(
                              formatDate.format(date),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: CupertinoActivityIndicator());
              }
            },
          ),
        );
      default:
        return Icon(CupertinoIcons.exclamationmark);
    }
  }
}
