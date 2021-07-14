import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/repositories/preferences/currency_preference.dart';
import 'package:crypto_app/core/repositories/preferences/theme_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

          var bloc = AppSettingsBloc(mockTheme, mockCurrency);

          return bloc;
        },
        act: (AppSettingsBloc bloc) => bloc.add(LoadAppSettings()),
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

          var bloc = AppSettingsBloc(mockTheme, mockCurrency);

          return bloc;
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

          var bloc = AppSettingsBloc(mockTheme, mockCurrency);

          return bloc;
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
