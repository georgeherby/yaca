// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher_string.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';
import 'package:yaca/core/bloc/asset/asset_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/single_asset_exchange/single_asset_exchange_bloc.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/extensions/string.dart';
import 'package:yaca/ui/constants/colours.dart';
import 'package:yaca/ui/constants/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/utils/screen_chooser/screen_builder.dart';
import 'package:yaca/ui/views/single_asset/widgets/asset_graph_with_switcher.dart';
import 'package:yaca/ui/views/common/errors/error_view.dart';
import 'package:yaca/ui/views/common/full_page_loading_view.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';
import 'package:yaca/ui/views/widgets/favourite_icon.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';
import 'package:yaca/ui/views/widgets/refresh_list.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

class SingleAssetView extends StatelessWidget {
  const SingleAssetView({super.key, required this.id});
  final String id;

  static const kHorizontalPadding = 4.0;

  void _onRefresh(BuildContext context) {
    return BlocProvider.of<AssetBloc>(context).add(
      AssetLoad(
          currencyCode:
              BlocProvider.of<ApplicationSettingsBloc>(context).state.currency,
          marketCoinId: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('SingleAssetView');

    final currency =
        BlocProvider.of<ApplicationSettingsBloc>(context).state.currency;

    return BlocBuilder<AssetBloc, AssetState>(builder: (context, state) {
      if (state is AssetLoaded) {
        final singleAsset = state.coin;
        final marketDataPerCurrency = state.coin.marketData!.dataByCurrency
            .where((element) =>
                element.coinId.equalsIgnoreCase(currency.currencyCode))
            .first;

        return Scaffold(
          appBar: GeneralAppBar(
            platform: Theme.of(context).platform,
            leadingButtonType: kIsWeb && Theme.of(context).platform.isDesktop()
                ? null
                : LeadingButtonType.back,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'coin-icon-${singleAsset.name}',
                  child: AssetIconWeb(
                    singleAsset.image?.small,
                    assetSymbol: singleAsset.symbol,
                    iconSize: Theme.of(context).platform.isMacOnly()
                        ? kIconSizeMacAppBar
                        : kIconSize,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Hero(
                    tag: 'coin-title-${singleAsset.name}',
                    child: AppBarTitle(singleAsset.name),
                  ),
                ),
              ],
            ),
            actions: [
              BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
                builder: (context, state) {
                  if (state is AssetOverviewLoaded) {
                    final isFavourite = state.favourites
                        .where((element) => element.market.id == singleAsset.id)
                        .isNotEmpty;

                    return IconButton(
                      icon: FavouriteIcon(
                        isSelected: isFavourite,
                        size: Theme.of(context).platform == TargetPlatform.macOS
                            ? 20
                            : Theme.of(context)
                                .appBarTheme
                                .actionsIconTheme
                                ?.size,
                      ),
                      onPressed: () =>
                          BlocProvider.of<AssetOverviewBloc>(context).add(
                        AssetFavourited(
                            allMarketCoins: state.allAssets,
                            favourites: state.favourites,
                            symbol: singleAsset.symbol,
                            name: singleAsset.name,
                            coinId: singleAsset.id,
                            addToFavourite: !isFavourite),
                      ),
                    );
                  }
                  return PlatformCircularProgressIndicator();
                },
              )
            ],
          ),
          body: RefreshableList(
            onRefresh: () async => _onRefresh(context),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    if (currency.currencyCode
                        .equalsIgnoreCase(singleAsset.symbol))
                      _buildElevatedCard(
                          context,
                          false,
                          Text(
                              'No graph is possible. Your chosen currency ${currency.currencyCode.toUpperCase()} is the same as the coin your are viewing (${singleAsset.symbol.toUpperCase()}).'))
                    else
                      AssetGraphWithSwitcher(
                          allHistory: state.assetHistorySplits),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildElevatedCard(
                        context,
                        false,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price (24h)',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            const SizedBox(height: 4),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    .labelSmall),
                                            Text(marketDataPerCurrency.high24h
                                                    ?.currencyFormatWithPrefix(
                                                        currency.currencyString,
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
                                                    .labelSmall),
                                            Text(marketDataPerCurrency.low24h
                                                    ?.currencyFormatWithPrefix(
                                                        currency.currencyString,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    .labelSmall),
                                            DeltaWithArrow(
                                                marketDataPerCurrency
                                                    .priceChange24hInCurrency,
                                                textSize: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
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
                                                    .labelSmall),
                                            DeltaWithArrow(
                                              marketDataPerCurrency
                                                          .priceChange24hInCurrency !=
                                                      null
                                                  ? marketDataPerCurrency
                                                      .priceChange24hInCurrency!
                                                  : null,
                                              isPercentage: true,
                                              textSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
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
                            const Divider(),
                            Text('Market Stats',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface)),
                            const SizedBox(height: 4),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    .labelSmall),
                                            Text(marketDataPerCurrency
                                                        .marketCap !=
                                                    null
                                                ? currency.currencyString +
                                                    compactNumberFormat(context)
                                                        .format(
                                                            marketDataPerCurrency
                                                                .marketCap)
                                                : '-')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Circ Supply',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall),
                                            Text(compactNumberFormat(context)
                                                .format(singleAsset.marketData!
                                                    .circulatingSupply))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Tot Supply',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall),
                                            if (singleAsset
                                                    .marketData?.totalSupply !=
                                                null)
                                              Text(compactNumberFormat(context)
                                                  .format(singleAsset
                                                      .marketData!.totalSupply))
                                            else
                                              const Text('-')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Max Supply',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall),
                                            if (singleAsset
                                                    .marketData?.maxSupply !=
                                                null)
                                              Text(compactNumberFormat(context)
                                                  .format(singleAsset
                                                      .marketData!.maxSupply))
                                            else
                                              const Text('-')
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    .labelSmall),
                                            Text(singleAsset.marketCapRank
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
                                                    .labelSmall),
                                            Text(marketDataPerCurrency
                                                        .totalVolume !=
                                                    null
                                                ? compactNumberFormat(context)
                                                    .format(
                                                        marketDataPerCurrency
                                                            .totalVolume)
                                                : '-')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Ath',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall),
                                            Text(marketDataPerCurrency.ath !=
                                                    null
                                                ? marketDataPerCurrency.ath!
                                                    .currencyFormatWithPrefix(
                                                        currency.currencyString,
                                                        context)
                                                : '-'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Ath Change',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall),
                                            DeltaWithArrow(
                                              marketDataPerCurrency
                                                  .athChangePercentage,
                                              isPercentage: true,
                                              textSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
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
                            if (state.coin.sentimentVotesDownPercentage !=
                                    null &&
                                state.coin.sentimentVotesUpPercentage != null)
                              const Divider()
                            else
                              Container(),
                            if (state.coin.sentimentVotesDownPercentage !=
                                    null &&
                                state.coin.sentimentVotesUpPercentage != null)
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sentiment',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(children: [
                                      Expanded(
                                        flex: (state.coin
                                                    .sentimentVotesDownPercentage! *
                                                100)
                                            .toInt(),
                                        child: Container(
                                          height: (kCornerRadiusCircular * 2) +
                                              kCornerRadiusCircular,
                                          decoration: BoxDecoration(
                                            color: false
                                                .toPositiveNegativeColorFromBool(
                                                    context),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kCornerRadiusCircular),
                                              bottomLeft: Radius.circular(
                                                  kCornerRadiusCircular),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state.coin
                                                  .sentimentVotesDownPercentage
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: false
                                                          .toPositiveNegativeForegroundColorFromBool(
                                                              context)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: (state.coin
                                                    .sentimentVotesUpPercentage! *
                                                100)
                                            .toInt(),
                                        child: Container(
                                          height: (kCornerRadiusCircular * 2) +
                                              kCornerRadiusCircular,
                                          decoration: BoxDecoration(
                                            color: true
                                                .toPositiveNegativeColorFromBool(
                                                    context),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(
                                                  kCornerRadiusCircular),
                                              bottomRight: Radius.circular(
                                                  kCornerRadiusCircular),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state.coin
                                                  .sentimentVotesUpPercentage
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: true
                                                          .toPositiveNegativeForegroundColorFromBool(
                                                              context)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ])
                                  ])
                            else
                              Container(),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: FilledButton.tonal(
                                onPressed: () async {
                                  BlocProvider.of<SingleAssetExchangeBloc>(
                                          context)
                                      .add(SingleAssetExchangeLoad(
                                          marketCoinId: singleAsset.id));
                                  await context.router
                                      .push(const AssetExchangeRoute());
                                },
                                child: const Text('View markets'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state.coin.description?.translations['en'] != null &&
                          state.coin.description!.translations['en']!.isNotEmpty)
                        _buildElevatedCard(
                          context,
                          false,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              const SizedBox(height: 8),
                              ScreenBuilder(
                                mobile: _buildHtml(
                                    state.coin.description!.translations['en']!,
                                    context),
                                tablet: _buildHtml(
                                    state.coin.description!.translations['en']!,
                                    context),
                                desktop: _buildHtml(
                                    state.coin.description!.translations['en']!,
                                    context),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        )
                      else
                        Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (state is AssetError) {
        debugPrint(state.error);
        return ErrorView(
            onRefresh: () async => _onRefresh(context), error: state.error);
      }
      return const FullPageLoadingView();
    });
  }

  SelectableHtml _buildHtml(String html, BuildContext context) {
    debugPrint(html);

    return SelectableHtml(
      shrinkWrap: true,
      data: html,
      style: {
        '*': Style.fromTextStyle(Theme.of(context).textTheme.bodyMedium!)
      },
      onLinkTap: (String? url, RenderContext context,
          Map<String, String> attributes, dom.Element? element) async {
        if (url != null) {
          if (await canLaunchUrlString(url)) {
            await launchUrlString(url);
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

  Widget _buildElevatedCard(
      BuildContext context, bool removePadding, Widget content) {
    return ElevatedCard(
        contentPadding:
            removePadding ? EdgeInsets.zero : const EdgeInsets.all(8.0),
        child: content);
  }
}
