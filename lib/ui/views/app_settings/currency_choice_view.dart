// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';

class CurrencyChoiceView extends StatelessWidget {
  const CurrencyChoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose currency',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
          elevation: Theme.of(context).cardTheme.elevation!,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  AvailableCurrencies.listOfAvailableCurrencies.length,
                  (index) {
                return _buildRow(
                    context,
                    AvailableCurrencies.listOfAvailableCurrencies[index],
                    AvailableCurrencies.listOfAvailableCurrencies.length - 1 ==
                        index);
              })),
        ),
      ),
    );
  }

  Widget _buildRow(
      BuildContext context, ChosenCurrency currencyToUse, bool isLastRow) {
    var bloc = BlocProvider.of<AppSettingsBloc>(context);

    return InkWell(
      onTap: () {
        bloc.add(UpdateCurrencyOptionEvent(currencyToUse, bloc.state.theme));
        context.router.pop();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  Text(currencyToUse.currencySymbol),
                  const VerticalDivider(color: Colors.transparent),
                  Text(currencyToUse.currencyName),
                  const Spacer(),
                  bloc.state.currency == currencyToUse
                      ? const Icon(Ionicons.checkbox_outline)
                      : Container(),
                ],
              ),
            ),
          ),
          isLastRow
              ? Container()
              : const Divider(
                  thickness: kDividerWeighting, height: kDividerWeighting)
        ],
      ),
    );
  }
}
