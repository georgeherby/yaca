// 🐦 Flutter imports:
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/views/widgets/asset_text_icon.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/views/widgets/refresh_list.dart';

class WhaleTransactionList extends StatelessWidget {
  final List<WhaleTransaction> transactions;
  final ValueGetter<Future<void>> onRefresh;

  const WhaleTransactionList(
      {Key? key, required this.transactions, required this.onRefresh})
      : super(key: key);

  static const double sidePadding = 12;

  @override
  Widget build(BuildContext context) {
    var currencySymbol =
        BlocProvider.of<AppSettingsBloc>(context).state.currency.currencySymbol;

    return Padding(
      padding: getValueForScreenType<EdgeInsets>(
        context: context,
        mobile: EdgeInsets.zero,
        tablet: EdgeInsets.only(bottom: 8.0),
        desktop: EdgeInsets.only(bottom: 8.0),
      ),
      child: Material(
        borderRadius: getValueForScreenType<BorderRadius>(
            context: context,
            mobile: BorderRadius.only(
                topLeft: Radius.circular(kCornerRadiusCirlcular),
                topRight: Radius.circular(kCornerRadiusCirlcular)),
            tablet: BorderRadius.circular(kCornerRadiusCirlcular),
            desktop: BorderRadius.circular(kCornerRadiusCirlcular)),
        elevation: Theme.of(context).cardTheme.elevation!,
        child: RefreshableList(
          onRefresh: onRefresh,
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
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
              var formatDate = DateFormat('HH:mm EEE dd MMM');
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: sidePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AssetTextIcon(
                      iconSize: 32,
                      assetSymbol: transaction.symbol,
                    ),
                    SizedBox(width: sidePadding),
                    Expanded(
                      flex: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${transaction.from.owner ?? "Unknown"} to ${transaction.to.owner ?? "Unknown"}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Avg ${(transaction.amountUsd / transaction.amount).currencyFormatWithPrefix(currencySymbol, context)}',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            formatDate.format(date),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${transaction.amountUsd.currencyFormatWithPrefix(currencySymbol, context, false)}',
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${transaction.amount} ${transaction.symbol.toUpperCase()}',
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
