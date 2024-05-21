// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:yaca/core/config/currency.dart';
import 'package:yaca/core/models/api/whale_alerts/whale_transactions.dart';
import 'package:yaca/ui/constants/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/asset_text_icon.dart';
import 'package:yaca/ui/views/widgets/refresh_list.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

class WhaleTransactionList extends StatelessWidget {
  const WhaleTransactionList(
      {super.key, required this.transactions, required this.onRefresh});
  final List<WhaleTransaction> transactions;
  final ValueGetter<Future<void>> onRefresh;

  static const double sidePadding = 12;

  @override
  Widget build(BuildContext context) {
    final currencyString = AvailableCurrencies.usd.currencyString;

    return ElevatedCard(
      fullScreen: true,
      child: RefreshableList(
        onRefresh: onRefresh,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
                indent: sidePadding,
                endIndent: sidePadding,
                height: kDividerWeighting,
                thickness: kDividerWeighting);
          },
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final date = DateTime.fromMillisecondsSinceEpoch(
                transaction.timestamp * 1000);
            final formatDate = DateFormat('HH:mm EEE dd MMM');

            return ListTile(
              isThreeLine: true,
              leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AssetTextIcon(
                      iconSize: kIconSize,
                      assetSymbol: transaction.symbol,
                    ),
                  ]),
              title: Text(
                "${transaction.from.owner ?? "Unknown"} to ${transaction.to.owner ?? "Unknown"}",
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    'Avg ${(transaction.amountUsd / transaction.amount).currencyFormatWithPrefix(currencyString, context)}',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatDate.format(date),
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    transaction.amountUsd.currencyFormatWithPrefix(
                        currencyString, context,
                        showDecimals: false),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '${transaction.amount.volumeFormat(context)} ${transaction.symbol.toUpperCase()}',
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
