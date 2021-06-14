// 🐦 Flutter imports:
// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/pages/single_asset/single_asset_page.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/views/widgets/favourite_icon.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';
import 'package:crypto_app/ui/views/widgets/price_delta.dart';
import 'package:crypto_app/ui/views/widgets/simple_spark_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AssetsDataTable extends StatelessWidget {
  final List<MarketCoin> marketCoins;
  final Function(MarketCoin, bool) onFavourite;
  const AssetsDataTable({
    Key? key,
    required this.marketCoins,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Theme.of(context).platform.isMobile()
          ? EdgeInsets.zero
          : EdgeInsets.only(bottom: 8.0),
      child: Material(
        borderRadius: Theme.of(context).platform.isMobile()
            ? BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))
            : BorderRadius.circular(10),
        elevation: Theme.of(context).cardTheme.elevation!,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var tablet =
                constraints.maxWidth <= 800 && constraints.maxWidth > 480;
            var mobile = constraints.maxWidth <= 480;
            return Padding(
              padding:
                  !mobile ? const EdgeInsets.only(top: 8.0) : EdgeInsets.zero,
              child: Column(
                children: [
                  !mobile
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            bottom: 8.0,
                          ),
                          child: buildRow(
                            rank: Text('#',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center),
                            iconNameSpark: Text('Name',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.start),
                            d7: Text('7d',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center),
                            h24: Text('24h',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center),
                            h1: Text('1h',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center),
                            price: Text(
                              'Price',
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.end,
                            ),
                            favourite: Text('', textAlign: TextAlign.center),
                          ),
                        )
                      : Container(),
                  !mobile
                      ? Divider(
                          indent: 8,
                          endIndent: 8,
                          height: 1,
                          thickness: 1,
                        )
                      : Container(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          indent: 8,
                          endIndent: 8,
                          height: 1,
                          thickness: 1,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: marketCoins.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mc = marketCoins[index];

                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return SingleAssetPage(
                                    marketCoin: mc,
                                    onFavourite: (String id, bool isChecked) =>
                                        onFavourite(mc, !mc.isFavourited),
                                  );
                                },
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 72,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: buildRow(
                                rank: Text(mc.marketCapRank.toString(),
                                    textAlign: TextAlign.center),
                                iconNameSpark: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: mc.image,
                                      filterQuality: FilterQuality.high,
                                      width: tablet || mobile ? 32 : 44,
                                      height: tablet || mobile ? 32 : 44,
                                      errorWidget: (context, url, error) {
                                        debugPrint(error.toString());
                                        return CircleAvatar(
                                          minRadius: 22,
                                          maxRadius: 22,
                                          backgroundColor:
                                              Theme.of(context).accentColor,
                                          child: Text(
                                            mc.symbol.toUpperCase(),
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        );
                                      },
                                    ),
                                    VerticalDivider(
                                      color: Colors.transparent,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          mc.name,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Material(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0,
                                                        horizontal: 6),
                                                child: Text(
                                                    mc.marketCapRank.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(mc.symbol.toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                          ],
                                        ),
                                      ],
                                    ),
                                    tablet || mobile
                                        ? Container()
                                        : Spacer(
                                            flex: 2,
                                          ),
                                    tablet || mobile
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0),
                                            child: mc.sparklineIn7d != null
                                                ? SimpleSparkLine(
                                                    data:
                                                        mc.sparklineIn7d!.price)
                                                : Container(),
                                          ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                  ],
                                ),
                                d7: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PercentageChangeBox(
                                        mc.priceChangePercentage7dInCurrency),
                                    SizedBox(height: 4),
                                    PriceDelta(mc.priceChange7d),
                                  ],
                                ),
                                h24: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PercentageChangeBox(
                                        mc.priceChangePercentage24hInCurrency),
                                    SizedBox(height: 4),
                                    PriceDelta(mc.priceChange24h),
                                  ],
                                ),
                                h1: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PercentageChangeBox(
                                        mc.priceChangePercentage1hInCurrency),
                                    SizedBox(height: 4),
                                    PriceDelta(mc.priceChange1h)
                                  ],
                                ),
                                price: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      mc.currentPrice.currencyFormatWithPrefix(
                                          BlocProvider.of<AppSettingsBloc>(
                                                  context)
                                              .state
                                              .currency
                                              .currencySymbol,
                                          context),
                                      textAlign: TextAlign.end,
                                    ),
                                    mobile
                                        ? PriceDelta(mc.priceChange24h)
                                        : Container()
                                  ],
                                ),
                                favourite: BlocBuilder<AssetOverviewBloc,
                                    AssetOverviewState>(
                                  builder: (context, state) {
                                    if (state is AssetOverviewLoaded) {
                                      return IconButton(
                                          icon: FavouriteIcon(
                                            isSelected: mc.isFavourited,
                                            size: 22,
                                          ),
                                          onPressed: () {
                                            return onFavourite(
                                                mc, !mc.isFavourited);
                                          });
                                    }
                                    return CupertinoActivityIndicator();
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildRow({
    required Widget rank,
    required Widget iconNameSpark,
    required Widget d7,
    required Widget h24,
    required Widget h1,
    required Widget price,
    required Widget favourite,
  }) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Row(
            children: [
              Expanded(flex: 200, child: iconNameSpark),
              Expanded(flex: 35, child: d7),
              Expanded(flex: 35, child: h24),
              Expanded(flex: 35, child: h1),
              Expanded(flex: 30, child: price),
              Expanded(flex: 15, child: favourite),
            ],
          );
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Row(
            children: [
              Expanded(flex: 80, child: iconNameSpark),
              Expanded(flex: 45, child: d7),
              Expanded(flex: 45, child: h24),
              Expanded(flex: 45, child: h1),
              Expanded(flex: 40, child: price),
              Expanded(flex: 15, child: favourite),
            ],
          );
        }

        return Row(
          children: [
            Expanded(flex: 90, child: iconNameSpark),
            Expanded(flex: 40, child: price),
            Expanded(flex: 15, child: favourite),
          ],
        );
      },
    );
  }
}
