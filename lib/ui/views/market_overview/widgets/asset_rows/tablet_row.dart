// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/ui/constants/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';
import 'package:yaca/ui/views/widgets/favourite_icon.dart';
import 'package:yaca/ui/views/widgets/ranking_card.dart';

class TabletRow extends StatelessWidget {
  const TabletRow(this.blockSize,
      {super.key,
      required this.rank,
      required this.symbol,
      required this.name,
      required this.iconUrl,
      required this.sparkline,
      required this.sevenDayPercentageChange,
      required this.sevenDayChange,
      required this.oneDayPercentageChange,
      required this.oneDayChange,
      required this.oneHourPercentageChange,
      required this.oneHourChange,
      required this.price,
      required this.isFavourited,
      required this.onFavourite});
  final double blockSize;
  final int rank;
  final String symbol;
  final String name;
  final String? iconUrl;
  final MarketSparkline? sparkline;
  final double? sevenDayPercentageChange;
  final double? sevenDayChange;
  final double? oneDayPercentageChange;
  final double? oneDayChange;
  final double? oneHourPercentageChange;
  final double? oneHourChange;
  final double? price;
  final bool isFavourited;
  final VoidCallback onFavourite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8),
      child: Row(
        children: [
          Hero(
            tag: 'coin-icon-$name',
            child: AssetIconWeb(
              iconUrl,
              iconSize: kIconSize,
              assetSymbol: symbol,
            ),
          ),
          SizedBox(width: blockSize * 2),
          SizedBox(
            width: blockSize * 15,
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
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RankingCard(ranking: rank),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        symbol.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: blockSize * 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: blockSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DeltaWithArrow(
                        sevenDayPercentageChange,
                        isPercentage: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
                SizedBox(
                  width: blockSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DeltaWithArrow(
                        oneDayPercentageChange,
                        isPercentage: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
                SizedBox(
                  width: blockSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DeltaWithArrow(
                        oneHourPercentageChange,
                        isPercentage: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 25,
            child: price != null
                ? Text(
                    price!.currencyFormatWithPrefix(
                        BlocProvider.of<ApplicationSettingsBloc>(context)
                            .state
                            .currency
                            .currencyString,
                        context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  )
                : const SizedBox.shrink(),
          ),
          BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
            builder: (context, state) {
              if (state is AssetOverviewLoaded) {
                return IconButton(
                    icon: FavouriteIcon(
                      isSelected: isFavourited,
                      size: blockSize * 4,
                    ),
                    onPressed: onFavourite);
              }
              return const CupertinoActivityIndicator();
            },
          ),
        ],
      ),
    );
  }
}
