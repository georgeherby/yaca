part of 'appsettings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();
}

class UpdateCurrencyOptionEvent extends AppSettingsEvent {
  final ChosenCurrency newCurrencyChoice;
  final ThemeMode theme;
  const UpdateCurrencyOptionEvent(this.newCurrencyChoice, this.theme);

  @override
  List<Object> get props => [newCurrencyChoice, theme];
}

class UpdateThemeOptionEvent extends AppSettingsEvent {
  final ChosenCurrency currency;
  final ThemeMode newTheme;
  const UpdateThemeOptionEvent(this.currency, this.newTheme);

  @override
  List<Object> get props => [currency, newTheme];
}

class LoadAppSettings extends AppSettingsEvent {
  const LoadAppSettings();

  @override
  List<Object> get props => [];
}
