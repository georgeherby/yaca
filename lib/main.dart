// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/coingecko_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/global_market/global_market_bloc.dart';
import 'package:yaca/core/bloc/search/search_bloc.dart';
import 'package:yaca/core/bloc/single_asset_exchange/single_asset_exchange_bloc.dart';
import 'package:yaca/core/bloc/trending/trending_bloc.dart';
import 'package:yaca/core/bloc/utils/all_bloc_observer.dart';
import 'package:yaca/core/models/api/whale_alerts/whale_transactions.dart';
import 'package:yaca/core/models/favourites.dart';
import 'package:yaca/core/repositories/api/coingecko/coin_list_repository.dart';
import 'package:yaca/core/repositories/api/coingecko/exchange_ticker_repository.dart';
import 'package:yaca/core/repositories/api/coingecko/global_market_repository.dart';
import 'package:yaca/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:yaca/core/repositories/api/coingecko/trending_asset_repository.dart';
import 'package:yaca/core/repositories/api/whale_alerts/whale_transactions_repository.dart';
import 'package:yaca/core/repositories/favourites_repository.dart';
import 'package:yaca/core/repositories/preferences/api_tokens_preference.dart';
import 'package:yaca/core/repositories/preferences/asset_overview_preference.dart';
import 'package:yaca/core/repositories/preferences/currency_preference.dart';
import 'package:yaca/core/repositories/preferences/theme_preference.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/consts/lib_color_schemes.g.dart';
import 'package:yaca/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:yaca/firebase_options.dart';

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
  await Hive.openBox<Favourites>('favouritesBox');
  Bloc.observer = AllBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Box<Favourites> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<Favourites>('favouritesBox');
  }

  final CoinGeckoApi _api = CoinGeckoApi();
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
            create: (BuildContext context) => GlobalMarketRepository(_api)),
        RepositoryProvider(
            create: (BuildContext context) => MarketOverviewRepository(_api)),
        RepositoryProvider(
            create: (BuildContext context) => ExchangeTickerRepository(_api)),
        RepositoryProvider(
            create: (BuildContext context) => CoinListRepository(_api)),
        RepositoryProvider(
            create: (BuildContext context) => TrendingAssetRepository(_api)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ApplicationSettingsBloc>(
              create: (BuildContext context) => ApplicationSettingsBloc(
                    context.read<ThemePreferenceRepository>(),
                    context.read<CurrencyPreferenceRepository>(),
                  )..add(const LoadApplicationSettings())),
        ],
        child: BlocBuilder<ApplicationSettingsBloc, ApplicationSettingsState>(
          builder: (context, state) {
            if (state is ApplicationSettingsLoaded) {
              final currencyCode =
                  BlocProvider.of<ApplicationSettingsBloc>(context)
                      .state
                      .currency;
              return MultiBlocProvider(
                providers: [
                  BlocProvider<FilterListBloc<WhaleTransaction, String>>(
                      create: (BuildContext context) =>
                          FilterListBloc<WhaleTransaction, String>(
                              WhaleTransactionReposiotry(
                                  apiPreferences:
                                      context.read<ApiTokensPreference>()))),
                  BlocProvider<GlobalMarketBloc>(
                    create: (BuildContext context) => GlobalMarketBloc(
                      context.read<GlobalMarketRepository>(),
                    )..add(GlobalMarketLoad(currencyCode)),
                  ),
                  BlocProvider<AssetOverviewBloc>(
                    create: (BuildContext context) => AssetOverviewBloc(
                      BlocProvider.of<ApplicationSettingsBloc>(context),
                      FavouritesDao(box: box),
                      context.read<MarketOverviewRepository>(),
                      context.read<AssetOverviewPreference>(),
                    )..add(const AssetOverviewLoad()),
                  ),
                  BlocProvider<SearchBloc>(
                      lazy: false,
                      create: (BuildContext context) => SearchBloc(
                            context.read<CoinListRepository>(),
                          )..add(const GetAssetListEvent())),
                  BlocProvider<TrendingBloc>(
                      lazy: false,
                      create: (BuildContext context) => TrendingBloc(
                            context.read<TrendingAssetRepository>(),
                          )..add(const LoadTrending())),
                  BlocProvider<SingleAssetExchangeBloc>(
                    create: (BuildContext context) => SingleAssetExchangeBloc(
                      exchangeTickerRepository:
                          context.read<ExchangeTickerRepository>(),
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
                      useMaterial3: true,
                      scaffoldBackgroundColor: lightColorScheme.background,
                      textTheme: GoogleFonts.ibmPlexSansTextTheme(
                        ThemeData.light().textTheme,
                      ),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      applyElevationOverlayColor: true,
                      colorScheme: lightColorScheme),
                  darkTheme: ThemeData.dark().copyWith(
                      useMaterial3: true,
                      scaffoldBackgroundColor: darkColorScheme.background,
                      textTheme: GoogleFonts.ibmPlexSansTextTheme(
                        ThemeData.dark().textTheme,
                      ),
                      brightness: Brightness.dark,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      applyElevationOverlayColor: true,
                      colorScheme: darkColorScheme),
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
