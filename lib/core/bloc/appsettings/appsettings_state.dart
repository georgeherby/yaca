part of 'appsettings_bloc.dart';

abstract class AppSettingsState extends Equatable {
  final ThemeMode theme;
  final ChosenCurrency currency;

  const AppSettingsState(this.theme, this.currency);

  @override
  List<Object> get props => [theme, currency];
}

class AppSettingsInitial extends AppSettingsState {
  AppSettingsInitial()
      : super(ThemeMode.system, AvailableCurrencies.defaultCurrency);
}

class AppSettingsLoaded extends AppSettingsState {
  const AppSettingsLoaded(ThemeMode theme, ChosenCurrency currency)
      : super(theme, currency);
}
