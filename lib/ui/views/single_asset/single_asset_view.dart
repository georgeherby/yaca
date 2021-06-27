// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/singleasset/singleasset_bloc.dart';
import 'package:crypto_app/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/views/singe_asset_exchanges/single_asset_exchanges_view.dart';
import 'package:crypto_app/ui/views/single_asset/widgets/asset_graph_with_switcher.dart';
import 'package:crypto_app/ui/views/single_asset/widgets/expandable_card.dart';
import 'package:crypto_app/ui/views/widgets/back_chevron_button.dart';
import 'package:crypto_app/ui/views/widgets/favourite_icon.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';
import 'package:crypto_app/ui/views/widgets/price_delta.dart';

class SingleAssetView extends StatelessWidget {
  final MarketCoin marketCoin;
  final Function(String, bool) onFavourite;

  const SingleAssetView({
    Key? key,
    required this.marketCoin,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('SingleAssetView');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: (Theme.of(context).platform == TargetPlatform.macOS
            ? kTitleBarMacOSHeight
            : kToolbarHeight),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'coin-icon-${marketCoin.name}',
              child: CachedNetworkImage(
                imageUrl: marketCoin.image,
                height: Theme.of(context).platform == TargetPlatform.macOS
                    ? 24
                    : 32,
                width: 32,
              ),
            ),
            SizedBox(width: 8),
            Hero(
              tag: 'coin-title-${marketCoin.name}',
              child: Text(
                marketCoin.name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        brightness: Theme.of(context).brightness,
        leadingWidth: Theme.of(context).platform == TargetPlatform.macOS
            ? kLeadingButtonWidthMac
            : kLeadingButtonWidth,
        leading: Theme.of(context).platform == TargetPlatform.macOS
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 28,
                    width: 32,
                    alignment: AlignmentDirectional.center,
                    child: BackChevronButton(
                      onTapped: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: FaIcon(FontAwesomeIcons.chevronLeft)),
        actions: [
          BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
            builder: (context, state) {
              if (state is AssetOverviewLoaded) {
                var isFavourite = state.favouriteAssets
                    .where((element) => element.id == marketCoin.id)
                    .isNotEmpty;

                return IconButton(
                    icon: FavouriteIcon(
                      isSelected: isFavourite,
                      size: Theme.of(context).platform == TargetPlatform.macOS
                          ? 20
                          : 22,
                    ),
                    onPressed: () => onFavourite(marketCoin.id, !isFavourite));
              }
              return CupertinoActivityIndicator();
            },
          )
        ],
      ),
      body: BlocBuilder<SingleAssetBloc, SingleAssetState>(
        builder: (context, state) {
          if (state is SingleAssetLoaded) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                  top: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCard(
                      context,
                      true,
                      AssetGraphWithSwitcher(
                        allHistory: state.assetHistorySplits,
                      ),
                    ),
                    SizedBox(height: 8),
                    buildCard(
                      context,
                      false,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price (24h)',
                              style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 4),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('High',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text(marketCoin.high24h
                                                  ?.currencyFormatWithPrefix(
                                                      BlocProvider.of<
                                                                  AppSettingsBloc>(
                                                              context)
                                                          .state
                                                          .currency
                                                          .currencySymbol,
                                                      context) ??
                                              '-'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Low',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text(marketCoin.low24h
                                                  ?.currencyFormatWithPrefix(
                                                      BlocProvider.of<
                                                                  AppSettingsBloc>(
                                                              context)
                                                          .state
                                                          .currency
                                                          .currencySymbol,
                                                      context) ??
                                              '-')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                    color:
                                        Theme.of(context).dividerTheme.color),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Price',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          PriceDelta(marketCoin.priceChange24h,
                                              textSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.fontSize),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Percentage',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          PercentageChangeBox(
                                            marketCoin.priceChangePercentage24h,
                                            padding: EdgeInsets.zero,
                                            showBackground: false,
                                            textSize: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.fontSize,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    buildCard(
                      context,
                      false,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Market Stats',
                              style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 4),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Mkt Cap',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text('\$' +
                                              compactNumberFormat(context)
                                                  .format(marketCoin.marketCap))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Circ Supply',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text(compactNumberFormat(context)
                                              .format(
                                                  marketCoin.circulatingSupply))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tot Supply',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          marketCoin.totalSupply != null
                                              ? Text(compactNumberFormat(
                                                      context)
                                                  .format(
                                                      marketCoin.totalSupply))
                                              : Text('-')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Max Supply',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          marketCoin.maxSupply != null
                                              ? Text(compactNumberFormat(
                                                      context)
                                                  .format(marketCoin.maxSupply))
                                              : Text('-')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                    color:
                                        Theme.of(context).dividerTheme.color),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Rank',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text(marketCoin.marketCapRank
                                              .toString())
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tot Vol',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text(compactNumberFormat(context)
                                              .format(marketCoin.totalVolume))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Ath',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          Text(marketCoin.ath
                                                  ?.currencyFormatWithPrefix(
                                                      '\$', context) ??
                                              '-'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Ath Change',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          PercentageChangeBox(
                                            marketCoin.athChangePercentage,
                                            padding: EdgeInsets.zero,
                                            showBackground: false,
                                            textSize: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.fontSize,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    buildCard(
                      context,
                      false,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Scentiment',
                              style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 8),
                          Row(children: [
                            Expanded(
                              flex: (state.singleAsset
                                          .sentimentVotesDownPercentage *
                                      100)
                                  .toInt(),
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: kNegativeRed,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(state
                                      .singleAsset.sentimentVotesDownPercentage
                                      .toString()),
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: (state.singleAsset
                                          .sentimentVotesUpPercentage *
                                      100)
                                  .toInt(),
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: kPositiveGreen,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(state
                                      .singleAsset.sentimentVotesUpPercentage
                                      .toString()),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.transparent),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Theme.of(context).canvasColor
                                  : Theme.of(context).primaryColor,
                            ),
                            onPressed: () async {
                              BlocProvider.of<SingleAssetExchangeBloc>(context)
                                  .add(SingleAssetExchangeLoad(
                                      marketCoinId: marketCoin.id));
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SingleAssetExchangeView()),
                              );
                            },
                            child: Text(
                              'View markets',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    buildCard(
                      context,
                      false,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description',
                              style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 8),
                          // Text('Description',
                          //     style: Theme.of(context).textTheme.subtitle1),
                          // SizedBox(height: 4),
                          ExpandableCard(
                            collapsedHeight: 80,
                            contents: SelectableHtml(
                              shrinkWrap: true,
                              data: state.singleAsset.description.en,
                              onLinkTap: (String? url,
                                  RenderContext context,
                                  Map<String, String> attributes,
                                  dom.Element? element) async {
                                if (url != null) {
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    debugPrint('Could not launch $url');
                                    return null;
                                  }
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SingleAssetError) {
            debugPrint(state.error.toString());
            return Center(
              child: Icon(CupertinoIcons.exclamationmark),
            );
          } else {
            debugPrint('Loading');
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildCard(BuildContext context, bool removePadding, Widget content) {
    return Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: Theme.of(context).cardTheme.elevation!,
        child: Padding(
            padding: removePadding ? EdgeInsets.zero : EdgeInsets.all(8.0),
            child: content));
  }
}
