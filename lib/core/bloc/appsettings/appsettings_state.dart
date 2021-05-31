part of 'appsettings_bloc.dart';

abstract class AppSettingsState extends Equatable {
  final ThemeMode theme;
  final ChosenCurrency currency;

  const AppSettingsState(this.theme, this.currency);

  @override
  List<Object> get props => [];
}

class AppSettingsInitial extends AppSettingsState {
  AppSettingsInitial()
      : super(ThemeMode.system, AvailableCurrencies.defaultCurrency);

  @override
  List<Object> get props =>
      [ThemeMode.system, AvailableCurrencies.defaultCurrency];
}

class AppSettingsLoaded extends AppSettingsState {
  AppSettingsLoaded(ThemeMode theme, ChosenCurrency currency)
      : super(theme, currency);

  @override
  List<Object> get props => [theme, currency];
}