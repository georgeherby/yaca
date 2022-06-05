// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  AppSettingsBloc(
      this._darkThemePreferenceRepository, this._currencyPreferenceRepository)
      : super(AppSettingsInitial()) {
    on<LoadAppSettings>(_onLoadAppSettings);
    on<UpdateCurrencyOptionEvent>(_onUpdateCurrencyOptionEvent);
    on<UpdateThemeOptionEvent>(_onUpdateThemeOptionEvent);
  }
  final ThemePreferenceRepository _darkThemePreferenceRepository;
  final CurrencyPreferenceRepository _currencyPreferenceRepository;

  Future<void> _onLoadAppSettings(
    LoadAppSettings event,
    Emitter<AppSettingsState> emit,
  ) async {
    final theme = await _darkThemePreferenceRepository.getThemeMode();
    final currency =
        (await _currencyPreferenceRepository.get()).toChosenCurrency();

    emit(AppSettingsLoaded(theme, currency));
  }

  Future<void> _onUpdateCurrencyOptionEvent(
    UpdateCurrencyOptionEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    await _currencyPreferenceRepository
        .set(event.newCurrencyChoice.currencyCode);

    emit(AppSettingsLoaded(event.theme, event.newCurrencyChoice));
  }

  Future<void> _onUpdateThemeOptionEvent(
    UpdateThemeOptionEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    debugPrint(event.newTheme.toStr());
    await _darkThemePreferenceRepository.setThemeMode(event.newTheme);

    emit(AppSettingsLoaded(event.newTheme, event.currency));
  }
}
