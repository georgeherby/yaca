// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import 'package:crypto_app/app_router.dart';
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/asset/asset_bloc.dart';
import 'package:crypto_app/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:crypto_app/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/utils/currency_formatters.dart';
import 'package:crypto_app/ui/utils/screen_chooser/screen_builder.dart';
import 'package:crypto_app/ui/views/asset/widgets/asset_graph_with_switcher.dart';
import 'package:crypto_app/ui/views/asset/widgets/expandable_card.dart';
import 'package:crypto_app/ui/views/widgets/app_bar_title.dart';
import 'package:crypto_app/ui/views/widgets/asset_icon_web.dart';
import 'package:crypto_app/ui/views/widgets/delta_with_arrow.dart';
import 'package:crypto_app/ui/views/widgets/favourite_icon.dart';
import 'package:crypto_app/ui/views/widgets/general_app_bar.dart';
import 'package:crypto_app/ui/views/widgets/percentage_change_box.dart';
import 'package:crypto_app/ui/views/widgets/primary_button.dart';

class AssetView extends StatelessWidget {
  // final MarketCoin marketCoin;
  // final Function(String, bool) onFavourite;
  final String id;
  const AssetView({Key? key, required this.id
      // required this.marketCoin,
      // required this.onFavourite,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('SingleAssetView');

    var iconSize =
        Theme.of(context).platform == TargetPlatform.macOS ? 24.0 : 32.0;

    var marketCoin = (BlocProvider.of<AssetOverviewBloc>(context).state
            as AssetOverviewLoaded)
        .allAssets
        .firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: GeneralAppBar(
        platform: Theme.of(context).platform,
        leadingButtonType: kIsWeb ? null : LeadingButtonType.back,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'coin-icon-${marketCoin.name}',
              child: AssetIconWeb(
                marketCoin.image,
                assetSymbol: marketCoin.symbol,
                iconSize: iconSize,
              ),
            ),
            const SizedBox(width: 8),
            Hero(
              tag: 'coin-title-${marketCoin.name}',
              child: AppbarTitle(marketCoin.name),
            ),
          ],
        ),
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
                  onPressed: () =>
                      BlocProvider.of<AssetOverviewBloc>(context).add(
                    AssetFavourited(state.allAssets, marketCoin, !isFavourite),
                  ),
                );
                // onPressed: () => onFavourite(marketCoin.id, !isFavourite));
              }
              return PlatformCircularProgressIndicator();
            },
          )
        ],
      ),
      body: BlocBuilder<AssetBloc, AssetState>(
        builder: (context, state) {
          if (state is AssetLoaded) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                  // top: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCard(
                      context,
                      true,
                      AssetGraphWithSwitcher(
                          allHistory: state.assetHistorySplits),
                    ),
                    const SizedBox(height: 8),
                    _buildCard(
                      context,
                      false,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price (24h)',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(height: 4),
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
                                          DeltaWithArrow(
                                              marketCoin.priceChange24h,
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
                    const SizedBox(height: 8),
                    _buildCard(
                      context,
                      false,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Market Stats',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(height: 4),
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
                                              : const Text('-')
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
                                              : const Text('-')
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
                    const SizedBox(height: 8),
                    _buildCard(
                      context,
                      false,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sentiment',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 8),
                          Row(children: [
                            Expanded(
                              flex: (state.singleAsset
                                          .sentimentVotesDownPercentage *
                                      100)
                                  .toInt(),
                              child: Container(
                                height: (kCornerRadiusCirlcular * 2) +
                                    kCornerRadiusCirlcular,
                                decoration: BoxDecoration(
                                  color: kNegativeRed,
                                  borderRadius: const BorderRadius.only(
                                    topLeft:
                                        Radius.circular(kCornerRadiusCirlcular),
                                    bottomLeft:
                                        Radius.circular(kCornerRadiusCirlcular),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    state.singleAsset
                                        .sentimentVotesDownPercentage
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: (state.singleAsset
                                          .sentimentVotesUpPercentage *
                                      100)
                                  .toInt(),
                              child: Container(
                                height: (kCornerRadiusCirlcular * 2) +
                                    kCornerRadiusCirlcular,
                                decoration: BoxDecoration(
                                  color: kPositiveGreen,
                                  borderRadius: const BorderRadius.only(
                                    topRight:
                                        Radius.circular(kCornerRadiusCirlcular),
                                    bottomRight:
                                        Radius.circular(kCornerRadiusCirlcular),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    state.singleAsset.sentimentVotesUpPercentage
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                          child: PrimaryButton(
                            onTap: () async {
                              BlocProvider.of<SingleAssetExchangeBloc>(context)
                                  .add(SingleAssetExchangeLoad(
                                      marketCoinId: marketCoin.id));
                              await context.router
                                  .push(const AssetExchangeRoute());
                            },
                            buttonText: 'View markets',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildCard(
                      context,
                      false,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(height: 8),
                          ScreenBuilder(
                            mobile: ExpandableCard(
                              collapsedHeight: 100,
                              contents:
                                  _buildHtml(state.singleAsset.description.en),
                            ),
                            tablet: ExpandableCard(
                              collapsedHeight: 120,
                              contents:
                                  _buildHtml(state.singleAsset.description.en),
                            ),
                            desktop:
                                _buildHtml(state.singleAsset.description.en),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is AssetError) {
            debugPrint(state.error.toString());
            return Center(
              child: Column(
                children: [
                  const Icon(CupertinoIcons.exclamationmark),
                  Text(state.error)
                ],
              ),
            );
          } else {
            debugPrint('Loading');
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  SelectableHtml _buildHtml(String html) {
    return SelectableHtml(
      shrinkWrap: true,
      data: html,
      onLinkTap: (String? url, RenderContext context,
          Map<String, String> attributes, dom.Element? element) async {
        if (url != null) {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            debugPrint('Could not launch $url');
            return;
          }
        } else {
          return;
        }
      },
    );
  }

  Widget _buildCard(BuildContext context, bool removePadding, Widget content) {
    return Material(
      borderRadius: BorderRadius.circular(kCornerRadiusCirlcular),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: Theme.of(context).cardTheme.elevation!,
      child: Padding(
          padding: removePadding ? EdgeInsets.zero : const EdgeInsets.all(8.0),
          child: content),
    );
  }
}
