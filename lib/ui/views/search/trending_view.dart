import 'package:auto_route/auto_route.dart';
import 'package:yaca/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaca/core/bloc/trending/trending_bloc.dart';
import 'package:yaca/ui/consts/colours.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/widgets/asset_icon_web.dart';
import 'package:yaca/ui/views/widgets/surface.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({Key? key}) : super(key: key);
  static const kTrendingTileWidth = 100.0;
  static const kTrendingTileHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/flame.svg",
                width: Theme.of(context).textTheme.bodyText1?.fontSize,
                height: Theme.of(context).textTheme.bodyText1?.fontSize,
                color: kNegativeRedDark,
              ),
              const SizedBox(width: 4),
              Text("Trending searches",
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: kTrendingTileHeight,
          child: BlocBuilder<TrendingBloc, TrendingState>(
            builder: (context, state) {
              if (state is TrendingLoaded) {
                return ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    const SizedBox(width: 8.0),
                    ...List.generate(state.trending.length, (index) {
                      var asset = state.trending[index].asset;
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
                              child: MaterialSurface(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 4),
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
                                        Text(asset.symbol,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                        const SizedBox(width: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius: const BorderRadius
                                                    .all(
                                                Radius.circular(
                                                    kCornerRadiusCirlcular)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0, horizontal: 6),
                                            child: Text(
                                                asset.marketCapRank.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                        ],
                      );
                    }),
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
