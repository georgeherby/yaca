// 🎯 Dart imports:
import 'dart:async';

// � Package imports:
import 'package:bloc/bloc.dart';
// 🌎 Project imports:
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/core/extensions/chosen_currency.dart';
import 'package:crypto_app/core/extensions/theme_mode.dart';
// � Flutter imports:
import 'package:crypto_app/core/models/settings/chosen_currency.dart';
import 'package:crypto_app/core/repositories/preferences/currency_preference.dart';
import 'package:crypto_app/core/repositories/preferences/theme_preference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//  Package imports:

part 'appsettings_event.dart';
part 'appsettings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final ThemePreferenceRepository _darkThemePreferenceRepository;
  final CurrencyPreferenceRepository _currencyPreferenceRepository;

  AppSettingsBloc(
      this._darkThemePreferenceRepository, this._currencyPreferenceRepository)
      : super(AppSettingsInitial());

  @override
  Stream<AppSettingsState> mapEventToState(
    AppSettingsEvent event,
  ) async* {
    if (event is LoadAppSettings) {
      var theme = await _darkThemePreferenceRepository.getThemeMode();
      var currency =
          (await _currencyPreferenceRepository.get()).toChosenCurrency();

      yield AppSettingsLoaded(theme, currency);
    } else if (event is UpdateCurrencyOptionEvent) {
      await _currencyPreferenceRepository
          .set(event.newCurrencyChoice.currencyCode);

      yield AppSettingsLoaded(event.theme, event.newCurrencyChoice);
    } else if (event is UpdateThemeOptionEvent) {
      debugPrint(event.newTheme.toStr());
      await _darkThemePreferenceRepository.setThemeMode(event.newTheme);

      yield AppSettingsLoaded(event.newTheme, event.currency);
    }
  }
}
