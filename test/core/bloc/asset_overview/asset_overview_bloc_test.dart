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
            equals(AssetOverviewLoaded(
                List.empty(), SortType.sortByRank, SortOrder.ascending)));
      },
    );
    blocTest(
      'asset api is empty, favourite returns records',
      build: () {
        when(() => mockAppSettingsBloc.stream).thenAnswer((_) =>
            Stream.value(AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

        when(() =>
                mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
            .thenAnswer((_) => Future.value(List.empty()));
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
                List.empty(), SortType.sortByRank, SortOrder.ascending)));
      },
    );
    blocTest(
      'asset api returns records favourite returns matching record for one',
      build: () {
        when(() => mockAppSettingsBloc.stream).thenAnswer((_) =>
            Stream.value(AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

        when(() =>
                mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
            .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

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
            equals(AssetOverviewLoaded([
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin
            ], SortType.sortByRank, SortOrder.ascending)));
      },
    );
    blocTest('throw error if the asset api fails',
        build: () {
          when(() => mockAppSettingsBloc.stream).thenAnswer((_) => Stream.value(
              AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

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

          when(() => mockMarketOverviewRepository
                  .fetchCoinMarkets(defaultCurrency))
              .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

          when(() => mockFavouritesDao.getAll())
              .thenThrow(Exception('FAV ERROR'));

          return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
              mockMarketOverviewRepository, mockAssetOverviewPreferneces);
        },
        expect: () => [
              const AssetOverviewLoading(),
              AssetOverviewError(Exception('FAV ERROR').toString())
            ]);
  });
  group('AssetOverviewBloc - favouriting', () {
    test('favourite an unfavourited item', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => Future.value([btcFavouriteWithID]));

      when(() => mockFavouritesDao.insertFavourite(ethFavouriteNoId))
          .thenAnswer((_) => Future.value(13));

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
        [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ethMarketCoin
        ],
        ethMarketCoin,
        true,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin,
          ], SortType.sortByRank, SortOrder.ascending),
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin.copyWith(favouriteCacheId: 13),
          ], SortType.sortByRank, SortOrder.ascending),
        ]),
      );
    });
    test('unfavourite an favourited item', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => Future.value([btcFavouriteWithID]));

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
        [
          btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ethMarketCoin
        ],
        btcMarketCoin,
        false,
      ));

      await expectLater(
        bloc.stream,
        emitsInOrder(<AssetOverviewState>[
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin
          ], SortType.sortByRank, SortOrder.ascending),
          AssetOverviewLoaded([btcMarketCoin, ethMarketCoin],
              SortType.sortByRank, SortOrder.ascending)
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

        when(() =>
                mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
            .thenAnswer((_) =>
                Future.value([bnbMarketCoin, btcMarketCoin, ethMarketCoin]));

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
            equals(AssetOverviewLoaded([
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin,
              bnbMarketCoin
            ], SortType.sortByRank, SortOrder.ascending)));
      },
    );

    test('Call AssetSorted with SortBy24HoursChange and Descending', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) =>
              Future.value([btcMarketCoin, ethMarketCoin, bnbMarketCoin]));

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
          ], SortType.sortByRank, SortOrder.ascending),
          const AssetOverviewLoading(),
          AssetOverviewLoaded([
            ethMarketCoin,
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            bnbMarketCoin,
          ], SortType.sortBy24hPercentageChange, SortOrder.descending),
        ]),
      );
    });
    test('Call AssetSorted with SortBy24HoursChange and Ascending', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) =>
              Future.value([btcMarketCoin, ethMarketCoin, bnbMarketCoin]));

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
          ], SortType.sortByRank, SortOrder.ascending),
          const AssetOverviewLoading(),
          AssetOverviewLoaded([
            bnbMarketCoin,
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin,
          ], SortType.sortBy24hPercentageChange, SortOrder.ascending),
        ]),
      );
    });
    test('Call AssetSorted with Rank and Descending', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) =>
              Future.value([btcMarketCoin, ethMarketCoin, bnbMarketCoin]));

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
          ], SortType.sortByRank, SortOrder.ascending),
          const AssetOverviewLoading(),
          AssetOverviewLoaded([
            bnbMarketCoin,
            ethMarketCoin,
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
          ], SortType.sortByRank, SortOrder.descending),
        ]),
      );
    });
  });
}
