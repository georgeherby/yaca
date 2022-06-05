// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/extensions/list.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';
import 'package:yaca/ui/views/widgets/favourite_icon.dart';
import 'package:yaca/ui/views/widgets/ranking_card.dart';
import 'package:yaca/ui/views/widgets/simple_spark_line.dart';

class MobileRow extends StatelessWidget {
  final double blockSize;
  final int rank;
  final String symbol;
  final String name;
  final String? iconUrl;
  final MarketSparkline? sparklineIn7d;
  final double? sevenDayPercentageChange;
  final double? sevenDayChange;
  final double? oneDayPercentageChange;
  final double? oneDayChange;
  final double? oneHourPercentageChange;
  final double? oneHourChange;
  final double? price;
  final bool isFavourited;
  final VoidCallback onFavourite;

  const MobileRow(this.blockSize,
      {super.key,
      required this.rank,
      required this.symbol,
      required this.name,
      required this.iconUrl,
      required this.sparklineIn7d,
      required this.sevenDayPercentageChange,
      required this.sevenDayChange,
      required this.oneDayPercentageChange,
      required this.oneDayChange,
      required this.oneHourPercentageChange,
      required this.oneHourChange,
      required this.price,
      required this.isFavourited,
      required this.onFavourite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 0),
      child: Row(
        children: [
          Hero(
            tag: 'coin-icon-$name',
            child: AssetIconWeb(
              iconUrl,
              iconSize: 24,
              assetSymbol: symbol,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'coin-title-$name',
                  child: Text(
                    name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RankingCard(ranking: rank),
                    const SizedBox(width: 4),
                    Text(symbol.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SimpleSparkLine(
                  data: sparklineIn7d!.price
                      .mapIndexed((element, index) {
                        if (index % 4 == 0) {
                          return element;
                        }
                      })
                      .whereType<double>()
                      .toList(),
                  width: blockSize * 20),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                price != null
                    ? Text(
                        price!.currencyFormatWithPrefix(
                            BlocProvider.of<AppSettingsBloc>(context)
                                .state
                                .currency
                                .currencyString,
                            context),
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : const SizedBox.shrink(),
                DeltaWithArrow(
                    oneDayPercentageChange != null
                        ? oneDayPercentageChange!
                        : null,
                    isPercentage: true,
                    textSize: Theme.of(context).textTheme.bodySmall?.fontSize)
              ],
            ),
          ),
          BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
            builder: (context, state) {
              if (state is AssetOverviewLoaded) {
                return IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  onPressed: onFavourite,
                  icon: FavouriteIcon(
                    isSelected: isFavourited,
                    size: 14,
                  ),
                );
              }
              return const CupertinoActivityIndicator();
            },
          ),
        ],
      ),
    );
  }
}
