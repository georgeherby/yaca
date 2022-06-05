// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 🌎 Project imports:
import 'package:yaca/app_router.dart';
import 'package:yaca/core/bloc/trending/trending_bloc.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/ranking_card.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});
  static const kTrendingTileWidth = 100.0;
  static const kTrendingTileHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/flame.svg",
                width: 12,
                height: 12,
                color: kNegativeRedDark,
              ),
              const SizedBox(width: 4),
              Text('TRENDING SEARCHES',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
        ),
        SizedBox(
          height: kTrendingTileHeight,
          child: BlocBuilder<TrendingBloc, TrendingState>(
            builder: (context, state) {
              if (state is TrendingLoaded) {
                return ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    const SizedBox(width: 4),
                    ...List.generate(state.trending.length, (index) {
                      var asset = state.trending[index];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: kTrendingTileWidth,
                            height: kTrendingTileHeight,
                            child: GestureDetector(
                              onTap: () => context.router.push(
                                AssetRoute(
                                  id: asset.id,
                                ),
                              ),
                              child: ElevatedCard(
                                // contentPadding:
                                //     const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AssetIconWeb(asset.small,
                                        assetSymbol: asset.symbol.toUpperCase(),
                                        iconSize: kIconSize),
                                    const SizedBox(height: 8),
                                    Text(
                                      asset.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RankingCard(
                                            ranking: asset.marketCapRank),
                                        const SizedBox(width: 4),
                                        Text(asset.symbol,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(width: 4),
                  ],
                );
              } else if (state is TrendingError) {
                return Text(state.error);
              }
              return Center(child: PlatformCircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
