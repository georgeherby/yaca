// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/extensions/sort_order.dart';
import 'package:yaca/core/models/api/market_coins.dart';
import 'package:yaca/core/models/sort_type.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet(
      {super.key,
      required this.assets,
      required this.sortType,
      required this.sortOrder});
  final SortType sortType;
  final SortOrder sortOrder;
  final List<MarketCoin> assets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          leading: Container(),
          leadingWidth: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
          centerTitle: false,
          title: Text(
            'Sort By',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          selected: sortType == SortType.sortByRank,
          trailing: _trailingWidget(SortType.sortByRank, sortType, sortOrder),
          title: const Text('Rank'),
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
          selected: sortType == SortType.sortBy24hPercentageChange,
          trailing: _trailingWidget(
              SortType.sortBy24hPercentageChange, sortType, sortOrder),
          title: const Text('24h % change'),
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
            ? Icons.arrow_upward_rounded
            : Icons.arrow_downward_rounded)
        : null;
  }
}
