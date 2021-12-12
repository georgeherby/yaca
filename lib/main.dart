// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:crypto_app/app_router.dart';
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/core/models/favourites.dart';
import 'package:crypto_app/core/repositories/api/coingecko/exchange_ticker_repository.dart';
import 'package:crypto_app/core/repositories/api/coingecko/global_market_repository.dart';
import 'package:crypto_app/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:crypto_app/core/repositories/api/whalealerts/whale_transactions_repository.dart';
import 'package:crypto_app/core/repositories/favourites_repository.dart';
import 'package:crypto_app/core/repositories/preferences/api_tokens_preference.dart';
import 'package:crypto_app/core/repositories/preferences/currency_preference.dart';
import 'package:crypto_app/core/repositories/preferences/theme_preference.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_bloc.dart';

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
  BlocOverrides.runZoned(
    () {
      // ...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
  final _appRouter = AppRouter();

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
                  )..add(const LoadAppSettings())),
        ],
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
          builder: (context, state) {
            if (state is AppSettingsLoaded) {
              var currencyCode =
                  BlocProvider.of<AppSettingsBloc>(context).state.currency;
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
                child: MaterialApp.router(
                  routerDelegate: _appRouter.delegate(),
                  routeInformationParser: _appRouter.defaultRouteParser(),
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
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(color: Colors.black87, width: 1.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        errorStyle: const TextStyle(color: Colors.red)),
                    textTheme: GoogleFonts.openSansTextTheme(
                      ThemeData.light().textTheme,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      backgroundColor: LightThemeColors().appBarColour,
                      unselectedItemColor: Colors.black54,
                      unselectedIconTheme:
                          const IconThemeData(size: kBottomNavBarIconSize),
                      selectedIconTheme:
                          const IconThemeData(size: kBottomNavBarIconSize + 2),
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
                      iconTheme:
                          IconThemeData(color: Colors.black.withOpacity(0.70)),
                    ),
                    navigationRailTheme: NavigationRailThemeData(
                      backgroundColor: LightThemeColors().scaffoldBackground,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black54),
                      unselectedLabelTextStyle:
                          const TextStyle(color: Colors.black54),
                      selectedIconTheme:
                          IconThemeData(color: LightThemeColors().primary),
                      selectedLabelTextStyle:
                          TextStyle(color: LightThemeColors().primary),
                    ),
                    buttonTheme: ButtonThemeData(
                        buttonColor: LightThemeColors().primary),
                    scaffoldBackgroundColor:
                        LightThemeColors().scaffoldBackground,
                    iconTheme:
                        IconThemeData(color: Colors.black.withOpacity(0.70)),
                    chipTheme: ChipThemeData(
                      padding: const EdgeInsets.all(0),
                      elevation: 0,
                      pressElevation: 0,
                      brightness: Brightness.light,
                      checkmarkColor: Colors.white,
                      secondaryLabelStyle: const TextStyle(),
                      labelStyle: const TextStyle(color: Colors.black),
                      disabledColor: Colors.transparent,
                      backgroundColor: LightThemeColors().chipUnselectedColor,
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
                            Radius.circular(kCornerRadiusCirlcular),
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
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        errorStyle: const TextStyle(color: Colors.red)),
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
                            const TextStyle(color: Colors.white38),
                        unselectedIconTheme:
                            const IconThemeData(size: kBottomNavBarIconSize),
                        selectedIconTheme: const IconThemeData(
                            size: kBottomNavBarIconSize + 2),
                        selectedItemColor: Colors.white,
                        selectedLabelStyle:
                            const TextStyle(color: Colors.white)),
                    canvasColor: DarkThemeColors().cardBackground,
                    appBarTheme: AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                      elevation: 0,
                      foregroundColor: Colors.white,
                      color: DarkThemeColors().appBarColour,
                      iconTheme:
                          IconThemeData(color: Colors.white.withOpacity(0.87)),
                    ),
                    navigationRailTheme: NavigationRailThemeData(
                      backgroundColor: DarkThemeColors().scaffoldBackground,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.white38),
                      unselectedLabelTextStyle:
                          const TextStyle(color: Colors.white38),
                      selectedIconTheme:
                          const IconThemeData(color: Colors.white),
                      selectedLabelTextStyle:
                          const TextStyle(color: Colors.white),
                    ),
                    buttonTheme: ButtonThemeData(
                        buttonColor: LightThemeColors().primary),
                    scaffoldBackgroundColor:
                        DarkThemeColors().scaffoldBackground,
                    iconTheme:
                        IconThemeData(color: Colors.white.withOpacity(0.87)),
                    chipTheme: ChipThemeData(
                      padding: const EdgeInsets.all(0),
                      elevation: 0,
                      pressElevation: 0,
                      checkmarkColor: Colors.white,
                      brightness: Brightness.dark,
                      secondaryLabelStyle: const TextStyle(),
                      labelStyle: const TextStyle(color: Colors.white),
                      disabledColor: Colors.transparent,
                      backgroundColor: DarkThemeColors().chipUnselectedColor,
                      selectedColor: DarkThemeColors().chipSelectedColor,
                      secondarySelectedColor: LightThemeColors().primary,
                      shadowColor: Colors.transparent,
                      selectedShadowColor: Colors.transparent,
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    colorScheme:
                        ColorScheme.fromSwatch(brightness: Brightness.dark)
                            .copyWith(secondary: DarkThemeColors().secondary),
                  ),
                ),
              );
            }
            return PlatformCircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
