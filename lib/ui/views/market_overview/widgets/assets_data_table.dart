// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/models/api/market_coins.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/screen_chooser/screen_builder.dart';
import 'package:yaca/ui/views/market_overview/widgets/asset_rows/desktop_header.dart';
import 'package:yaca/ui/views/market_overview/widgets/asset_rows/desktop_row.dart';
import 'package:yaca/ui/views/market_overview/widgets/asset_rows/mobile_row.dart';
import 'package:yaca/ui/views/market_overview/widgets/asset_rows/tablet_header.dart';
import 'package:yaca/ui/views/market_overview/widgets/asset_rows/tablet_row.dart';
import 'package:yaca/ui/views/widgets/refresh_list.dart';
import 'package:yaca/ui/views/widgets/surface.dart';

class AssetsDataTable extends StatelessWidget {
  final bool favouriteOnly;
  final List<MarketCoin> marketCoins;
  final Function(MarketCoin, bool) onFavourite;
  final ValueGetter<Future<void>> onRefresh;
  const AssetsDataTable({
    super.key,
    required this.favouriteOnly,
    required this.marketCoins,
    required this.onFavourite,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    var blockSize = MediaQuery.of(context).size.width / 100;

    return Padding(
      padding: getValueForScreenType<EdgeInsets>(
        context: context,
        mobile: EdgeInsets.zero,
        tablet: const EdgeInsets.only(bottom: 8.0),
        desktop: const EdgeInsets.only(bottom: 8.0),
      ),
      child: Column(
        children: [
          ScreenBuilder(
              desktop: DesktopHeader(blockSize: blockSize),
              tablet: TabletHeader(blockSize: blockSize),
              mobile: Container()),
          Expanded(
            child: MaterialSurface(
              contentPadding: EdgeInsets.zero,
              fullScreen: true,
              child: favouriteOnly && marketCoins.isEmpty
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [Center(child: Text('No Favourites'))])
                  : RefreshableList(
                      onRefresh: onRefresh,
                      child: ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            indent: 8,
                            endIndent: 8,
                            height: kDividerWeighting,
                            thickness: kDividerWeighting,
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
                                  id: mc.market.id,
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
                              child: _buildRow(context, blockSize,
                                  rank: mc.market.marketCapRank!,
                                  symbol: mc.market.symbol,
                                  name: mc.market.name,
                                  sparkline: mc.market.sparklineIn7d,
                                  iconUrl: mc.market.image != null
                                      ? mc.market.image!
                                          .replaceFirst("/large/", "/small/")
                                      : null,
                                  sevenDayChange: mc.priceChange7d,
                                  sevenDayPercentageChange: mc
                                      .market.priceChangePercentage7dInCurrency,
                                  oneDayChange: mc.market.priceChange24h,
                                  oneDayPercentageChange: mc.market
                                      .priceChangePercentage24hInCurrency,
                                  oneHourChange: mc.priceChange1h,
                                  oneHourPercentageChange: mc
                                      .market.priceChangePercentage1hInCurrency,
                                  price: mc.market.currentPrice,
                                  isFavourited: mc.isFavourited,
                                  onFavourite: () =>
                                      onFavourite(mc, !mc.isFavourited)),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, double blockSize,
      {required int rank,
      required String symbol,
      required String name,
      required String? iconUrl,
      required MarketSparkline? sparkline,
      required double? sevenDayPercentageChange,
      required double? sevenDayChange,
      required double? oneDayPercentageChange,
      required double? oneDayChange,
      required double? oneHourPercentageChange,
      required double? oneHourChange,
      required double? price,
      required bool isFavourited,
      required VoidCallback onFavourite}) {
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
