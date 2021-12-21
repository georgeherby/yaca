// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:yaca/core/repositories/api/coingecko/exchange_ticker_repository.dart';
import 'mock/singleasset_exchange_data.dart';

class MockExchangeTickerRespository extends Mock
    implements ExchangeTickerRespository {}

void main() {
  var mockExchangeTickerRespository = MockExchangeTickerRespository();
  var coinId = 'btc';
  setUp(() {
    reset(mockExchangeTickerRespository);
  });

  group('SingleAssetExchangeBloc', () {
    blocTest(
      'verify state is SingleAssetExchangeInitial when bloc is created',
      build: () {
        return SingleAssetExchangeBloc(
            exchangeTickerRespository: mockExchangeTickerRespository);
      },
      verify: (SingleAssetExchangeBloc bloc) {
        expect(bloc.state, equals(SingleAssetExchangeInitial()));
      },
    );
    blocTest(
        'verify state is SingleAssetExchangeLoaded when bloc is event is SingleAssetExchangeLoad',
        build: () {
          when(() => mockExchangeTickerRespository.getAllExchangeTickers(any()))
              .thenAnswer((invocation) => Future.value([binanceBtcTicker]));

          return SingleAssetExchangeBloc(
              exchangeTickerRespository: mockExchangeTickerRespository);
        },
        act: (SingleAssetExchangeBloc bloc) =>
            bloc.add(SingleAssetExchangeLoad(marketCoinId: coinId)),
        expect: () => [
              const SingleAssetExchangeLoading(),
              SingleAssetExchangeLoaded([binanceBtcTicker])
            ]);
    blocTest(
        'verify state is SingleAssetExchangeError when bloc is event is SingleAssetExchangeLoad but API fails',
        build: () {
          when(() => mockExchangeTickerRespository.getAllExchangeTickers(any()))
              .thenThrow(Exception('Error'));

          return SingleAssetExchangeBloc(
              exchangeTickerRespository: mockExchangeTickerRespository);
        },
        act: (SingleAssetExchangeBloc bloc) =>
            bloc.add(SingleAssetExchangeLoad(marketCoinId: coinId)),
        expect: () => [
              const SingleAssetExchangeLoading(),
              SingleAssetExchangeError(Exception('Error').toString())
            ]);
  });
}
