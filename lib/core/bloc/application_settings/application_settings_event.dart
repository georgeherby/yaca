part of 'application_settings_bloc.dart';

abstract class ApplicationSettingsEvent extends Equatable {
  const ApplicationSettingsEvent();
}

class UpdateCurrencyOptionEvent extends ApplicationSettingsEvent {
  const UpdateCurrencyOptionEvent(this.newCurrencyChoice, this.theme);
  final ChosenCurrency newCurrencyChoice;
  final ThemeMode theme;

  @override
  List<Object> get props => [newCurrencyChoice, theme];
}

class UpdateThemeOptionEvent extends ApplicationSettingsEvent {
  const UpdateThemeOptionEvent(this.currency, this.newTheme);
  final ChosenCurrency currency;
  final ThemeMode newTheme;

  @override
  List<Object> get props => [currency, newTheme];
}

class LoadApplicationSettings extends ApplicationSettingsEvent {
  const LoadApplicationSettings();

  @override
  List<Object> get props => [];
}
