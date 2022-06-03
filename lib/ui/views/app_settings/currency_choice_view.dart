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
import 'package:yaca/ui/views/widgets/surface.dart';

class CurrencyChoiceView extends StatelessWidget {
  const CurrencyChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      title: 'Choose currency',
      body: MaterialSurface(
        // externalPadding:
        //     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
              thickness: kDividerWeighting, height: kDividerWeighting),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: AvailableCurrencies.listOfAvailableCurrencies.length,
          itemBuilder: (context, index) {
            return _buildRow(
                context,
                AvailableCurrencies.listOfAvailableCurrencies[index],
                AvailableCurrencies.listOfAvailableCurrencies.length - 1 ==
                    index);
          },
        ),
      ),
    );
  }

  Widget _buildRow(
      BuildContext context, ChosenCurrency currencyToUse, bool isLastRow) {
    var bloc = BlocProvider.of<AppSettingsBloc>(context);

    return ListTile(
      onTap: () {
        bloc.add(UpdateCurrencyOptionEvent(currencyToUse, bloc.state.theme));
        context.router.pop();
      },
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
              data: ThemeData(
                  iconTheme: IconThemeData(
                      color: bloc.state.currency == currencyToUse
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant)),
              child: currencyToUse.currencyIcon),
        ],
      ),
      title: Text(currencyToUse.currencyName),
      subtitle: Text(
        "${currencyToUse.currencyCode} ${currencyToUse.currencyString}",
        style: Theme.of(context).textTheme.caption,
      ),
      selected: bloc.state.currency == currencyToUse,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bloc.state.currency == currencyToUse
              ? const Icon(Ionicons.checkmark_outline)
              : const SizedBox(height: 0),
        ],
      ),
    );
  }
}
