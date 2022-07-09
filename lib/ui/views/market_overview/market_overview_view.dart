// 🐦 Flutter imports:

// � Package imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/extensions/sort_order.dart';
import 'package:yaca/core/models/api/market_coins.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/models/sort_type.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/common/errors/error_view.dart';
import 'package:yaca/ui/views/common/errors/timeout_view.dart';
import 'package:yaca/ui/views/market_overview/market_overview_view_loading.dart';
import 'package:yaca/ui/views/market_overview/widgets/assets_data_table.dart';
import 'package:yaca/ui/views/market_overview/widgets/sort_bottom_sheet.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';

// � Flutter imports:

class MarketOverviewView extends StatefulWidget {
  const MarketOverviewView({super.key});

  @override
  State<MarketOverviewView> createState() => _MarketOverviewViewState();
}

class _MarketOverviewViewState extends State<MarketOverviewView> {
  bool _showAllAssets = true;

  @override
  Widget build(BuildContext context) {
    final chosenCurrency =
        BlocProvider.of<AppSettingsBloc>(context).state.currency;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: GeneralAppBar(
          platform: Theme.of(context).platform,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                height: kIconSizeMacAppBar,
                color: Theme.of(context).iconTheme.color?.withOpacity(1),
              ),
              const SizedBox(width: 4),
              const AppBarTitle(kAppName)
            ],
          ),
          leadingButtonType: Theme.of(context).platform.onlyMobile(context)
              ? LeadingButtonType.settings
              : null,
          actions: [
            if (Theme.of(context).platform.isDesktop())
              IconButton(
                  icon: Icon(
                    Ionicons.sync_outline,
                    size: !Theme.of(context).platform.phoneOrTablet() ? 20 : 22,
                  ),
                  tooltip: 'Refresh',
                  onPressed: () => _onRefresh(context, chosenCurrency))
            else
              IconButton(
                icon: const Icon(Ionicons.search_outline),
                onPressed: () {
                  context.router.push(const SearchRoute());
                },
              )
          ],
          bottom: null //AppBarBottom(),
          ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraint.maxWidth),
            child: BlocBuilder<AssetOverviewBloc, AssetOverviewState>(
              builder: (context, state) {
                if (state is AssetOverviewLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChoiceChip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              tooltip: _showAllAssets
                                  ? 'Show favourites only'
                                  : 'Show all assets',
                              onSelected: (selected) {
                                setState(() {
                                  _showAllAssets = !selected;
                                });
                              },
                              selected: !_showAllAssets,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kCornerRadiusCirlcular)),
                              label: Icon(
                                _showAllAssets
                                    ? Ionicons.star_outline
                                    : Ionicons.star,
                                size: 16,
                                color: _showAllAssets
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant
                                    : kYellow,
                              ),
                            ),
                            ActionChip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              onPressed: () async {
                                await showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SafeArea(
                                          child: SortBottomSheet(
                                        assets: state.allAssets,
                                        sortType: state.sortType,
                                        sortOrder: state.sortOrder,
                                      ));
                                    });
                              },
                              avatar: Icon(
                                state.sortOrder.isAscending()
                                    ? Ionicons.arrow_up_outline
                                    : Ionicons.arrow_down_outline,
                                size: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                              labelPadding: const EdgeInsets.only(right: 8.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kCornerRadiusCirlcular)),
                              label: Text(
                                  _getLabelForCurrentSortType(state.sortType)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: AssetsDataTable(
                          favouriteOnly: !_showAllAssets,
                          marketCoins: _showAllAssets
                              ? state.allAssets
                              : state.favourites,
                          onRefresh: () async =>
                              _onRefresh(context, chosenCurrency),
                          onFavourite: (MarketCoin marketCoin,
                                  bool isChecked) =>
                              BlocProvider.of<AssetOverviewBloc>(context).add(
                            AssetFavourited(
                                allMarketCoins: state.allAssets,
                                favourites: state.favourites,
                                symbol: marketCoin.market.symbol,
                                name: marketCoin.market.name,
                                coinId: marketCoin.market.id,
                                addToFavourite: isChecked),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is AssetOverviewError) {
                  return ErrorView(
                      onRefresh: () => _onRefresh(context, chosenCurrency),
                      error: state.error);
                } else if (state is AssetOverviewTimeout) {
                  return TimeoutView(
                    onRefresh: () => _onRefresh(context, chosenCurrency),
                  );
                }
                return const MarketOverviewViewLoading();
              },
            ),
          );
        },
      ),
    );
  }

  void _onRefresh(BuildContext context, ChosenCurrency chosenCurrency) {
    BlocProvider.of<GlobalMarketBloc>(context)
        .add(GlobalMarketLoad(chosenCurrency));
    BlocProvider.of<AssetOverviewBloc>(context).add(const AssetOverviewLoad());
  }

  String _getLabelForCurrentSortType(SortType currentSortType) {
    switch (currentSortType) {
      case SortType.sortByRank:
        return 'Rank';
      case SortType.sortBy24hPercentageChange:
        return '24h % change';
    }
  }
}
