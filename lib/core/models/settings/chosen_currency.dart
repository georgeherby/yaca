// 📦 Package imports:
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/ui/views/widgets/icons/svg_icon.dart';

class ChosenCurrency extends Equatable {
  final String currencyName;
  final String currencyCode;
  final CurrencyType currencyType;
  final SvgIcon currencyIcon;
  final String currencyString;

  const ChosenCurrency({
    required this.currencyName,
    required this.currencyCode,
    required this.currencyType,
    required this.currencyIcon,
    required this.currencyString,
  });

  @override
  List<Object?> get props => [currencyName, currencyCode, currencyIcon];
}

enum CurrencyType {
  stableCoin,
  crypto,
  fiat,
}
