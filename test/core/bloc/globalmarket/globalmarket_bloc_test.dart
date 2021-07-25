import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/repositories/api/coingecko/global_market_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/global_market_data.dart';

class MockGlobalMarketRespository extends Mock
    implements GlobalMarketRespository {}

void main() {
  var mockRepository = MockGlobalMarketRespository();

  setUp(() {
    reset(mockRepository);
  });

  group('GlobalMarketBloc', () {
    var currency = AvailableCurrencies.gbp;
    blocTest(
      'verify initsate is GlobalMarketInitial when bloc is created',
      build: () => GlobalMarketBloc(mockRepository),
      verify: (GlobalMarketBloc bloc) {
        expect(bloc.state, equals(GlobalMarketInitial()));
      },
    );

    blocTest(
      'emit correct states when loading GlobalMarklet',
      build: () {
        when(() => mockRepository.fetchMarketOverview(currency))
            .thenAnswer((_) => Future.value(globalMarketData));
        return GlobalMarketBloc(mockRepository);
      },
      act: (GlobalMarketBloc bloc) => bloc.add(GlobalMarketLoad(currency)),
      expect: () =>
          [GlobalMarketLoading(), GlobalMarketLoaded(globalMarketData)],
    );

    blocTest(
      'emit correct states when failing to loading GlobalMarklet',
      build: () {
        when(() => mockRepository.fetchMarketOverview(currency))
            .thenThrow(Exception('AAAH'));
        return GlobalMarketBloc(mockRepository);
      },
      act: (GlobalMarketBloc bloc) => bloc.add(GlobalMarketLoad(currency)),
      expect: () => [
        GlobalMarketLoading(),
        GlobalMarketError(Exception('AAAH').toString())
      ],
    );
  });
}
