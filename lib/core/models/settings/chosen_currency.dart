// 📦 Package imports:
import 'package:equatable/equatable.dart';

class ChosenCurrency extends Equatable {
  final String currencyName;
  final String currencyCode;
  final String currencySymbol;

  const ChosenCurrency(
      {required this.currencyName,
      required this.currencyCode,
      required this.currencySymbol});

  @override
  List<Object?> get props => [currencyName, currencyCode, currencySymbol];
}
