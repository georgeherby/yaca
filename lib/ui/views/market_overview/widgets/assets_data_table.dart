// 🐦 Flutter imports:
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:crypto_app/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/utils/screen_chooser/screen_builder.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/rows/desktop_row.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/rows/mobile_row.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/rows/tablet_row.dart';
import 'package:crypto_app/ui/views/widgets/refresh_list.dart';

class AssetsDataTable extends StatelessWidget {
  final bool favouriteOnly;
  final List<MarketCoin> marketCoins;
  final Function(MarketCoin, bool) onFavourite;
  final ValueGetter<Future<void>> onRefresh;
  const AssetsDataTable({
    Key? key,
    required this.favouriteOnly,
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
        child: favouriteOnly && marketCoins.isEmpty
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Center(child: Text('No Favourites'))])
            : RefreshableList(
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
                        await context.router.push(
                          AssetRoute(
                            id: mc.id,
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
                        child: _buildRow(context,
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
                            onFavourite: () =>
                                onFavourite(mc, !mc.isFavourited)),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget _buildRow(BuildContext context,
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
    var blockSize = MediaQuery.of(context).size.width / 100;

    return ScreenBuilder(
      desktop: DesktopRow(blockSize,
          rank: rank,
          symbol: symbol,
          name: name,
          iconUrl: iconUrl,
          sparkline: sparkline,
          sevenDayPercentageChange: sevenDayPercentageChange,
          sevenDayChange: sevenDayChange,
          oneDayPercentageChange: oneDayPercentageChange,
          oneDayChange: oneDayChange,
          oneHourPercentageChange: oneHourPercentageChange,
          oneHourChange: oneHourChange,
          price: price,
          isFavourited: isFavourited,
          onFavourite: onFavourite),
      tablet: TabletRow(blockSize,
          rank: rank,
          symbol: symbol,
          name: name,
          sparkline: sparkline,
          iconUrl: iconUrl,
          sevenDayChange: sevenDayChange,
          sevenDayPercentageChange: sevenDayPercentageChange,
          oneDayChange: oneDayChange,
          oneDayPercentageChange: oneDayPercentageChange,
          oneHourChange: oneHourChange,
          oneHourPercentageChange: oneHourPercentageChange,
          price: price,
          isFavourited: isFavourited,
          onFavourite: onFavourite),
      mobile: MobileRow(blockSize,
          rank: rank,
          symbol: symbol,
          name: name,
          sparklineIn7d: sparkline,
          iconUrl: iconUrl,
          sevenDayChange: sevenDayChange,
          sevenDayPercentageChange: sevenDayPercentageChange,
          oneDayChange: oneDayChange,
          oneDayPercentageChange: oneDayPercentageChange,
          oneHourChange: oneHourChange,
          oneHourPercentageChange: oneHourPercentageChange,
          price: price,
          isFavourited: isFavourited,
          onFavourite: onFavourite),
    );
  }
}
