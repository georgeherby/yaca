import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/database/app_database.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/core/repositories/api/coingecko/market_overview_repository.dart';
import 'package:crypto_app/core/repositories/favourites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/asset_overview_data.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

class MockFavouritesDao extends Mock implements FavouritesDao {
  @override
  DatabaseHelper get dbHelper => MockDatabaseHelper();
}

class MockMarketOverviewRepository extends Mock
    implements MarketOverviewRepository {}

class MockAppSettingsBloc extends Mock implements AppSettingsBloc {}

void main() {
  var mockFavouritesDao = MockFavouritesDao();
  var mockMarketOverviewRepository = MockMarketOverviewRepository();
  var mockAppSettingsBloc = MockAppSettingsBloc();
  var defaultCurrency = AvailableCurrencies.usd;

  setUp(() {
    reset(mockFavouritesDao);
    reset(mockMarketOverviewRepository);
    reset(mockAppSettingsBloc);
  });

  group('AssetOverviewBloc when the settings are not loaded', () {
    blocTest(
      'verify state is AssetOverviewInitial when bloc is created',
      build: () {
        when(() => mockAppSettingsBloc.stream)
            .thenAnswer((_) => Stream.value(AppSettingsInitial()));
        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(bloc.state, equals(AssetOverviewInitial()));
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

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(bloc.state, equals(AssetOverviewLoaded(List.empty())));
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

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(bloc.state, equals(AssetOverviewLoaded(List.empty())));
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

        return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
            mockMarketOverviewRepository);
      },
      verify: (AssetOverviewBloc bloc) {
        expect(
            bloc.state,
            equals(AssetOverviewLoaded([
              btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
              ethMarketCoin
            ])));
      },
    );
    blocTest('throw error if the asset api fails',
        build: () {
          when(() => mockAppSettingsBloc.stream).thenAnswer((_) => Stream.value(
              AppSettingsLoaded(ThemeMode.system, defaultCurrency)));

          when(() => mockMarketOverviewRepository
              .fetchCoinMarkets(defaultCurrency)).thenThrow(Exception('ERROR'));

          // when(() => mockFavouritesDao.getAll())
          //     .thenAnswer((_) => Future.value([btcFavourite]));

          return AssetOverviewBloc(mockAppSettingsBloc, mockFavouritesDao,
              mockMarketOverviewRepository);
        },
        expect: () => [
              AssetOverviewLoading(),
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
              mockMarketOverviewRepository);
        },
        expect: () => [
              AssetOverviewLoading(),
              AssetOverviewError(Exception('FAV ERROR').toString())
            ]);

    test('favourite an unfavourited item', () async {
      // Mocks
      when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
          .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

      when(() => mockFavouritesDao.getAll())
          .thenAnswer((_) => Future.value([btcFavouriteWithID]));

      when(() => mockFavouritesDao.insertIgnore(ethFavouriteNoId))
          .thenAnswer((_) => Future.value(13));

      whenListen(
        mockAppSettingsBloc,
        Stream.fromIterable(
            [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
      );

      var bloc = AssetOverviewBloc(
          mockAppSettingsBloc, mockFavouritesDao, mockMarketOverviewRepository);

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
            ethMarketCoin
          ]),
          AssetOverviewLoaded([
            btcMarketCoin.copyWith(favouriteCacheId: btcFavouriteWithID.id),
            ethMarketCoin.copyWith(favouriteCacheId: 13)
          ])
        ]),
      );
    });
  });

  test('unfavourite an favourited item', () async {
    // Mocks
    when(() => mockMarketOverviewRepository.fetchCoinMarkets(defaultCurrency))
        .thenAnswer((_) => Future.value([btcMarketCoin, ethMarketCoin]));

    when(() => mockFavouritesDao.getAll())
        .thenAnswer((_) => Future.value([btcFavouriteWithID]));

    when(() => mockFavouritesDao.delete(btcFavouriteWithID.id!))
        .thenAnswer((_) => Future.value(1));

    whenListen(
      mockAppSettingsBloc,
      Stream.fromIterable(
          [AppSettingsLoaded(ThemeMode.system, defaultCurrency)]),
    );

    var bloc = AssetOverviewBloc(
        mockAppSettingsBloc, mockFavouritesDao, mockMarketOverviewRepository);

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
        ]),
        AssetOverviewLoaded([
          btcMarketCoin,
          ethMarketCoin
        ])
      ]),
    );
  });
}
