// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/preferences/currency_preference.dart';
import 'package:crypto_app/core/repositories/api/coingecko/global_market_repository.dart';
import 'package:crypto_app/core/repositories/api/coingecko/market_overview_api.dart';
import 'package:crypto_app/core/repositories/api/whalealerts/whale_transactions_api.dart';
import 'package:crypto_app/core/repositories/favouritess_repository.dart';
import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/pages/main/main_page.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'core/preferences/theme_preference.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
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
                ThemePreferenceRepository(), CurrencyPreferenceRepository())
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
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        unselectedItemColor: Colors.black54,
                        selectedItemColor: LightThemeColors().primary,
                      ),
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
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          unselectedItemColor: Colors.white38,
                          unselectedLabelStyle:
                              TextStyle(color: Colors.white38),
                          selectedItemColor: Colors.white,
                          selectedLabelStyle: TextStyle(color: Colors.white)),
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
