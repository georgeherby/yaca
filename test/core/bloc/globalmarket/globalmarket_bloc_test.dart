// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yaca/core/bloc/global_market/global_market_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/repositories/api/coingecko/global_market_repository.dart';
import 'mock/global_market_data.dart';

class MockGlobalMarketRepository extends Mock
    implements GlobalMarketRepository {}

void main() {
  final mockRepository = MockGlobalMarketRepository();

  setUp(() {
    reset(mockRepository);
  });

  group('GlobalMarketBloc', () {
    final currency = AvailableCurrencies.gbp;
    blocTest(
      'verify initState is GlobalMarketInitial when bloc is created',
      build: () => GlobalMarketBloc(mockRepository),
      verify: (GlobalMarketBloc bloc) {
        expect(bloc.state, equals(const GlobalMarketInitial()));
      },
    );

    blocTest(
      'emit correct states when loading GlobalMarket',
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
      'emit correct states when failing to loading GlobalMarket',
      build: () {
        when(() => mockRepository.fetchMarketOverview(currency))
            .thenThrow(Exception('Ah'));
        return GlobalMarketBloc(mockRepository);
      },
      act: (GlobalMarketBloc bloc) => bloc.add(GlobalMarketLoad(currency)),
      expect: () => [
        const GlobalMarketLoading(),
        GlobalMarketError(Exception('Ah').toString())
      ],
    );
  });
}
