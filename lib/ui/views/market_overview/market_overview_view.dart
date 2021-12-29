// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/extensions/sort_order.dart';
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/core/models/sort_type.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/market_overview/market_overview_view_error.dart';
import 'package:yaca/ui/views/market_overview/market_overview_view_loading.dart';
import 'package:yaca/ui/views/market_overview/widgets/app_bar_bottom.dart';
import 'package:yaca/ui/views/market_overview/widgets/assets_data_table.dart';
import 'package:yaca/ui/views/market_overview/widgets/sort_bottom_sheet.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';

class MarketOverviewView extends StatefulWidget {
  const MarketOverviewView({Key? key}) : super(key: key);

  @override
  _MarketOverviewViewState createState() => _MarketOverviewViewState();
}

class _MarketOverviewViewState extends State<MarketOverviewView> {
  bool _showAllAssets = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          (Theme.of(context).platform.isDesktop())
              ? IconButton(
                  icon: Icon(
                    Ionicons.sync_outline,
                    size: !Theme.of(context).platform.phoneOrTablet() ? 20 : 22,
                  ),
                  tooltip: 'Refresh',
                  onPressed: () {
                    BlocProvider.of<GlobalMarketBloc>(context).add(
                        GlobalMarketLoad(
                            BlocProvider.of<AppSettingsBloc>(context)
                                .state
                                .currency));
                    BlocProvider.of<AssetOverviewBloc>(context).add(
                        AssetOverviewLoad(
                            BlocProvider.of<AppSettingsBloc>(context)
                                .state
                                .currency));
                    return;
                  })
              : SizedBox(
                  width: !Theme.of(context).platform.phoneOrTablet() ? 20 : 22)
        ],
        bottom: AppBarBottom(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: LayoutBuilder(
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ChoiceChip(
                                tooltip: _showAllAssets
                                    ? "Show favourites only"
                                    : "Show all assets",
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onSelected: (selected) {
                                  setState(() {
                                    _showAllAssets = !selected;
                                  });
                                },
                                selected: !_showAllAssets,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        kCornerRadiusCirlcular)),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8),
                                  child: Icon(
                                      _showAllAssets
                                          ? Ionicons.star_outline
                                          : Ionicons.star,
                                      size: 16,
                                      color: _showAllAssets
                                          ? Theme.of(context).iconTheme.color
                                          : kYellow),
                                ),
                              ),
                              ActionChip(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
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
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                labelPadding: const EdgeInsets.all(4.0),
                                padding: const EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        kCornerRadiusCirlcular)),
                                label: Text(_getLabelForCurrentSortType(
                                    state.sortType)),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: AssetsDataTable(
                            favouriteOnly: !_showAllAssets,
                            marketCoins: _showAllAssets
                                ? state.allAssets
                                : state.favouriteAssets,
                            onRefresh: () async {
                              BlocProvider.of<GlobalMarketBloc>(context).add(
                                  GlobalMarketLoad(
                                      BlocProvider.of<AppSettingsBloc>(context)
                                          .state
                                          .currency));
                              BlocProvider.of<AssetOverviewBloc>(context).add(
                                  AssetOverviewLoad(
                                      BlocProvider.of<AppSettingsBloc>(context)
                                          .state
                                          .currency));
                              return;
                            },
                            onFavourite: (MarketCoin marketCoin,
                                    bool isChecked) =>
                                BlocProvider.of<AssetOverviewBloc>(context).add(
                              AssetFavourited(
                                  state.allAssets, marketCoin, isChecked),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is AssetOverviewError) {
                    return MarketOverviewViewError(state.error);
                  }
                  return const MarketOverviewViewLoading();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  String _getLabelForCurrentSortType(SortType currentSortType) {
    switch (currentSortType) {
      case SortType.sortByRank:
        return "Rank";
      case SortType.sortBy24hPercentageChange:
        return "24h % change";
    }
  }
}
