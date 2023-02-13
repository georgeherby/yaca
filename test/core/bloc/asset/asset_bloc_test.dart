// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/asset/asset_bloc.dart';
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/repositories/api/coingecko/single_asset_repository.dart';
import 'mock/singleasset_data.dart';

class MockSingleAssetRespository extends Mock implements AssetRepository {}

void main() {
  final mockSingleAssetRespository = MockSingleAssetRespository();
  const coinId = 'btc';
  final chosenCurrency = AvailableCurrencies.gbp;
  setUp(() {
    reset(mockSingleAssetRespository);
  });

  group('AssetBloc', () {
    blocTest(
      'verify state is AssetInitial when bloc is created',
      build: () {
        return AssetBloc(singleAssetRepository: mockSingleAssetRespository);
      },
      verify: (AssetBloc bloc) {
        expect(bloc.state, equals(AssetInitial()));
      },
    );
    blocTest('verify state is AssetLoaded when bloc is event is AssetLoad',
        build: () {
          when(() => mockSingleAssetRespository.getSingleAssetData(coinId))
              .thenAnswer((invocation) => Future.value(singelAssetDataBtc));
          when(() => mockSingleAssetRespository.fetchFullAssetHistory(
                  coinId, chosenCurrency))
              .thenAnswer((invocation) => Future.value(assetHistorySplitsBtc));

          return AssetBloc(singleAssetRepository: mockSingleAssetRespository);
        },
        act: (AssetBloc bloc) => bloc
            .add(AssetLoad(marketCoinId: coinId, currencyCode: chosenCurrency)),
        expect: () => [
              const AssetLoading(),
              AssetLoaded(singelAssetDataBtc, assetHistorySplitsBtc)
            ]);
    blocTest('verify state is SingleAssetError when getSingleAssetData fails',
        build: () {
          when(() => mockSingleAssetRespository.getSingleAssetData(coinId))
              .thenThrow(Exception('Error'));
          when(() => mockSingleAssetRespository.fetchFullAssetHistory(
                  coinId, chosenCurrency))
              .thenAnswer((invocation) => Future.value(assetHistorySplitsBtc));

          return AssetBloc(singleAssetRepository: mockSingleAssetRespository);
        },
        act: (AssetBloc bloc) => bloc
            .add(AssetLoad(marketCoinId: coinId, currencyCode: chosenCurrency)),
        expect: () =>
            [const AssetLoading(), AssetError(Exception('Error').toString())]);
    blocTest(
        'verify state is SingleAssetError when fetchFullAssetHistory fails',
        build: () {
          when(() => mockSingleAssetRespository.fetchFullAssetHistory(
              coinId, chosenCurrency)).thenThrow(Exception('Error'));

          return AssetBloc(singleAssetRepository: mockSingleAssetRespository);
        },
        act: (AssetBloc bloc) => bloc
            .add(AssetLoad(marketCoinId: coinId, currencyCode: chosenCurrency)),
        verify: (_) {
          verifyNever(
              () => mockSingleAssetRespository.getSingleAssetData(any()));
        },
        expect: () =>
            [const AssetLoading(), AssetError(Exception('Error').toString())]);
  });
}
