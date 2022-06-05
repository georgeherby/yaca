part of 'appsettings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();
}

class UpdateCurrencyOptionEvent extends AppSettingsEvent {
  const UpdateCurrencyOptionEvent(this.newCurrencyChoice, this.theme);
  final ChosenCurrency newCurrencyChoice;
  final ThemeMode theme;

  @override
  List<Object> get props => [newCurrencyChoice, theme];
}

class UpdateThemeOptionEvent extends AppSettingsEvent {
  const UpdateThemeOptionEvent(this.currency, this.newTheme);
  final ChosenCurrency currency;
  final ThemeMode newTheme;

  @override
  List<Object> get props => [currency, newTheme];
}

class LoadAppSettings extends AppSettingsEvent {
  const LoadAppSettings();

  @override
  List<Object> get props => [];
}
