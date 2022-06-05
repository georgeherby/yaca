// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/search/search_bloc.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/common/errors/error_view.dart';
import 'package:yaca/ui/views/search/trending_view.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  void _resetSearch(BuildContext context, TextEditingController controller) {
    context.read<SearchBloc>().add(const SearchEvent(query: null));
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    _resetSearch(context, textController);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: Icon(Ionicons.chevron_back_outline,
              size: Theme.of(context).appBarTheme.actionsIconTheme?.size),
        ),
        title: TextFormField(
          autofocus: true,
          controller: textController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<SearchBloc>().add(SearchEvent(query: value));
            }
          },
          decoration: InputDecoration(
            hintText: 'Search',
            iconColor: Theme.of(context).appBarTheme.actionsIconTheme?.color,
            suffixIcon: IconButton(
              onPressed: () {
                _resetSearch(context, textController);
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TrendingView(),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedCard(
                      // externalPadding: getValueForScreenType<EdgeInsets>(
                      //   context: context,
                      //   mobile: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   tablet: const EdgeInsets.only(
                      //       left: 8.0, right: 8.0, bottom: 8.0),
                      //   desktop: const EdgeInsets.only(
                      //       left: 8.0, right: 8.0, bottom: 8.0),
                      // ),
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              indent: 8,
                              endIndent: 8,
                              height: kDividerWeighting,
                              thickness: kDividerWeighting,
                            );
                          },
                          itemCount: state.filteredList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(state.filteredList[index].name),
                              trailing: ConstrainedBox(
                                  constraints: BoxConstraints.loose(
                                      const Size.fromWidth(kIconSize * 2.5)),
                                  child: Text(
                                      state.filteredList[index].symbol
                                          .toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.fontSize))),
                              onTap: () => context.router.push(
                                AssetRoute(
                                  id: state.filteredList[index].id,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is SearchError) {
            debugPrint(state.error);
            return ErrorView(error: state.error);
          }

          return Center(child: PlatformCircularProgressIndicator());
        },
      ),
    );
  }
}
