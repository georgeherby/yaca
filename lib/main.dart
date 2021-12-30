// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

// 🌎 Project imports:
import 'firebase_options.dart';
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:yaca/core/models/api/whalealerts/whale_transactions.dart';
import 'package:yaca/core/models/favourites.dart';
import 'package:yaca/core/repositories/api/coingecko/exchange_ticker_repository.dart';
import 'package:yaca/core/repositories/api/coingecko/global_market_repository.dart';
import 'package:yaca/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:yaca/core/repositories/api/whalealerts/whale_transactions_repository.dart';
import 'package:yaca/core/repositories/favourites_repository.dart';
import 'package:yaca/core/repositories/preferences/api_tokens_preference.dart';
import 'package:yaca/core/repositories/preferences/asset_overview_preference.dart';
import 'package:yaca/core/repositories/preferences/currency_preference.dart';
import 'package:yaca/core/repositories/preferences/theme_preference.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/view_builder/filter_list_bloc.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Disable debugPrint in release mode
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

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

  // await FirebaseAnalytics.instance.logAppOpen();
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
            create: (BuildContext context) => AssetOverviewPreference()),
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
                      context.read<MarketOverviewRepository>(),
                      context.read<AssetOverviewPreference>(),
                    )..add(AssetOverviewLoad(
                        currencyCode,
                      )),
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
                  title: kAppName,
                  debugShowCheckedModeBanner: false,
                  themeMode: state.theme,
                  theme: ThemeData.light().copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: LightThemeColors().textInputBackground,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide(
                              color: LightThemeColors().errorColor,
                              width: kInputBorderWeighting),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide(
                              color: LightThemeColors().errorColor,
                              width: kInputBorderWeighting),
                        ),
                        errorStyle:
                            TextStyle(color: LightThemeColors().errorColor)),
                    textTheme: GoogleFonts.openSansTextTheme(
                      ThemeData.light().textTheme,
                    ),
                    navigationBarTheme: NavigationBarThemeData(
                      iconTheme: MaterialStateProperty.all(IconThemeData(
                          size: kBottomNavBarIconSize,
                          color: LightThemeColors().iconColor)),
                      height: kBottomNavigationBarHeight,
                      labelBehavior:
                          NavigationDestinationLabelBehavior.alwaysHide,
                      backgroundColor: LightThemeColors().cardBackground,
                      indicatorColor:
                          LightThemeColors().primary.withOpacity(0.5),
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
                      foregroundColor: LightThemeColors().textColor,
                      color: LightThemeColors().appBarColour,
                      iconTheme:
                          IconThemeData(color: LightThemeColors().iconColor),
                    ),
                    navigationRailTheme: NavigationRailThemeData(
                      backgroundColor: LightThemeColors().scaffoldBackground,
                      unselectedIconTheme: IconThemeData(
                          color: LightThemeColors().unSelectedColor),
                      unselectedLabelTextStyle:
                          TextStyle(color: LightThemeColors().unSelectedColor),
                      selectedIconTheme:
                          IconThemeData(color: LightThemeColors().primary),
                      selectedLabelTextStyle:
                          TextStyle(color: LightThemeColors().primary),
                    ),
                    scaffoldBackgroundColor:
                        LightThemeColors().scaffoldBackground,
                    iconTheme:
                        IconThemeData(color: LightThemeColors().iconColor),
                    chipTheme: ChipThemeData(
                      padding: const EdgeInsets.all(0),
                      elevation: 0,
                      pressElevation: 0,
                      brightness: Brightness.light,
                      checkmarkColor: LightThemeColors().chipUnselectedColor,
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
                        filled: true,
                        fillColor: DarkThemeColors().textInputBackground,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide(
                              color: DarkThemeColors().errorColor,
                              width: kInputBorderWeighting),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(kCornerRadiusCirlcular),
                          ),
                          borderSide: BorderSide(
                              color: DarkThemeColors().errorColor,
                              width: kInputBorderWeighting),
                        ),
                        errorStyle:
                            TextStyle(color: DarkThemeColors().errorColor)),
                    textTheme: GoogleFonts.openSansTextTheme(
                      ThemeData.dark().textTheme,
                    ),
                    brightness: Brightness.dark,
                    primaryColor: DarkThemeColors().primary,
                    cardTheme: CardTheme(
                      elevation: 0,
                      color: DarkThemeColors().cardBackground,
                    ),
                    navigationBarTheme: NavigationBarThemeData(
                      iconTheme: MaterialStateProperty.all(IconThemeData(
                          size: kBottomNavBarIconSize,
                          color: DarkThemeColors().iconColor)),
                      height: kBottomNavigationBarHeight,
                      labelBehavior:
                          NavigationDestinationLabelBehavior.alwaysHide,
                      backgroundColor: DarkThemeColors().cardBackground,
                      indicatorColor:
                          DarkThemeColors().primary.withOpacity(0.5),
                    ),
                    canvasColor: DarkThemeColors().cardBackground,
                    appBarTheme: AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                      elevation: 0,
                      foregroundColor: DarkThemeColors().textColor,
                      color: DarkThemeColors().appBarColour,
                      iconTheme:
                          IconThemeData(color: DarkThemeColors().iconColor),
                    ),
                    navigationRailTheme: NavigationRailThemeData(
                      backgroundColor: DarkThemeColors().scaffoldBackground,
                      unselectedIconTheme: IconThemeData(
                          color: DarkThemeColors().unSelectedColor),
                      unselectedLabelTextStyle:
                          TextStyle(color: DarkThemeColors().unSelectedColor),
                      selectedIconTheme: IconThemeData(
                          color: DarkThemeColors().chipSelectedColor),
                      selectedLabelTextStyle:
                          TextStyle(color: DarkThemeColors().chipSelectedColor),
                    ),
                    scaffoldBackgroundColor:
                        DarkThemeColors().scaffoldBackground,
                    iconTheme:
                        IconThemeData(color: DarkThemeColors().iconColor),
                    chipTheme: ChipThemeData(
                      padding: const EdgeInsets.all(0),
                      elevation: 0,
                      pressElevation: 0,
                      checkmarkColor: DarkThemeColors().chipUnselectedColor,
                      brightness: Brightness.dark,
                      secondaryLabelStyle: const TextStyle(),
                      labelStyle: const TextStyle(color: Colors.white),
                      disabledColor: Colors.transparent,
                      backgroundColor: DarkThemeColors().chipUnselectedColor,
                      selectedColor: DarkThemeColors().chipSelectedColor,
                      secondarySelectedColor: DarkThemeColors().primary,
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
