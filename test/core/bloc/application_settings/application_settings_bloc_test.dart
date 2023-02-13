// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';
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
  group('ApplicationSettingsBloc', () {
    final mockTheme = MockThemePreferenceRepository();
    final mockCurrency = MockCurrencyPreferenceRepository();

    tearDown(() {
      reset(mockCurrency);
      reset(mockTheme);
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => ApplicationSettingsBloc(
          MockThemePreferenceRepository(), MockCurrencyPreferenceRepository()),
      expect: () => [],
    );

    blocTest(
        'verify initState is ApplicationSettingsInitial when ApplicationSettingsBloc is created',
        build: () => ApplicationSettingsBloc(mockTheme, mockCurrency),
        verify: (ApplicationSettingsBloc bloc) {
          expect(bloc.state, equals(ApplicationSettingsInitial()));
        });

    blocTest(
        'emits ApplicationSettingsLoaded when Event is LoadApplicationSettings',
        build: () {
          when(mockTheme.getThemeMode)
              .thenAnswer((_) => Future.value(ThemeMode.system));
          when(mockCurrency.get).thenAnswer((_) =>
              Future.value(AvailableCurrencies.gbp.currencyCode.toUpperCase()));

          return ApplicationSettingsBloc(mockTheme, mockCurrency);
        },
        act: (ApplicationSettingsBloc bloc) =>
            bloc.add(const LoadApplicationSettings()),
        expect: () => [
              ApplicationSettingsLoaded(
                  ThemeMode.system, AvailableCurrencies.gbp)
            ],
        verify: (_) {
          verify(mockTheme.getThemeMode).called(1);
          verify(mockCurrency.get).called(1);
        });

    blocTest(
        'emits ApplicationSettingsLoaded when Event is UpdateCurrencyOptionEvent',
        build: () {
          when(() => mockCurrency.set(AvailableCurrencies.gbp.currencyCode))
              .thenAnswer((_) => Future.value());

          return ApplicationSettingsBloc(mockTheme, mockCurrency);
        },
        act: (ApplicationSettingsBloc bloc) => bloc.add(
            UpdateCurrencyOptionEvent(AvailableCurrencies.gbp, ThemeMode.dark)),
        expect: () => [
              ApplicationSettingsLoaded(ThemeMode.dark, AvailableCurrencies.gbp)
            ],
        verify: (_) {
          verifyNever(() => mockTheme.setThemeMode(any()));
        });

    blocTest(
        'emits ApplicationSettingsLoaded when Event is UpdateThemeOptionEvent',
        build: () {
          when(() => mockTheme.setThemeMode(ThemeMode.light))
              .thenAnswer((_) => Future.value());

          return ApplicationSettingsBloc(mockTheme, mockCurrency);
        },
        act: (ApplicationSettingsBloc bloc) => bloc.add(
            UpdateThemeOptionEvent(AvailableCurrencies.btc, ThemeMode.light)),
        expect: () => [
              ApplicationSettingsLoaded(
                  ThemeMode.light, AvailableCurrencies.btc)
            ],
        verify: (_) {
          verifyNever(() => mockCurrency.set(any()));
        });
  });
}
