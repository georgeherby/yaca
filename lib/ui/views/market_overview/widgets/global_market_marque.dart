// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/extensions/chosen_currency.dart';
import 'package:yaca/core/models/api/coingecko/global_market.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/utils/percentage_formatters.dart';
import 'package:yaca/ui/views/widgets/percentage_change_box.dart';

class GlobalMarketMarque extends StatefulWidget {
  const GlobalMarketMarque({
    Key? key,
    required this.currencySymbol,
    required this.marketCap,
    required this.marketCap24hChange,
    required this.totalVolume,
    required this.marketCapPercentage,
  }) : super(key: key);

  final String currencySymbol;
  final TotalMarketCap marketCap;
  final double marketCap24hChange;
  final TotalVolume totalVolume;
  final MarketCapPercentage marketCapPercentage;

  @override
  _GlobalMarketMarqueState createState() => _GlobalMarketMarqueState();
}

class _GlobalMarketMarqueState extends State<GlobalMarketMarque> {
  final ScrollController _scrollController = ScrollController();
  final Duration _animationDuration = const Duration(milliseconds: 1000);
  late Timer _animateTicker;

  void scroll() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.offset + 40,
          duration: _animationDuration, curve: Curves.linear);
    }
  }

  @override
  void initState() {
    _animateTicker = Timer.periodic(_animationDuration, (Timer t) => scroll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),

      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount:
          1000, //double.maxFinite.toInt(), https://github.com/flutter/flutter/issues/76640
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Text(
              'Total Market Cap:',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(width: 4),
            Text(
              widget.currencySymbol +
                  compactNumberFormat(context).format(widget.marketCap
                      .getForCurrency(BlocProvider.of<AppSettingsBloc>(context)
                          .state
                          .currency
                          .currencyCode)),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
            PercentageChangeBox(widget.marketCap24hChange),
            const VerticalDivider(
              thickness: 2,
              color: Colors.white,
              indent: kMarqueTapHeight / 4,
              endIndent: kMarqueTapHeight / 4,
            ),
            Text(
              '24h Volume:',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(width: 4),
            Text(
              widget.currencySymbol +
                  compactNumberFormat(context).format(
                    widget.totalVolume.gbp,
                  ),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
            const VerticalDivider(
              thickness: 2,
              color: Colors.white,
              indent: kMarqueTapHeight / 4,
              endIndent: kMarqueTapHeight / 4,
            ),
            Text(
              'Dominance:',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(width: 4),
            Text(
              'BTC ${percentageFormat.format(widget.marketCapPercentage.btc / 100)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              'ETH ${percentageFormat.format(widget.marketCapPercentage.eth / 100)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              'BNB ${percentageFormat.format(widget.marketCapPercentage.bnb / 100)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _animateTicker.cancel();
    super.dispose();
  }
}
