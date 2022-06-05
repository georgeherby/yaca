// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/extensions/chosen_currency.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/utils/percentage_formatters.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';

class GlobalMarketMarque extends StatefulWidget {
  const GlobalMarketMarque({
    super.key,
    required this.currencyString,
    required this.marketCap,
    required this.marketCap24hPercentageChange,
    required this.totalVolume,
    required this.marketCapPercentage,
  });

  final String currencyString;
  final Map<String, double>? marketCap;
  final double? marketCap24hPercentageChange;
  final Map<String, double>? totalVolume;
  final Map<String, double>? marketCapPercentage;

  @override
  State<GlobalMarketMarque> createState() => _GlobalMarketMarqueState();
}

class _GlobalMarketMarqueState extends State<GlobalMarketMarque> {
  final ScrollController _scrollController = ScrollController();
  final Duration _animationDuration = const Duration(milliseconds: 1000);
  late Timer _animateTicker;
  static const Color _textColor = Colors.white;

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
            const VerticalDivider(
              thickness: 2,
              color: _textColor,
              indent: kMarqueTapHeight / 4,
              endIndent: kMarqueTapHeight / 4,
            ),
            widget.marketCap != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Total Market Cap:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: _textColor),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.currencyString +
                            compactNumberFormat(context).format(
                              widget.marketCap!.getForCurrency(
                                  BlocProvider.of<AppSettingsBloc>(context)
                                      .state
                                      .currency
                                      .currencyCode),
                            ),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: _textColor),
                      ),
                      const SizedBox(width: 4),
                      DeltaWithArrow(
                        widget.marketCap24hPercentageChange,
                        isPercentage: true,
                        textColor: _textColor,
                        useTextColorForArrow: true,
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        color: _textColor,
                        indent: kMarqueTapHeight / 4,
                        endIndent: kMarqueTapHeight / 4,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            widget.totalVolume != null
                ? Row(
                    children: [
                      Text(
                        '24h Volume:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: _textColor),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.currencyString +
                            compactNumberFormat(context).format(
                              widget.totalVolume!.getForCurrency(
                                  BlocProvider.of<AppSettingsBloc>(context)
                                      .state
                                      .currency
                                      .currencyCode),
                            ),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: _textColor),
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        color: _textColor,
                        indent: kMarqueTapHeight / 4,
                        endIndent: kMarqueTapHeight / 4,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Text(
              'Dominance:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: _textColor),
            ),
            const SizedBox(width: 4),
            Text(
              'BTC ${percentageFormat.format(widget.marketCapPercentage!["btc"]! / 100)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: _textColor),
            ),
            const SizedBox(width: 8),
            Text(
              'ETH ${percentageFormat.format(widget.marketCapPercentage!["eth"]! / 100)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: _textColor),
            ),
            const SizedBox(width: 8),
            Text(
              'BNB ${percentageFormat.format(widget.marketCapPercentage!["bnb"]! / 100)}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: _textColor),
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
