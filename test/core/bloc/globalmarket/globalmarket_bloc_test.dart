// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/repositories/api/coingecko/global_market_repository.dart';
import 'mock/global_market_data.dart';

class MockGlobalMarketRespository extends Mock
    implements GlobalMarketRespository {}

void main() {
  final mockRepository = MockGlobalMarketRespository();

  setUp(() {
    reset(mockRepository);
  });

  group('GlobalMarketBloc', () {
    final currency = AvailableCurrencies.gbp;
    blocTest(
      'verify initsate is GlobalMarketInitial when bloc is created',
      build: () => GlobalMarketBloc(mockRepository),
      verify: (GlobalMarketBloc bloc) {
        expect(bloc.state, equals(const GlobalMarketInitial()));
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
          [const GlobalMarketLoading(), GlobalMarketLoaded(globalMarketData)],
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
        const GlobalMarketLoading(),
        GlobalMarketError(Exception('AAAH').toString())
      ],
    );
  });
}
