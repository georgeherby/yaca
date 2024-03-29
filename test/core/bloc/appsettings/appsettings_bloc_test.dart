// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/repositories/preferences/currency_preference.dart';
import 'package:yaca/core/repositories/preferences/theme_preference.dart';

class MockThemePreferenceRepository extends Mock
    implements ThemePreferenceRepository {}

class MockCurrencyPreferenceRepository extends Mock
    implements CurrencyPreferenceRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(ThemeMode.system);
  });
  group('AppSettingsBloc', () {
    var mockTheme = MockThemePreferenceRepository();
    var mockCurrency = MockCurrencyPreferenceRepository();

    tearDown(() {
      reset(mockCurrency);
      reset(mockTheme);
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => AppSettingsBloc(
          MockThemePreferenceRepository(), MockCurrencyPreferenceRepository()),
      expect: () => [],
    );

    blocTest(
        'verify initState is AppSettingsInitial when AppSettingsBloc is created',
        build: () => AppSettingsBloc(mockTheme, mockCurrency),
        verify: (AppSettingsBloc bloc) {
          expect(bloc.state, equals(AppSettingsInitial()));
        });

    blocTest('emits AppSettingsLoaded when Event is LoadAppSettings',
        build: () {
          when(() => mockTheme.getThemeMode())
              .thenAnswer((_) => Future.value(ThemeMode.system));
          when(() => mockCurrency.get()).thenAnswer((_) =>
              Future.value(AvailableCurrencies.gbp.currencyCode.toUpperCase()));

          return AppSettingsBloc(mockTheme, mockCurrency);
        },
        act: (AppSettingsBloc bloc) => bloc.add(const LoadAppSettings()),
        expect: () =>
            [AppSettingsLoaded(ThemeMode.system, AvailableCurrencies.gbp)],
        verify: (_) {
          verify(() => mockTheme.getThemeMode()).called(1);
          verify(() => mockCurrency.get()).called(1);
        });

    blocTest('emits AppSettingsLoaded when Event is UpdateCurrencyOptionEvent',
        build: () {
          when(() => mockCurrency.set(AvailableCurrencies.gbp.currencyCode))
              .thenAnswer((_) => Future.value());

          return AppSettingsBloc(mockTheme, mockCurrency);
        },
        act: (AppSettingsBloc bloc) => bloc.add(
            UpdateCurrencyOptionEvent(AvailableCurrencies.gbp, ThemeMode.dark)),
        expect: () =>
            [AppSettingsLoaded(ThemeMode.dark, AvailableCurrencies.gbp)],
        verify: (_) {
          verifyNever(() => mockTheme.setThemeMode(any()));
        });

    blocTest('emits AppSettingsLoaded when Event is UpdateThemeOptionEvent',
        build: () {
          when(() => mockTheme.setThemeMode(ThemeMode.light))
              .thenAnswer((_) => Future.value());

          return AppSettingsBloc(mockTheme, mockCurrency);
        },
        act: (AppSettingsBloc bloc) => bloc.add(
            UpdateThemeOptionEvent(AvailableCurrencies.btc, ThemeMode.light)),
        expect: () =>
            [AppSettingsLoaded(ThemeMode.light, AvailableCurrencies.btc)],
        verify: (_) {
          verifyNever(() => mockCurrency.set(any()));
        });
  });
}
