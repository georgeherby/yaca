// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/extensions/list.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/views/widgets/asset_icon_web.dart';
import 'package:crypto_app/ui/views/widgets/delta_with_arrow.dart';
import 'package:crypto_app/ui/views/widgets/favourite_icon.dart';
import 'package:crypto_app/ui/views/widgets/simple_spark_line.dart';

class MobileRow extends StatelessWidget {
  final double blockSize;
  final int rank;
  final String symbol;
  final String name;
  final String iconUrl;
  final SparklineIn7d? sparklineIn7d;
  final double? sevenDayPercentageChange;
  final double? sevenDayChange;
  final double? oneDayPercentageChange;
  final double? oneDayChange;
  final double? oneHourPercentageChange;
  final double? oneHourChange;
  final double price;
  final bool isFavourited;
  final VoidCallback onFavourite;

  const MobileRow(this.blockSize,
      {Key? key,
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
      required this.onFavourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconSize = 24.0;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 0),
      child: Row(
        children: [
          Hero(
            tag: 'coin-icon-$name',
            child: AssetIconWeb(
              iconUrl,
              iconSize: iconSize,
              assetSymbol: symbol,
            ),
          ),
          SizedBox(width: 8),
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
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 6),
                        child: Text(rank.toString(),
                            style: Theme.of(context).textTheme.caption),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(symbol.toUpperCase(),
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
          Spacer(flex: 2),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price.currencyFormatWithPrefix(
                      BlocProvider.of<AppSettingsBloc>(context)
                          .state
                          .currency
                          .currencySymbol,
                      context),
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                DeltaWithArrow(
                    oneDayPercentageChange != null
                        ? oneDayPercentageChange! / 100
                        : null,
                    isPercentage: true,
                    textSize: Theme.of(context).textTheme.caption?.fontSize)
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
              return CupertinoActivityIndicator();
            },
          ),
        ],
      ),
    );
  }
}