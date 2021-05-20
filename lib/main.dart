import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/preferences/currency_preference.dart';
import 'package:crypto_app/old/api/coingecko/global_market_repository.dart';
import 'package:crypto_app/old/api/coingecko/market_overview_api.dart';
import 'package:crypto_app/old/api/whalealerts/whale_transactions_api.dart';
import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/old/utils/view_builder/filter_list_bloc.dart';
import 'package:crypto_app/ui/screens/market_screen.dart';
import 'package:crypto_app/ui/screens/settings_screen.dart';
import 'package:crypto_app/ui/screens/whale_transactions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/screens/favourite_assets_screen.dart';
import 'package:http/http.dart' as http;

import 'core/preferences/dark_theme_preference.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AppSettingsViewModel appSettingsChangeProvider = AppSettingsViewModel();

  @override
  void initState() {
    super.initState();
  }

  final http.Client _client = http.Client();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(
            create: (BuildContext context) => AppSettingsBloc(
                DarkThemePreferenceRepository(), CurrencyPreferenceRepository())
              ..add(LoadAppSettings())),
      ],
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          if (state is AppSettingsLoaded) {
            var currencyCode = BlocProvider.of<AppSettingsBloc>(context)
                .state
                .currency
                .currencyCode;

            return MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (_) => FilterListBloc<Transactions, String>(
                          WhaleTransactionReposiotry())),
                  BlocProvider<GlobalMarketBloc>(
                    create: (BuildContext context) => GlobalMarketBloc(
                      GlobalMarketRespository(
                          client: _client, currencyCode: currencyCode),
                    )..add(GlobalMarketLoad()),
                  ),
                  BlocProvider<AssetOverviewBloc>(
                    create: (BuildContext context) => AssetOverviewBloc(
                        FavouritesDao(),
                        MarketOverviewRepository(_client, currencyCode))
                      ..add(AssetOverviewLoad()),
                  )
                ],
                child: MaterialApp(
                    title: 'Crypo App',
                    debugShowCheckedModeBanner: false,
                    themeMode: state.theme,
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
                        titleTextStyle:
                            TextStyle(color: Colors.black, inherit: true),
                        color: LightThemeColors().appBarColour,
                        brightness: Brightness.light,
                        iconTheme: IconThemeData(color: Colors.black),
                      ),
                      navigationRailTheme: NavigationRailThemeData(
                        backgroundColor: LightThemeColors().scaffoldBackground,
                        unselectedIconTheme:
                            IconThemeData(color: Colors.black54),
                        unselectedLabelTextStyle:
                            TextStyle(color: Colors.black54),
                        selectedIconTheme:
                            IconThemeData(color: LightThemeColors().primary),
                        selectedLabelTextStyle:
                            TextStyle(color: LightThemeColors().primary),
                      ),
                      buttonTheme: ButtonThemeData(
                          buttonColor: LightThemeColors().primary),
                      scaffoldBackgroundColor:
                          LightThemeColors().scaffoldBackground,
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
                          titleTextStyle:
                              TextStyle(color: Colors.white, inherit: true),
                          color: DarkThemeColors().appBarColour,
                          brightness: Brightness.dark,
                          iconTheme: IconThemeData(color: Colors.white)),
                      navigationRailTheme: NavigationRailThemeData(
                        backgroundColor: DarkThemeColors().scaffoldBackground,
                        unselectedIconTheme:
                            IconThemeData(color: Colors.white38),
                        unselectedLabelTextStyle:
                            TextStyle(color: Colors.white38),
                        selectedIconTheme: IconThemeData(color: Colors.white),
                        selectedLabelTextStyle: TextStyle(color: Colors.white),
                      ),
                      buttonTheme: ButtonThemeData(
                          buttonColor: LightThemeColors().primary),
                      scaffoldBackgroundColor:
                          DarkThemeColors().scaffoldBackground,
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
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                    home: MyHomePage(
                        key: const Key('home_screen_key'),
                        title: 'Cryptocurrency')));
          }

          return CupertinoActivityIndicator();
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
                          'Prices',
                        )),
                    NavigationRailDestination(
                        icon: Icon(CupertinoIcons.star),
                        selectedIcon: Icon(CupertinoIcons.star_fill),
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
                          'assets/001-whale.svg',
                          semanticsLabel: 'Whale unselected icon',
                          height: Theme.of(context).iconTheme.size,
                          width: Theme.of(context).iconTheme.size,
                          color: Theme.of(context)
                              .navigationRailTheme
                              .unselectedIconTheme
                              ?.color,
                        ),
                        selectedIcon: SvgPicture.asset(
                          'assets/002-whale-1.svg',
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
                    builder: (context) => SettingsScreen(),
                  ),
                ),
                icon: Icon(CupertinoIcons.settings),
              ),
              Divider(color: Colors.transparent)
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
