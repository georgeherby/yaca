// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
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
      padding: Theme.of(context).platform.isMobile()
          ? EdgeInsets.zero
          : EdgeInsets.only(bottom: 8.0),
      child: Material(
        borderRadius: Theme.of(context).platform.isMobile()
            ? BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))
            : BorderRadius.circular(10),
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
                  CircleAvatar(
                    minRadius: 16,
                    maxRadius: 16,
                    child: Text(
                      '${transaction.symbol.toUpperCase()}',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.transparent,
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "From ${transaction.from.owner ?? "Unknown"} to ${transaction.to.owner ?? "Unknown"} "),
                        Text(
                            'Avg ${(transaction.amountUsd / transaction.amount).currencyFormatWithPrefix(currencySymbol, context)}'),
                        Text(
                          formatDate.format(date),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            '${transaction.amountUsd.currencyFormatWithPrefix(currencySymbol, context, false)}'),
                        SizedBox(height: 8),
                        Text(
                            '${transaction.amount} ${transaction.symbol.toUpperCase()}'),
                      ],
                    ),
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
