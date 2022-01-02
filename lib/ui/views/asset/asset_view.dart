// 🐦 Flutter imports:
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
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset/asset_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/utils/currency_formatters.dart';
import 'package:yaca/ui/utils/screen_chooser/screen_builder.dart';
import 'package:yaca/ui/views/asset/widgets/asset_graph_with_switcher.dart';
import 'package:yaca/ui/views/errors/error_view.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/delta_with_arrow.dart';
import 'package:yaca/ui/views/widgets/favourite_icon.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';
import 'package:yaca/ui/views/widgets/primary_button.dart';
import 'package:yaca/ui/views/widgets/refresh_list.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';

class AssetView extends StatelessWidget {
  final String id;
  const AssetView({Key? key, required this.id}) : super(key: key);

  void _onRefresh(BuildContext context) {
    return BlocProvider.of<AssetBloc>(context).add(
      AssetLoad(
          currencyCode:
              BlocProvider.of<AppSettingsBloc>(context).state.currency,
          marketCoinId: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('SingleAssetView');

    // var marketCoin = (BlocProvider.of<AssetOverviewBloc>(context).state
    //         as AssetOverviewLoaded)
    //     .allAssets
    //     .firstWhere((element) => element.id == id);

    return BlocBuilder<AssetBloc, AssetState>(builder: (context, state) {
      if (state is AssetLoaded) {
        var singleAsset = state.singleAsset;
        return Scaffold(
          appBar: GeneralAppBar(
            platform: Theme.of(context).platform,
            leadingButtonType: kIsWeb && Theme.of(context).platform.isDesktop()
                ? null
                : LeadingButtonType.back,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'coin-icon-${singleAsset.name}',
                  child: AssetIconWeb(
                    singleAsset.image.small,
                    assetSymbol: singleAsset.symbol,
                    iconSize: Theme.of(context).platform.isMacOnly()
                        ? kIconSizeMacAppBar
                        : kIconSize,
                  ),
                ),
                const SizedBox(width: 8),
                Hero(
                  tag: 'coin-title-${singleAsset.name}',
                  child: AppBarTitle(singleAsset.name),
                ),
              ],
            ),
            actions: [
              BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
                builder: (context, state) {
                  if (state is AssetOverviewLoaded) {
                    var isFavourite = state.favouriteAssets
                        .where((element) => element.id == singleAsset.id)
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
                        AssetFavourited(
                            allMarketCoins: state.allAssets,
                            symbol: singleAsset.symbol,
                            name: singleAsset.name,
                            id: singleAsset.id,
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
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
                          Text(
                            'Price (24h)',
                            style: Theme.of(context).textTheme.headline6,
                          ),
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
                                          Text(singleAsset
                                                  .marketData.high24h.gbp
                                                  ?.currencyFormatWithPrefix(
                                                      BlocProvider.of<
                                                                  AppSettingsBloc>(
                                                              context)
                                                          .state
                                                          .currency
                                                          .currencyString,
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
                                          Text(singleAsset.marketData.low24h.gbp
                                                  ?.currencyFormatWithPrefix(
                                                      BlocProvider.of<
                                                                  AppSettingsBloc>(
                                                              context)
                                                          .state
                                                          .currency
                                                          .currencyString,
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
                                              singleAsset
                                                  .marketData.priceChange24h,
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
                                          DeltaWithArrow(
                                            singleAsset.marketData
                                                        .priceChangePercentage24h !=
                                                    null
                                                ? singleAsset.marketData
                                                    .priceChangePercentage24h!
                                                : null,
                                            isPercentage: true,
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
                                                  .format(singleAsset.marketData
                                                      .marketCap.gbp))
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
                                              .format(singleAsset.marketData
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
                                                  .caption),
                                          singleAsset.marketData.totalSupply !=
                                                  null
                                              ? Text(
                                                  compactNumberFormat(context)
                                                      .format(singleAsset
                                                          .marketData
                                                          .totalSupply))
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
                                          singleAsset.marketData.maxSupply !=
                                                  null
                                              ? Text(
                                                  compactNumberFormat(context)
                                                      .format(singleAsset
                                                          .marketData
                                                          .maxSupply))
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
                                                  .caption),
                                          Text(compactNumberFormat(context)
                                              .format(singleAsset
                                                  .marketData.totalVolume.gbp))
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
                                          Text(singleAsset.marketData.ath.gbp
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
                                          DeltaWithArrow(
                                            singleAsset
                                                        .marketData
                                                        .athChangePercentage
                                                        .gbp !=
                                                    null
                                                ? singleAsset.marketData
                                                    .athChangePercentage.gbp!
                                                : null,
                                            isPercentage: true,
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
                    state.singleAsset.sentimentVotesDownPercentage != null &&
                            state.singleAsset.sentimentVotesUpPercentage != null
                        ? _buildCard(
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
                                                .sentimentVotesDownPercentage! *
                                            100)
                                        .toInt(),
                                    child: Container(
                                      height: (kCornerRadiusCirlcular * 2) +
                                          kCornerRadiusCirlcular,
                                      decoration: BoxDecoration(
                                        color: false
                                            .toPositiveNegativeColorFromBool(
                                                context),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(
                                              kCornerRadiusCirlcular),
                                          bottomLeft: Radius.circular(
                                              kCornerRadiusCirlcular),
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
                                                .sentimentVotesUpPercentage! *
                                            100)
                                        .toInt(),
                                    child: Container(
                                      height: (kCornerRadiusCirlcular * 2) +
                                          kCornerRadiusCirlcular,
                                      decoration: BoxDecoration(
                                        color: true
                                            .toPositiveNegativeColorFromBool(
                                                context),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(
                                              kCornerRadiusCirlcular),
                                          bottomRight: Radius.circular(
                                              kCornerRadiusCirlcular),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          state.singleAsset
                                              .sentimentVotesUpPercentage
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
                            ))
                        : Container(),
                    state.singleAsset.sentimentVotesDownPercentage != null &&
                            state.singleAsset.sentimentVotesUpPercentage != null
                        ? const SizedBox(height: 8)
                        : Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: kMobileButtonButtonSize,
                          child: PrimaryButton(
                            onTap: () async {
                              BlocProvider.of<SingleAssetExchangeBloc>(context)
                                  .add(SingleAssetExchangeLoad(
                                      marketCoinId: singleAsset.id));
                              await context.router
                                  .push(const AssetExchangeRoute());
                            },
                            buttonText: 'View markets',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    state.singleAsset.description.en.isNotEmpty
                        ? _buildCard(
                            context,
                            false,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Description',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                const SizedBox(height: 8),
                                ScreenBuilder(
                                  mobile: _buildHtml(
                                      state.singleAsset.description.en),
                                  tablet: _buildHtml(
                                      state.singleAsset.description.en),
                                  desktop: _buildHtml(
                                      state.singleAsset.description.en),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        );
      } else if (state is AssetError) {
        debugPrint(state.error.toString());
        return ErrorView(
            onRefresh: () async => _onRefresh(context),
            error: state.error.toString());
      }
      return ScaffoldWithBack(
          body: Center(
        child: PlatformCircularProgressIndicator(),
      ));
    });
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
