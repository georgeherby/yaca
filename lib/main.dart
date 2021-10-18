// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/core/models/favourites.dart';
import 'package:crypto_app/core/repositories/api/coingecko/global_market_repository.dart';
import 'package:crypto_app/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:crypto_app/core/repositories/api/whalealerts/whale_transactions_repository.dart';
import 'package:crypto_app/core/repositories/favourites_repository.dart';
import 'package:crypto_app/core/repositories/preferences/api_tokens_preference.dart';
import 'package:crypto_app/core/repositories/preferences/currency_preference.dart';
import 'package:crypto_app/core/repositories/preferences/theme_preference.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/pages/main/main_page.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_bloc.dart';
import 'core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'core/repositories/api/coingecko/exchange_ticker_repository.dart';

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

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(FavouritesAdapter());
  // Opening the box
  await Hive.openBox<Favourites>('favBox');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Box<Favourites> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<Favourites>('favBox');
  }

  final http.Client _client = http.Client();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (BuildContext context) => ThemePreferenceRepository()),
        RepositoryProvider(
            create: (BuildContext context) => CurrencyPreferenceRepository()),
        RepositoryProvider(
            create: (BuildContext context) => ApiTokensPreference()),
        RepositoryProvider(
            create: (BuildContext context) =>
                GlobalMarketRespository(client: _client)),
        RepositoryProvider(
            create: (BuildContext context) =>
                MarketOverviewRepository(_client)),
        RepositoryProvider(
            create: (BuildContext context) =>
                ExchangeTickerRespository(_client)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppSettingsBloc>(
              create: (BuildContext context) => AppSettingsBloc(
                    context.read<ThemePreferenceRepository>(),
                    context.read<CurrencyPreferenceRepository>(),
                  )..add(LoadAppSettings())),
        ],
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
          builder: (context, state) {
            if (state is AppSettingsLoaded) {
              var currencyCode =
                  BlocProvider.of<AppSettingsBloc>(context).state.currency;

              print('SETTINGS REBUILD $currencyCode');

              return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (_) => FilterListBloc<WhaleTransaction, String>(
                            WhaleTransactionReposiotry(
                                apiPreferences:
                                    context.read<ApiTokensPreference>()))),
                    BlocProvider<GlobalMarketBloc>(
                      create: (BuildContext context) => GlobalMarketBloc(
                        context.read<GlobalMarketRespository>(),
                      )..add(GlobalMarketLoad(currencyCode)),
                    ),
                    BlocProvider<AssetOverviewBloc>(
                      create: (BuildContext context) => AssetOverviewBloc(
                          BlocProvider.of<AppSettingsBloc>(context),
                          FavouritesDao(box: box),
                          context.read<MarketOverviewRepository>())
                        ..add(AssetOverviewLoad(currencyCode)),
                    ),
                    BlocProvider<SingleAssetExchangeBloc>(
                      create: (_) => SingleAssetExchangeBloc(
                        exchangeTickerRespository:
                            context.read<ExchangeTickerRespository>(),
                      ),
                    )
                  ],
                  child: MaterialApp(
                      title: 'Crypo App',
                      debugShowCheckedModeBanner: false,
                      themeMode: state.theme,
                      theme: ThemeData.light().copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black87, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                            ),
                            errorStyle: TextStyle(color: Colors.red)),
                        textTheme: GoogleFonts.openSansTextTheme(
                          ThemeData.light().textTheme,
                        ),
                        bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          backgroundColor: LightThemeColors().appBarColour,
                          unselectedItemColor: Colors.black54,
                          unselectedIconTheme:
                              IconThemeData(size: kBottomNavBarIconSize),
                          selectedIconTheme:
                              IconThemeData(size: kBottomNavBarIconSize + 2),
                          selectedItemColor: LightThemeColors().primary,
                          selectedLabelStyle: TextStyle(
                            color: LightThemeColors().primary,
                          ),
                        ),
                        brightness: Brightness.light,
                        primaryColor: LightThemeColors().primary,
                        cardTheme: CardTheme(
                          elevation: 0,
                          color: LightThemeColors().cardBackground,
                        ),
                        canvasColor: LightThemeColors().cardBackground,
                        appBarTheme: AppBarTheme(
                          systemOverlayStyle: SystemUiOverlayStyle.dark,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          color: LightThemeColors().appBarColour,
                          iconTheme: IconThemeData(
                              color: Colors.black.withOpacity(0.70)),
                        ),
                        navigationRailTheme: NavigationRailThemeData(
                          backgroundColor:
                              LightThemeColors().scaffoldBackground,
                              
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
                        iconTheme: IconThemeData(
                            color: Colors.black.withOpacity(0.70)),
                        chipTheme: ChipThemeData(
                          padding: EdgeInsets.all(0),
                          elevation: 0,
                          pressElevation: 0,
                          brightness: Brightness.light,
                          checkmarkColor: Colors.white,
                          secondaryLabelStyle: TextStyle(),
                          labelStyle: TextStyle(color: Colors.black),
                          disabledColor: Colors.transparent,
                          backgroundColor:
                              LightThemeColors().chipUnselectedColor,
                          selectedColor: LightThemeColors().chipSelectedColor,
                          secondarySelectedColor: LightThemeColors().primary,
                          shadowColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                        ),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        colorScheme: ColorScheme.fromSwatch(
                          brightness: Brightness.light,
                        ).copyWith(secondary: LightThemeColors().secondary),
                      ),
                      darkTheme: ThemeData.dark().copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.87),
                                  width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                            ),
                            errorStyle: TextStyle(color: Colors.red)),
                        textTheme: GoogleFonts.openSansTextTheme(
                          ThemeData.dark().textTheme,
                        ),
                        brightness: Brightness.dark,
                        primaryColor: DarkThemeColors().primary,
                        cardTheme: CardTheme(
                          elevation: 0,
                          color: DarkThemeColors().cardBackground,
                        ),
                        bottomNavigationBarTheme: BottomNavigationBarThemeData(
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            backgroundColor: DarkThemeColors().appBarColour,
                            unselectedItemColor: Colors.white38,
                            unselectedLabelStyle:
                                TextStyle(color: Colors.white38),
                            unselectedIconTheme:
                                IconThemeData(size: kBottomNavBarIconSize),
                            selectedIconTheme:
                                IconThemeData(size: kBottomNavBarIconSize + 2),
                            selectedItemColor: Colors.white,
                            selectedLabelStyle: TextStyle(color: Colors.white)),
                        canvasColor: DarkThemeColors().cardBackground,
                        appBarTheme: AppBarTheme(
                          systemOverlayStyle: SystemUiOverlayStyle.light,
                          elevation: 0,
                          foregroundColor: Colors.white,
                          color: DarkThemeColors().appBarColour,
                          iconTheme: IconThemeData(
                              color: Colors.white.withOpacity(0.87)),
                        ),
                        navigationRailTheme: NavigationRailThemeData(
                          backgroundColor: DarkThemeColors().scaffoldBackground,
                          unselectedIconTheme:
                              IconThemeData(color: Colors.white38),
                          unselectedLabelTextStyle:
                              TextStyle(color: Colors.white38),
                          selectedIconTheme: IconThemeData(color: Colors.white),
                          selectedLabelTextStyle:
                              TextStyle(color: Colors.white),
                        ),
                        buttonTheme: ButtonThemeData(
                            buttonColor: LightThemeColors().primary),
                        scaffoldBackgroundColor:
                            DarkThemeColors().scaffoldBackground,
                        iconTheme: IconThemeData(
                            color: Colors.white.withOpacity(0.87)),
                        chipTheme: ChipThemeData(
                          padding: EdgeInsets.all(0),
                          elevation: 0,
                          pressElevation: 0,
                          checkmarkColor: Colors.white,
                          brightness: Brightness.dark,
                          secondaryLabelStyle: TextStyle(),
                          labelStyle: TextStyle(color: Colors.white),
                          disabledColor: Colors.transparent,
                          backgroundColor:
                              DarkThemeColors().chipUnselectedColor,
                          selectedColor: DarkThemeColors().chipSelectedColor,
                          secondarySelectedColor: LightThemeColors().primary,
                          shadowColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                        ),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        colorScheme: ColorScheme.fromSwatch(
                                brightness: Brightness.dark)
                            .copyWith(secondary: DarkThemeColors().secondary),
                      ),
                      home: MyHomePage(
                          key: const Key('home_screen_key'),
                          title: 'Cryptocurrency')));
            }
            return CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
