import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/extensions/chosen_currency.dart';
import 'package:crypto_app/core/preferences/currency_preference.dart';
import 'package:crypto_app/core/preferences/dark_theme_preference.dart';
import 'package:crypto_app/old/models/settings/chosen_currency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'appsettings_event.dart';
part 'appsettings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final DarkThemePreferenceRepository _darkThemePreferenceRepository;
  final CurrencyPreferenceRepository _currencyPreferenceRepository;

  AppSettingsBloc(
      this._darkThemePreferenceRepository, this._currencyPreferenceRepository)
      : super(AppSettingsInitial());

  @override
  Stream<AppSettingsState> mapEventToState(
    AppSettingsEvent event,
  ) async* {
    if (event is LoadAppSettings) {
      var theme = await _darkThemePreferenceRepository.isDarkTheme()
          ? ThemeMode.dark
          : ThemeMode.light;

      var currency =
          (await _currencyPreferenceRepository.get()).toChosenCurrency();

      yield AppSettingsLoaded(theme, currency);
    } else if (event is UpdateCurrencyOptionEvent) {
      await _currencyPreferenceRepository
          .set(event.newCurrencyChoice.currencyCode);
      yield AppSettingsLoaded(event.theme, event.newCurrencyChoice);
    } else if (event is UpdateThemeOptionEvent) {
      await _darkThemePreferenceRepository
          .setDarkTheme(event.newTheme == ThemeMode.dark);
      yield AppSettingsLoaded(event.newTheme, event.currency);
    }
  }
}
