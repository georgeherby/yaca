import 'package:crypto_app/old/models/api/whalealerts/whale_transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crypto_app/old/utils/currency_formatters.dart';

class WhaleTransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  const WhaleTransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          Transactions transaction = transactions[index];
          DateTime date = DateTime.fromMillisecondsSinceEpoch(transaction.timestamp * 1000);
          DateFormat formatDate = DateFormat("HH:mm EEE dd MMM ");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    child: Text(
                      "${transaction.symbol.toUpperCase()}",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${transaction.amount} ${transaction.symbol.toUpperCase()} for ${transaction.amountUsd.coinCurrencyFormat('en_US', false)}"),
                    Text(
                        "Avg ${(transaction.amountUsd / transaction.amount).coinCurrencyFormat('en_US')}"),
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
        });
  }
}
