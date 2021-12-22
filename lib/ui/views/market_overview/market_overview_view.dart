// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/market_overview/widgets/app_bar_bottom.dart';
import 'package:yaca/ui/views/market_overview/widgets/assets_data_table.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';
import 'package:yaca/ui/views/widgets/refresh_list.dart';

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
      appBar: _appBar(),
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
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                _showAllAssets = !_showAllAssets;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.padded,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              primary: Theme.of(context).primaryColor,
                              backgroundColor: _showAllAssets
                                  ? Theme.of(context).chipTheme.backgroundColor
                                  : Theme.of(context).chipTheme.selectedColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(kCornerRadiusCirlcular),
                                ),
                              ),
                            ),
                            icon: FaIcon(
                                _showAllAssets
                                    ? FontAwesomeIcons.star
                                    : FontAwesomeIcons.solidStar,
                                size: 16,
                                color: _showAllAssets
                                    ? Theme.of(context)
                                        .iconTheme
                                        .color
                                        ?.withOpacity(0.5)
                                    : kYellow),
                            label: Text(
                              'Favourites',
                              style: _showAllAssets
                                  ? Theme.of(context).textTheme.bodyText2
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          color: !_showAllAssets &&
                                                  Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                              ? Colors.white
                                              : !_showAllAssets
                                                  ? Colors.black
                                                  : Theme.of(context)
                                                      .chipTheme
                                                      .labelStyle
                                                      .color),
                            ),
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
                    return LayoutBuilder(builder: (context, constraint) {
                      return ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: RefreshableList(
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
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(CupertinoIcons
                                        .exclamationmark_triangle),
                                    Text(state.error)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  }
                  return LayoutBuilder(builder: (context, constraint) {
                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PlatformCircularProgressIndicator(),
                        ],
                      ),
                    );
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return GeneralAppBar(
      platform: Theme.of(context).platform,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            height: kIconSizeMacAppBar,
            color: Theme.of(context).iconTheme.color?.withOpacity(1),
          ),
          const SizedBox(width: 4),
          const AppBarTitle('yaca.')
        ],
      ),
      leadingButtonType: Theme.of(context).platform.onlyMobile(context)
          ? LeadingButtonType.settings
          : null,
      actions: [
        (Theme.of(context).platform.isDesktop())
            ? IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.syncAlt,
                  size: !Theme.of(context).platform.phoneOrTablet() ? 20 : 22,
                ),
                tooltip: 'Refresh',
                onPressed: () {
                  BlocProvider.of<GlobalMarketBloc>(context).add(
                      GlobalMarketLoad(BlocProvider.of<AppSettingsBloc>(context)
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
    );
  }
}
