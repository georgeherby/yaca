// class SingleAssetBloc
//     extends Bloc<SingleAssetEvent, SingleAssetState> {
//   final TickerRespository TickerRespository;

import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/bloc/singleasset/singleasset_bloc.dart';
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/repositories/api/coingecko/single_asset_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/singleasset_data.dart';

class MockSingleAssetRespository extends Mock
    implements SingleAssetRespository {}

void main() {
  var mockSingleAssetRespository = MockSingleAssetRespository();
  var coinId = 'btc';
  var chosenCurrency = AvailableCurrencies.gbp;
  setUp(() {
    reset(mockSingleAssetRespository);
  });

  group('SingleAssetBloc', () {
    blocTest(
      'verify state is SingleAssetInitial when bloc is created',
      build: () {
        return SingleAssetBloc(
            singleAssetRespository: mockSingleAssetRespository);
      },
      verify: (SingleAssetBloc bloc) {
        expect(bloc.state, equals(SingleAssetInitial()));
      },
    );
    blocTest(
        'verify state is SingleAssetLoaded when bloc is event is SingleAssetLoad',
        build: () {
          when(() => mockSingleAssetRespository.getSingleAssetData(coinId))
              .thenAnswer((invocation) => Future.value(singelAssetDataBtc));
          when(() => mockSingleAssetRespository.fetchFullAssetHistory(
                  coinId, chosenCurrency))
              .thenAnswer((invocation) => Future.value(assetHistorySplitsBtc));

          return SingleAssetBloc(
              singleAssetRespository: mockSingleAssetRespository);
        },
        act: (SingleAssetBloc bloc) => bloc.add(SingleAssetLoad(
            marketCoinId: coinId, currencyCode: chosenCurrency)),
        expect: () => [
              SingleAssetLoading(),
              SingleAssetLoaded(singelAssetDataBtc, assetHistorySplitsBtc)
            ]);
    blocTest('verify state is SingleAssetError when getSingleAssetData fails',
        build: () {
          when(() => mockSingleAssetRespository.getSingleAssetData(coinId))
              .thenThrow(Exception('Error'));
          when(() => mockSingleAssetRespository.fetchFullAssetHistory(
                  coinId, chosenCurrency))
              .thenAnswer((invocation) => Future.value(assetHistorySplitsBtc));

          return SingleAssetBloc(
              singleAssetRespository: mockSingleAssetRespository);
        },
        act: (SingleAssetBloc bloc) => bloc.add(SingleAssetLoad(
            marketCoinId: coinId, currencyCode: chosenCurrency)),
        expect: () => [
              SingleAssetLoading(),
              SingleAssetError(Exception('Error').toString())
            ]);
    blocTest(
        'verify state is SingleAssetError when fetchFullAssetHistory fails',
        build: () {
          when(() => mockSingleAssetRespository.fetchFullAssetHistory(
              coinId, chosenCurrency)).thenThrow(Exception('Error'));

          return SingleAssetBloc(
              singleAssetRespository: mockSingleAssetRespository);
        },
        act: (SingleAssetBloc bloc) => bloc.add(SingleAssetLoad(
            marketCoinId: coinId, currencyCode: chosenCurrency)),
        verify: (_) {
          verifyNever(
              () => mockSingleAssetRespository.getSingleAssetData(any()));
        },
        expect: () => [
              SingleAssetLoading(),
              SingleAssetError(Exception('Error').toString())
            ]);
  });
}
