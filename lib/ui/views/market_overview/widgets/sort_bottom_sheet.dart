// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/extensions/sort_order.dart';
import 'package:yaca/core/models/api/coingecko/market_coins.dart';
import 'package:yaca/core/models/sort_type.dart';

class SortBottomSheet extends StatelessWidget {
  final SortType sortType;
  final SortOrder sortOrder;
  final List<MarketCoin> assets;

  const SortBottomSheet(
      {Key? key,
      required this.assets,
      required this.sortType,
      required this.sortOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          dense: true,
          tileColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Sort By',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          trailing: _trailingWidget(SortType.sortByRank, sortType, sortOrder),
          title: Text(
            'Rank',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: sortType == SortType.sortByRank
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
          onTap: () {
            BlocProvider.of<AssetOverviewBloc>(context).add(AssetSorted(
              assets,
              SortType.sortByRank,
              sortOrder.inverse(),
            ));

            Navigator.pop(context);
          },
        ),
        ListTile(
          trailing: _trailingWidget(
              SortType.sortBy24hPercentageChange, sortType, sortOrder),
          title: Text(
            '% Change',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: sortType == SortType.sortBy24hPercentageChange
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
          onTap: () {
            BlocProvider.of<AssetOverviewBloc>(context).add(AssetSorted(
              assets,
              SortType.sortBy24hPercentageChange,
              sortOrder.inverse(),
            ));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget? _trailingWidget(SortType sortToMatch, SortType currentSortType,
      SortOrder currentSortOrder) {
    return currentSortType == sortToMatch
        ? Icon(currentSortOrder.isAscending()
            ? Ionicons.arrow_up_outline
            : Ionicons.arrow_down_outline)
        : null;
  }
}
