// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';

class WhaleTransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  const WhaleTransactionList({Key? key, required this.transactions})
      : super(key: key);

  static const double sidePadding = 24;

  @override
  Widget build(BuildContext context) {
    var currencySymbol =
        BlocProvider.of<AppSettingsBloc>(context).state.currency.currencySymbol;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: Theme.of(context).cardTheme.elevation!,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              indent: sidePadding,
              endIndent: sidePadding,
              height: 1,
              thickness: 1,
            );
          },
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            var transaction = transactions[index];
            var date = DateTime.fromMillisecondsSinceEpoch(
                transaction.timestamp * 1000);
            var formatDate = DateFormat('HH:mm EEE dd MMM ');
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: sidePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      child: Text(
                        '${transaction.symbol.toUpperCase()}',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${transaction.amount} ${transaction.symbol.toUpperCase()} for ${transaction.amountUsd.currencyFormatWithPrefix(currencySymbol, false)}'),
                      Text(
                          'Avg ${(transaction.amountUsd / transaction.amount).currencyFormatWithPrefix(currencySymbol)}'),
                      Text(
                          "From ${transaction.from.owner ?? "Unknown"} to ${transaction.to.owner ?? "Unknown"} "),
                    ],
                  ),
                  Spacer(flex: 5),
                  Text(
                    formatDate.format(date),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
