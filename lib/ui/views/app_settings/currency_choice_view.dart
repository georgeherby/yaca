// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/config/currency.dart';
import 'package:crypto_app/old/models/settings/chosen_currency.dart';
import 'package:crypto_app/old/widgets/scaffold_with_back.dart';

class CurrencyChoiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose currency',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          elevation: Theme.of(context).cardTheme.elevation!,
          child: Column(
              children: List.generate(
                  AvailableCurrencies.listOfAvailableCurrencies.length,
                  (index) {
            return _buildRow(
              context,
              AvailableCurrencies.listOfAvailableCurrencies[index],
            );
          })),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, ChosenCurrency currencyToUse) {
    var bloc = BlocProvider.of<AppSettingsBloc>(context);

    return InkWell(
      onTap: () {
        bloc.add(UpdateCurrencyOptionEvent(currencyToUse, bloc.state.theme));
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              Text(currencyToUse.currencySymbol),
              VerticalDivider(color: Colors.transparent),
              Text(currencyToUse.currencyName),
              Spacer(),
              bloc.state.currency == currencyToUse
                  ? Icon(
                      CupertinoIcons.check_mark,
                    )
                  : Container(),
              VerticalDivider(color: Colors.transparent),
              Icon(CupertinoIcons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
