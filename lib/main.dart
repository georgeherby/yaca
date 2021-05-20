import 'package:crypto_app/old/api/whalealerts/whale_transactions_api.dart';
import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/old/utils/view_builder/filter_list_bloc.dart';
import 'package:crypto_app/ui/screens/market_screen.dart';
import 'package:crypto_app/ui/screens/whale_transactions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:crypto_app/core/viewmodels/app_settings_view_model.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/screens/favourite_assets_screen.dart';

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
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
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
                cardTheme: CardTheme(
                  elevation: 0,
                  color: LightThemeColors().cardBackground,
                ),
                canvasColor: LightThemeColors().cardBackground,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: LightThemeColors().appBarColour,
                  brightness: Brightness.light,
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                navigationRailTheme: NavigationRailThemeData(
                  backgroundColor: LightThemeColors().scaffoldBackground,
                  unselectedIconTheme: IconThemeData(color: Colors.black54),
                  unselectedLabelTextStyle: TextStyle(color: Colors.black54),
                  selectedIconTheme:
                      IconThemeData(color: LightThemeColors().primary),
                  selectedLabelTextStyle:
                      TextStyle(color: LightThemeColors().primary),
                ),
                buttonTheme:
                    ButtonThemeData(buttonColor: LightThemeColors().primary),
                scaffoldBackgroundColor: LightThemeColors().scaffoldBackground,
                iconTheme: IconThemeData(color: Colors.black, size: 24),
                chipTheme: ChipThemeData(
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  pressElevation: 0,
                  brightness: Brightness.light,
                  checkmarkColor: Colors.white,
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
                cardTheme: CardTheme(
                  elevation: 0,
                  color: DarkThemeColors().cardBackground,
                ),
                canvasColor: DarkThemeColors().cardBackground,
                appBarTheme: AppBarTheme(
                    elevation: 0,
                    color: DarkThemeColors().appBarColour,
                    brightness: Brightness.dark,
                    iconTheme: IconThemeData(color: Colors.white)),
                navigationRailTheme: NavigationRailThemeData(
                  backgroundColor: DarkThemeColors().scaffoldBackground,
                  unselectedIconTheme: IconThemeData(color: Colors.white38),
                  unselectedLabelTextStyle: TextStyle(color: Colors.white38),
                  selectedIconTheme: IconThemeData(color: Colors.white),
                  selectedLabelTextStyle: TextStyle(color: Colors.white),
                ),
                buttonTheme:
                    ButtonThemeData(buttonColor: LightThemeColors().primary),

                scaffoldBackgroundColor: DarkThemeColors().scaffoldBackground,
                iconTheme: IconThemeData(color: Colors.white, size: 24),
                chipTheme: ChipThemeData(
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  pressElevation: 0,
                  checkmarkColor: Colors.white,
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
              home: BlocProvider(
                create: (_) => FilterListBloc<Transactions, String>(
                    WhaleTransactionReposiotry()),
                child: MyHomePage(
                    key: const Key("home_screen_key"), title: 'Cryptocurrency'),
              ));
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
      body: SafeArea(
        bottom: false,
        child: Row(children: [
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
                        selectedIcon:
                            Icon(CupertinoIcons.money_dollar_circle_fill),
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
                        icon: SvgPicture.asset(
                          "assets/001-whale.svg",
                          semanticsLabel: 'Whale unselected icon',
                          height: Theme.of(context).iconTheme.size,
                          width: Theme.of(context).iconTheme.size,
                          color: Theme.of(context)
                              .navigationRailTheme
                              .unselectedIconTheme
                              ?.color,
                        ),
                        selectedIcon: SvgPicture.asset(
                          "assets/002-whale-1.svg",
                          semanticsLabel: 'Whale selected icon',
                          height: Theme.of(context).iconTheme.size,
                          width: Theme.of(context).iconTheme.size,
                          color: Theme.of(context)
                              .navigationRailTheme
                              .selectedIconTheme
                              ?.color,
                        ),
                        label: Text(
                          "Whales",
                        ))
                  ],
                ),
              ),
              IconButton(
                tooltip:
                    "Enable ${Provider.of<AppSettingsViewModel>(context, listen: false).darkTheme ? 'light mode' : 'dark mode'}",
                icon: Provider.of<AppSettingsViewModel>(context, listen: false)
                        .darkTheme
                    ? Icon(CupertinoIcons.sun_max)
                    : Icon(CupertinoIcons.moon),
                onPressed: () =>
                    Provider.of<AppSettingsViewModel>(context, listen: false)
                        .invertTheme(),
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: showPage(_selectedIndex),
          ))
        ]),
      ),
    );
  }

  Widget showPage(int index) {
    switch (index) {
      case 0:
        return MarketScreen();
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
        return WhaleTransactionPage();
      default:
        return Icon(CupertinoIcons.exclamationmark);
    }
  }
}
