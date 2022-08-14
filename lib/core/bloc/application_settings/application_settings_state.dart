part of 'application_settings_bloc.dart';

abstract class ApplicationSettingsState extends Equatable {
  const ApplicationSettingsState(this.theme, this.currency);
  final ThemeMode theme;
  final ChosenCurrency currency;

  @override
  List<Object> get props => [theme, currency];
}

class ApplicationSettingsInitial extends ApplicationSettingsState {
  ApplicationSettingsInitial()
      : super(ThemeMode.system, AvailableCurrencies.defaultCurrency);
}

class ApplicationSettingsLoaded extends ApplicationSettingsState {
  const ApplicationSettingsLoaded(super.theme, super.currency);
}
