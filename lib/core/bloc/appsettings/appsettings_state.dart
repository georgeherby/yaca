part of 'appsettings_bloc.dart';

abstract class AppSettingsState extends Equatable {

  const AppSettingsState(this.theme, this.currency);
  final ThemeMode theme;
  final ChosenCurrency currency;

  @override
  List<Object> get props => [theme, currency];
}

class AppSettingsInitial extends AppSettingsState {
  AppSettingsInitial()
      : super(ThemeMode.system, AvailableCurrencies.defaultCurrency);
}

class AppSettingsLoaded extends AppSettingsState {
  const AppSettingsLoaded(super.theme, super.currency);
}
