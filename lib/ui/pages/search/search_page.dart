// 🐦 Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/search/bloc/search_bloc.dart';
import 'package:yaca/core/models/api/coingecko/simple_asset.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: Icon(Ionicons.chevron_back_outline,
              size: Theme.of(context).appBarTheme.actionsIconTheme?.size),
        ),
        title: TextFormField(
          controller: _textController,
          onChanged: (value) {
            var results = <SimpleAsset>[];
            if (context.read<SearchBloc>().state is SearchLoaded) {
              results = (context.read<SearchBloc>().state as SearchLoaded)
                  .searchResults;
            }

            context
                .read<SearchBloc>()
                .add(SearchEvent(query: value, assetList: results));
          },
          decoration: InputDecoration(
            hintText: 'Search',
            iconColor: Theme.of(context).appBarTheme.actionsIconTheme?.color,
            suffixIcon: IconButton(
              onPressed: () {
                //TODO Reset to show whole list or if you change after search
                _textController.clear();
              },
              icon: Icon(Ionicons.close_outline,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                  size: Theme.of(context).appBarTheme.actionsIconTheme?.size),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoaded) {
            return ListView.builder(
                itemCount: state.searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.searchResults[index].name),
                    trailing: Text(state.searchResults[index].symbol),
                    onTap: () => context.router.push(
                      AssetRoute(
                        id: state.searchResults[index].id,
                      ),
                    ),
                  );
                });
          }

          return Scaffold(
            body: Center(
              child: PlatformCircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
