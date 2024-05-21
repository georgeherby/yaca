// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChosenCurrency extends Equatable {
  const ChosenCurrency({
    required this.currencyName,
    required this.currencyCode,
    required this.currencyType,
    required this.currencyIcon,
    required this.currencyString,
  });
  final String currencyName;
  final String currencyCode;
  final CurrencyType currencyType;
  final IconData currencyIcon;
  final String currencyString;

  @override
  List<Object?> get props => [currencyName, currencyCode, currencyIcon];
}

enum CurrencyType {
  stableCoin,
  crypto,
  fiat,
}
