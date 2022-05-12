// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/extensions/chosen_currency.dart';
import 'package:yaca/core/extensions/theme_mode.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/repositories/preferences/currency_preference.dart';
import 'package:yaca/core/repositories/preferences/theme_preference.dart';

part 'appsettings_event.dart';
part 'appsettings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final ThemePreferenceRepository _darkThemePreferenceRepository;
  final CurrencyPreferenceRepository _currencyPreferenceRepository;

  AppSettingsBloc(
      this._darkThemePreferenceRepository, this._currencyPreferenceRepository)
      : super(AppSettingsInitial()) {
    on<LoadAppSettings>(_onLoadAppSettings);
    on<UpdateCurrencyOptionEvent>(_onUpdateCurrencyOptionEvent);
    on<UpdateThemeOptionEvent>(_onUpdateThemeOptionEvent);
  }

  void _onLoadAppSettings(
    LoadAppSettings event,
    Emitter<AppSettingsState> emit,
  ) async {
    var theme = await _darkThemePreferenceRepository.getThemeMode();
    var currency =
        (await _currencyPreferenceRepository.get()).toChosenCurrency();

    emit(AppSettingsLoaded(theme, currency));
  }

  void _onUpdateCurrencyOptionEvent(
    UpdateCurrencyOptionEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    await _currencyPreferenceRepository
        .set(event.newCurrencyChoice.currencyCode);

    emit(AppSettingsLoaded(event.theme, event.newCurrencyChoice));
  }

  void _onUpdateThemeOptionEvent(
    UpdateThemeOptionEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    debugPrint(event.newTheme.toStr());
    await _darkThemePreferenceRepository.setThemeMode(event.newTheme);

    emit(AppSettingsLoaded(event.newTheme, event.currency));
  }
}
