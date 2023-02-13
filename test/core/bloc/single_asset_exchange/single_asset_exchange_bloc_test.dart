// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yaca/core/bloc/single_asset_exchange/single_asset_exchange_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/repositories/api/coingecko/exchange_ticker_repository.dart';
import 'mock/single_asset_exchange_data.dart';

class MockExchangeTickerRepository extends Mock
    implements ExchangeTickerRepository {}

void main() {
  final mockExchangeTickerRepository = MockExchangeTickerRepository();
  const coinId = 'btc';
  setUp(() {
    reset(mockExchangeTickerRepository);
  });

  group('SingleAssetExchangeBloc', () {
    blocTest(
      'verify state is SingleAssetExchangeInitial when bloc is created',
      build: () {
        return SingleAssetExchangeBloc(
            exchangeTickerRepository: mockExchangeTickerRepository);
      },
      verify: (SingleAssetExchangeBloc bloc) {
        expect(bloc.state, equals(SingleAssetExchangeInitial()));
      },
    );
    blocTest(
        'verify state is SingleAssetExchangeLoaded when bloc is event is SingleAssetExchangeLoad',
        build: () {
          when(() =>
                  mockExchangeTickerRepository.getExchangeTickerForCoin(any()))
              .thenAnswer(
                  (invocation) => Future.value([singleBinanceBtcTicker]));

          return SingleAssetExchangeBloc(
              exchangeTickerRepository: mockExchangeTickerRepository);
        },
        act: (SingleAssetExchangeBloc bloc) =>
            bloc.add(const SingleAssetExchangeLoad(marketCoinId: coinId)),
        expect: () => [
              const SingleAssetExchangeLoading(),
              SingleAssetExchangeLoaded([singleBinanceBtcTicker])
            ]);
    blocTest(
        'verify state is SingleAssetExchangeError when bloc is event is SingleAssetExchangeLoad but API fails',
        build: () {
          when(() =>
                  mockExchangeTickerRepository.getExchangeTickerForCoin(any()))
              .thenThrow(Exception('Error'));

          return SingleAssetExchangeBloc(
              exchangeTickerRepository: mockExchangeTickerRepository);
        },
        act: (SingleAssetExchangeBloc bloc) =>
            bloc.add(const SingleAssetExchangeLoad(marketCoinId: coinId)),
        expect: () => [
              const SingleAssetExchangeLoading(),
              SingleAssetExchangeError(Exception('Error').toString())
            ]);
  });
}
