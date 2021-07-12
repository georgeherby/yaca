// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/pages/single_asset/single_asset_page.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/views/widgets/favourite_icon.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';
import 'package:crypto_app/ui/views/widgets/price_delta.dart';
import 'package:crypto_app/ui/views/widgets/refresh_list.dart';
import 'package:crypto_app/ui/views/widgets/simple_spark_line.dart';

class AssetsDataTable extends StatelessWidget {
  final List<MarketCoin> marketCoins;
  final Function(MarketCoin, bool) onFavourite;
  final ValueGetter<Future<void>> onRefresh;
  const AssetsDataTable({
    Key? key,
    required this.marketCoins,
    required this.onFavourite,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            tablet: BorderRadius.circular(10),
            desktop: BorderRadius.circular(10)),
        elevation: Theme.of(context).cardTheme.elevation!,
        child: RefreshableList(
          onRefresh: onRefresh,
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: 8,
                endIndent: 8,
                height: 1,
                thickness: 1,
              );
            },
            shrinkWrap: false,
            itemCount: marketCoins.length,
            itemBuilder: (BuildContext context, int index) {
              var mc = marketCoins[index];

              return InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    platformPageRoute(
                      context: context,
                      fullscreenDialog: true,
                      builder: (context) {
                        return SingleAssetPage(
                          marketCoin: mc,
                          onFavourite: (String id, bool isChecked) =>
                              onFavourite(mc, isChecked),
                        );
                      },
                    ),
                  );
                },
                child: SizedBox(
                  height: getValueForScreenType<double>(
                    context: context,
                    desktop: 62,
                    tablet: 60,
                    mobile: 60,
                  ),
                  child: buildRow(
                      rank: mc.marketCapRank,
                      symbol: mc.symbol,
                      name: mc.name,
                      sparkline: mc.sparklineIn7d,
                      iconUrl: mc.image,
                      sevenDayChange: mc.priceChange7d,
                      sevenDayPercentageChange:
                          mc.priceChangePercentage7dInCurrency,
                      oneDayChange: mc.priceChange24h,
                      oneDayPercentageChange:
                          mc.priceChangePercentage24hInCurrency,
                      oneHourChange: mc.priceChange1h,
                      oneHourPercentageChange:
                          mc.priceChangePercentage1hInCurrency,
                      price: mc.currentPrice,
                      isFavourited: mc.isFavourited,
                      onFavourite: () => onFavourite(mc, !mc.isFavourited)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildRow(
      {required int rank,
      required String symbol,
      required String name,
      required String iconUrl,
      required SparklineIn7d? sparkline,
      required double? sevenDayPercentageChange,
      required double? sevenDayChange,
      required double? oneDayPercentageChange,
      required double? oneDayChange,
      required double? oneHourPercentageChange,
      required double? oneHourChange,
      required double price,
      required bool isFavourited,
      required VoidCallback onFavourite}) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Desktop Layout
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          var blockSize = MediaQuery.of(context).size.width / 100;
          var iconSize = 32.0;
          return Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8),
            child: Row(
              children: [
                Hero(
                  tag: 'coin-icon-$name',
                  child: CachedNetworkImage(
                    imageUrl: iconUrl,
                    filterQuality: FilterQuality.high,
                    width: iconSize,
                    height: iconSize,
                    imageBuilder: (context, imageProvider) => Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      debugPrint(error.toString());
                      return CircleAvatar(
                        minRadius: iconSize / 2,
                        maxRadius: iconSize / 2,
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text(
                          symbol,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: blockSize * 2),
                SizedBox(
                  width: blockSize * 16,
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
                          SizedBox(width: 6),
                          Text(symbol.toUpperCase(),
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ],
                  ),
                ),
                sparkline != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SimpleSparkLine(
                            data: sparkline.price, width: blockSize * 20),
                      )
                    : Container(),
                SizedBox(
                  width: blockSize * 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: blockSize * 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PercentageChangeBox(sevenDayPercentageChange),
                            SizedBox(height: 4),
                            PriceDelta(sevenDayChange),
                          ],
                        ),
                      ),
                      SizedBox(width: blockSize * 1),
                      SizedBox(
                        width: blockSize * 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PercentageChangeBox(oneDayPercentageChange),
                            SizedBox(height: 4),
                            PriceDelta(oneDayChange),
                          ],
                        ),
                      ),
                      SizedBox(width: blockSize * 1),
                      SizedBox(
                        width: blockSize * 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PercentageChangeBox(oneHourPercentageChange),
                            SizedBox(height: 4),
                            PriceDelta(oneHourChange)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Text(
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
                ),
                Spacer(flex: 1),
                BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
                  builder: (context, state) {
                    if (state is AssetOverviewLoaded) {
                      return IconButton(
                          icon: FavouriteIcon(
                            isSelected: isFavourited,
                            size: 22,
                          ),
                          onPressed: onFavourite);
                    }
                    return CupertinoActivityIndicator();
                  },
                ),
              ],
            ),
          );
        }
        // Tablet Layout
        else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          var blockSize = MediaQuery.of(context).size.width / 100;
          var iconSize = 32.0;
          return Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 4),
            child: Row(
              children: [
                Hero(
                  tag: 'coin-icon-$name',
                  child: CachedNetworkImage(
                    imageUrl: iconUrl,
                    filterQuality: FilterQuality.high,
                    width: iconSize,
                    height: iconSize,
                    imageBuilder: (context, imageProvider) => Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      debugPrint(error.toString());
                      return CircleAvatar(
                        minRadius: iconSize / 2,
                        maxRadius: iconSize / 2,
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text(
                          symbol,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    },
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 6),
                              child: Text(rank.toString(),
                                  style: Theme.of(context).textTheme.caption),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(symbol.toUpperCase(),
                              style: Theme.of(context).textTheme.caption),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PercentageChangeBox(sevenDayPercentageChange),
                            SizedBox(height: 4),
                            PriceDelta(sevenDayChange),
                          ],
                        ),
                      ),
                      SizedBox(width: blockSize * 1),
                      SizedBox(
                        width: blockSize * 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PercentageChangeBox(oneDayPercentageChange),
                            SizedBox(height: 4),
                            PriceDelta(oneDayChange),
                          ],
                        ),
                      ),
                      SizedBox(width: blockSize * 1),
                      SizedBox(
                        width: blockSize * 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PercentageChangeBox(oneHourPercentageChange),
                            SizedBox(height: 4),
                            PriceDelta(oneHourChange)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
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

                // Spacer(),
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
                    return CupertinoActivityIndicator();
                  },
                ),
              ],
            ),
          );
        }
        var iconSize = 32.0;
        // Mobile Layout
        return Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 0),
          child: Row(
            children: [
              Hero(
                tag: 'coin-icon-$name',
                child: CachedNetworkImage(
                  imageUrl: iconUrl,
                  filterQuality: FilterQuality.high,
                  width: iconSize,
                  height: iconSize,
                  imageBuilder: (context, imageProvider) => Container(
                    width: iconSize,
                    height: iconSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    debugPrint(error.toString());
                    return CircleAvatar(
                      minRadius: iconSize / 2,
                      maxRadius: iconSize / 2,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Text(
                        symbol,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 16),
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
              Spacer(),
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
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    PriceDelta(oneDayChange,
                        textSize:
                            Theme.of(context).textTheme.subtitle2?.fontSize)
                  ],
                ),
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
                  return CupertinoActivityIndicator();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
