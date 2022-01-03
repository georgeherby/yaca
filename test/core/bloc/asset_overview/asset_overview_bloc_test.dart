// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/models/favourites.dart';
import 'package:yaca/core/models/sort_type.dart';
import 'package:yaca/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:yaca/core/repositories/favourites_repository.dart';
import 'package:yaca/core/repositories/preferences/asset_overview_preference.dart';
import 'mock/asset_overview_data.dart';

class MockFavouritesDao extends Mock implements FavouritesDao {}

class MockMarketOverviewRepository extends Mock
    implements MarketOverviewRepository {}

class MockAppSettingsBloc extends Mock implements AppSettingsBloc {}

class MockAssetOverviewPreferneces extends Mock
    implements AssetOverviewPreference {}

void main() {
  var mockFavouritesDao = MockFavouritesDao();
  var mockMarketOverviewRepository = MockMarketOverviewRepository();
  var mockAppSettingsBloc = MockAppSettingsBloc();
  var mockAssetOverviewPreferneces = MockAssetOverviewPreferneces();
  var defaultCurrency = AvailableCurrencies.usd;
  setUpAll(() {
    registerFallbackValue(SortType.sortByRank);
    registerFallbackValue(SortOrder.ascending);
  });
  setUp(() {
    reset(mockFavouritesDao);
    reset(mockMarketOverviewRepository);
    reset(mockAppSettingsBloc);
    reset(mockAssetOverviewPreferneces);
  });

  group('AssetOverviewBloc when the settings are not loaded', () {
    blocTest(
      'verify state is AssetOverviewInitial when bloc is created',
      build: () {
        when(() => mockAppSettingsBloc.stream)
            .thenAnswer((_) => Stream.value(AppSettingsInitial()));

        when(() => mockAppSettingsBloc.state).thenAnswer(
            (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository, mockAssetOverviewPreferneces);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(bloc.state, equals(const AssetOverviewInitial()));
      },
    );
  });

  group('AssetOverviewBloc when the settings are loaded', () {
    blocTest(
      'both apis return empty',
      build: () {
        when(() => mockAppSettingsBloc.stream).thenAnswer((_) =>
            Stream.value(AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

        when(() => mockAppSettingsBloc.state).thenAnswer(
            (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

        when(() =>
                mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
            .thenAnswer((_) => Future.value(List.empty()));

        when(() => mockFavouritesDao.getAll())
            .thenAnswer((_) => Future.value(List.empty()));

        when(() => mockAssetOverviewPreferneces.getSortOrder())
            .thenAnswer((_) => Future.value(SortOrder.ascending));

        when(() => mockAssetOverviewPreferneces.getSortType())
            .thenAnswer((_) => Future.value(SortType.sortByRank));

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository, mockAssetOverviewPreferneces);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(
            bloc.state,
            equals(AssetOverviewLoaded(List.empty(), List.empty(),
                SortType.sortByRank, SortOrder.ascending)));
      },
    );
    blocTest(
      'asset api is empty, favourite returns records',
      build: () {
        when(() => mockAppSettingsBloc.stream).thenAnswer((_) =>
            Stream.value(AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

        when(() => mockAppSettingsBloc.state).thenAnswer(
            (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

        when(() => mockMarketOverviewRepository
                .fetchCoinMarkets(defaultCurrency, specficCoinIds: null))
            .thenAnswer((_) => Future.value(List.empty()));

        when(() => mockMarketOverviewRepository.fetchCoinMarkets(
                defaultCurrency,
                specficCoinIds: btcFavouriteWithID.coinId))
            .thenAnswer((_) => Future.value([btcMarketCoin]));

        when(() => mockFavouritesDao.getAll())
            .thenAnswer((_) => Future.value([btcFavouriteWithID]));

        when(() => mockAssetOverviewPreferneces.getSortOrder())
            .thenAnswer((_) => Future.value(SortOrder.ascending));

        when(() => mockAssetOverviewPreferneces.getSortType())
            .thenAnswer((_) => Future.value(SortType.sortByRank));
        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository, mockAssetOverviewPreferneces);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(
            bloc.state,
            equals(AssetOverviewLoaded(
                List.empty(),
                [
                  btcMarketCoin.copyWith(
                      favouriteCacheId: btcFavouriteWithID.id),
                ],
                SortType.sortByRank,
                SortOrder.ascending)));
      },
    );
    blocTest(
      'asset api returns records favourite returns matching record for one',
      build: () {
        when(() => mockAppSettingsBloc.stream).thenAnswer((_) =>
            Stream.value(AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

        when(() => mockAppSettingsBloc.state).thenAnswer(
            (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

        when(() => mockMarketOverviewRepository
                .fetchCoinMarkets(defaultCurrency, specficCoinIds: null))
            .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

        when(() => mockMarketOverviewRepository.fetchCoinMarkets(
                defaultCurrency,
                specficCoinIds: btcFavouriteWithID.coinId))
            .thenAnswer((_) => Future.value([btcMarketCoin]));

        when(() => mockFavouritesDao.getAll())
            .thenAnswer((_) => Future.value([btcFavouriteWithID]));

        when(() => mockAssetOverviewPreferneces.getSortOrder())
            .thenAnswer((_) => Future.value(SortOrder.ascending));

        when(() => mockAssetOverviewPreferneces.getSortType())
            .thenAnswer((_) => Future.value(SortType.sortByRank));

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository, mockAssetOverviewPreferneces);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(
            bloc.state,
            equals(AssetOverviewLoaded(
              [
                btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
                ethMarketCoin
              ],
              [
                btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ],
              SortType.sortByRank,
              SortOrder.ascending,
            )));
      },
    );
    blocTest('throw error if the asset api fails',
        build: () {
          when(() => mockAppSettingsBloc.stream).thenAnswer((_) => Stream.value(
              AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

          when(() => mockAppSettingsBloc.state).thenAnswer(
              (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

          when(() => mockMarketOverviewRepository
              .fetchCoinMarkets(defaultCurrency)).thenThrow(Exception('ERROR'));

          return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
              mockMarketOverviewRepository, mockAssetOverviewPreferneces);
        },
        expect: () => [
              const AssetOverviewLoading(),
              AssetOverviewError(Exception('ERROR').toString())
            ],
        verify: (_) {
          verifyNever(() => mockFavouritesDao.getAll());
        });
    blocTest('throw error if the asset api succeeds but favourites fails',
        build: () {
          when(() => mockAppSettingsBloc.stream).thenAnswer((_) => Stream.value(
              AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

          when(() => mockAppSettingsBloc.state).thenAnswer(
              (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

          when(() => mockMarketOverviewRepository
                  .fetchCoinMarkets(defaultCurrency))
              .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

          when(() => mockFavouritesDao.getAll())
              .thenThrow(Exception('Error getting favourites'));

          return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
              mockMarketOverviewRepository, mockAssetOverviewPreferneces);
        },
        expect: () => [
              const AssetOverviewLoading(),
              AssetOverviewError(
                  Exception('Error getting favourites').toString())
            ]);
  });
  group('AssetOverviewBloc - favouriting', () {
    test('favourite an unfavourited item', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: null))
          .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: btcMarketCoin.id))
          .thenAnswer((_) => Future.value([btcMarketCoin]));

      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: btcMarketCoin.id + "," + ethMarketCoin.id))
          .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

      var mockFavouritesDaoCallCount = 0;

      var responses = [
        Future.value([btcFavouriteWithID]),
        Future.value([btcFavouriteWithID, ethFavouriteWithId]),
      ];
      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => responses[mockFavouritesDaoCallCount++]);

      when(() => mockFavouritesDao.insertFavourite(ethFavouriteNoId))
          .thenAnswer((_) => Future.value(ethFavouriteWithId.id));

      when(() => mockAssetOverviewPreferneces.getSortOrder())
          .thenAnswer((_) => Future.value(SortOrder.ascending));

      when(() => mockAssetOverviewPreferneces.getSortType())
          .thenAnswer((_) => Future.value(SortType.sortByRank));

      whenListen(
        mockAppSettingsBloc,
        Stream.fromIterable(
            [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
      );

      var bloc = AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
          mockMarketOverviewRepository, mockAssetOverviewPreferneces);

      await expectLater(
          mockAppSettingsBloc.stream,
          emitsInOrder(<AppSettingsState>[
            AppSettingsLoaded(ThemeMode.system, defaultCurrency)
          ]));

      // Tap favourite
      bloc.add(AssetFavourited(
        allMarketCoins: [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ethMarketCoin
        ],
        favourites: [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
        ],
        symbol: ethMarketCoin.symbol,
        coinId: ethMarketCoin.id,
        name: ethMarketCoin.name,
        addToFavourite: true,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded(
            [
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin,
            ],
            [
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ],
            SortType.sortByRank,
            SortOrder.ascending,
          ),
          AssetOverviewLoaded(
            [
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin.copyWith(favouriteCacheId: ethFavouriteWithId.id),
            ],
            [
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin.copyWith(favouriteCacheId: ethFavouriteWithId.id),
            ],
            SortType.sortByRank,
            SortOrder.ascending,
          ),
        ]),
      );
    });
    test('unfavourite an favourited item', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: null))
          .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: btcFavouriteWithID.coinId))
          .thenAnswer((_) => Future.value([btcMarketCoin]));

      var mockFavouritesDaoCallCount = 0;
      var responses = [
        Future.value(<Favourites>[btcFavouriteWithID]),
        Future.value(<Favourites>[]),
      ];
      
      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => responses[mockFavouritesDaoCallCount++]);

      when(() => mockFavouritesDao.delete(btcFavouriteWithID.id!))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.getSortOrder())
          .thenAnswer((_) => Future.value(SortOrder.ascending));

      when(() => mockAssetOverviewPreferneces.getSortType())
          .thenAnswer((_) => Future.value(SortType.sortByRank));

      whenListen(
        mockAppSettingsBloc,
        Stream.fromIterable(
            [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
      );

      var bloc = AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
          mockMarketOverviewRepository, mockAssetOverviewPreferneces);

      await expectLater(
          mockAppSettingsBloc.stream,
          emitsInOrder(<AppSettingsState>[
            AppSettingsLoaded(ThemeMode.system, defaultCurrency)
          ]));

      // Tap favourite
      bloc.add(AssetFavourited(
        allMarketCoins: [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ethMarketCoin
        ],
        favourites: [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id)
        ],
        symbol: btcMarketCoin.symbol,
        coinId: btcMarketCoin.id,
        name: btcMarketCoin.name,
        addToFavourite: false,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded(
            [
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin
            ],
            [
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ],
            SortType.sortByRank,
            SortOrder.ascending,
          ),
          AssetOverviewLoaded(
            [
              btcMarketCoin,
              ethMarketCoin,
            ],
            const [],
            SortType.sortByRank,
            SortOrder.ascending,
          )
        ]),
      );
    });
  });

  group('Sorting', () {
    blocTest(
      'Initial load - uses default sorting by rank in ascending order',
      build: () {
        when(() => mockAppSettingsBloc.stream).thenAnswer((_) =>
            Stream.value(AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

        when(() => mockAppSettingsBloc.state).thenAnswer(
            (_) => AppSettingsLoaded(ThemeMode.system, defaultCurrency));

        when(() =>
                mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
            .thenAnswer((_) =>
                Future.value([bnbMarketCoin, btcMarketCoin, ethMarketCoin]));

        when(() => mockMarketOverviewRepository.fetchCoinMarkets(
                defaultCurrency,
                specficCoinIds: btcMarketCoin.id))
            .thenAnswer((_) => Future.value([btcMarketCoin]));

        when(() => mockFavouritesDao.getAll())
            .thenAnswer((_) => Future.value([btcFavouriteWithID]));

        when(() => mockAssetOverviewPreferneces.getSortOrder())
            .thenAnswer((_) => Future.value(SortOrder.ascending));

        when(() => mockAssetOverviewPreferneces.getSortType())
            .thenAnswer((_) => Future.value(SortType.sortByRank));

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository, mockAssetOverviewPreferneces);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(
            bloc.state,
            equals(AssetOverviewLoaded(
              [
                btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
                ethMarketCoin,
                bnbMarketCoin
              ],
              [btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id)],
              SortType.sortByRank,
              SortOrder.ascending,
            )));
      },
    );

    test('Call AssetSorted with SortBy24HoursChange and Descending', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) =>
              Future.value([btcMarketCoin, ethMarketCoin, bnbMarketCoin]));

      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: btcFavouriteWithID.coinId))
          .thenAnswer((_) => Future.value([btcMarketCoin]));

      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => Future.value([btcFavouriteWithID]));

      when(() => mockFavouritesDao.delete(btcFavouriteWithID.id!))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.getSortOrder())
          .thenAnswer((_) => Future.value(SortOrder.ascending));

      when(() => mockAssetOverviewPreferneces.getSortType())
          .thenAnswer((_) => Future.value(SortType.sortByRank));

      when(() => mockAssetOverviewPreferneces.setSortOrder(any<SortOrder>()))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.setSortType(any<SortType>()))
          .thenAnswer((_) => Future.value());

      whenListen(
        mockAppSettingsBloc,
        Stream.fromIterable(
            [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
      );

      var bloc = AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
          mockMarketOverviewRepository, mockAssetOverviewPreferneces);

      await expectLater(
          mockAppSettingsBloc.stream,
          emitsInOrder(<AppSettingsState>[
            AppSettingsLoaded(ThemeMode.system, defaultCurrency)
          ]));

      // Tap sort
      bloc.add(AssetSorted(
        [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          bnbMarketCoin,
          ethMarketCoin,
        ],
        SortType.sortBy24hPercentageChange,
        SortOrder.descending,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin,
            bnbMarketCoin
          ], [
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortByRank, SortOrder.ascending),
          AssetOverviewLoaded([
            ethMarketCoin,
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            bnbMarketCoin,
          ], [
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortBy24hPercentageChange, SortOrder.descending),
        ]),
      );
    });
    test('Call AssetSorted with SortBy24HoursChange and Ascending', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) =>
              Future.value([btcMarketCoin, ethMarketCoin, bnbMarketCoin]));

      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: btcFavouriteWithID.coinId))
          .thenAnswer((_) => Future.value([btcMarketCoin]));

      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => Future.value([btcFavouriteWithID]));

      when(() => mockFavouritesDao.delete(btcFavouriteWithID.id!))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.getSortOrder())
          .thenAnswer((_) => Future.value(SortOrder.ascending));

      when(() => mockAssetOverviewPreferneces.getSortType())
          .thenAnswer((_) => Future.value(SortType.sortByRank));

      when(() => mockAssetOverviewPreferneces.setSortOrder(any<SortOrder>()))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.setSortType(any<SortType>()))
          .thenAnswer((_) => Future.value());

      whenListen(
        mockAppSettingsBloc,
        Stream.fromIterable(
            [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
      );

      var bloc = AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
          mockMarketOverviewRepository, mockAssetOverviewPreferneces);

      await expectLater(
          mockAppSettingsBloc.stream,
          emitsInOrder(<AppSettingsState>[
            AppSettingsLoaded(ThemeMode.system, defaultCurrency)
          ]));

      // Tap sort
      bloc.add(AssetSorted(
        [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          bnbMarketCoin,
          ethMarketCoin,
        ],
        SortType.sortBy24hPercentageChange,
        SortOrder.ascending,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin,
            bnbMarketCoin
          ], [
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortByRank, SortOrder.ascending),
          AssetOverviewLoaded([
            bnbMarketCoin,
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin,
          ], [
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortBy24hPercentageChange, SortOrder.ascending),
        ]),
      );
    });
    test('Call AssetSorted with Rank and Descending', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) =>
              Future.value([btcMarketCoin, ethMarketCoin, bnbMarketCoin]));

      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency,
              specficCoinIds: btcFavouriteWithID.coinId))
          .thenAnswer((_) => Future.value([btcMarketCoin]));

      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => Future.value([btcFavouriteWithID]));

      when(() => mockFavouritesDao.delete(btcFavouriteWithID.id!))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.getSortOrder())
          .thenAnswer((_) => Future.value(SortOrder.ascending));

      when(() => mockAssetOverviewPreferneces.getSortType())
          .thenAnswer((_) => Future.value(SortType.sortByRank));

      when(() => mockAssetOverviewPreferneces.setSortOrder(any<SortOrder>()))
          .thenAnswer((_) => Future.value());

      when(() => mockAssetOverviewPreferneces.setSortType(any<SortType>()))
          .thenAnswer((_) => Future.value());

      whenListen(
        mockAppSettingsBloc,
        Stream.fromIterable(
            [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
      );

      var bloc = AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
          mockMarketOverviewRepository, mockAssetOverviewPreferneces);

      await expectLater(
          mockAppSettingsBloc.stream,
          emitsInOrder(<AppSettingsState>[
            AppSettingsLoaded(ThemeMode.system, defaultCurrency)
          ]));

      // Tap sort
      bloc.add(AssetSorted(
        [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          bnbMarketCoin,
          ethMarketCoin,
        ],
        SortType.sortByRank,
        SortOrder.descending,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin,
            bnbMarketCoin
          ], [
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortByRank, SortOrder.ascending),
          AssetOverviewLoaded([
            bnbMarketCoin,
            ethMarketCoin,
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], [
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortByRank, SortOrder.descending),
        ]),
      );
    });
  });
}
