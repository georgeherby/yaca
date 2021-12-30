// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';
import 'package:yaca/ui/views/widgets/favourite_icon.dart';

class TabletRow extends StatelessWidget {
  final double blockSize;
  final int rank;
  final String symbol;
  final String name;
  final String iconUrl;
  final SparklineIn7d? sparkline;
  final double? sevenDayPercentageChange;
  final double? sevenDayChange;
  final double? oneDayPercentageChange;
  final double? oneDayChange;
  final double? oneHourPercentageChange;
  final double? oneHourChange;
  final double price;
  final bool isFavourited;
  final VoidCallback onFavourite;

  const TabletRow(this.blockSize,
      {Key? key,
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
      required this.onFavourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 4),
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
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 6),
                        child: Text(rank.toString(),
                            style: Theme.of(context).textTheme.caption),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        symbol.toUpperCase(),
                        style: Theme.of(context).textTheme.caption,
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
          const Spacer(),
          Text(
            price.currencyFormatWithPrefix(
                BlocProvider.of<AppSettingsBloc>(context)
                    .state
                    .currency
                    .currencySymbol,
                context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
          BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
            builder: (context, state) {
              if (state is AssetOverviewLoaded) {
                return IconButton(
                    icon: FavouriteIcon(
                      isSelected: isFavourited,
                      size: 18,
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