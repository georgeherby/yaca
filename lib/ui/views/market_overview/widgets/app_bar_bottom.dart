// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/ui/consts/constants.dart';
import 'package:yaca/ui/views/market_overview/widgets/global_market_marque.dart';
import 'package:yaca/ui/views/market_overview/widgets/shimmer_app_bar_data_block.dart';

class AppBarBottom extends StatelessWidget with PreferredSizeWidget {
  AppBarBottom({Key? key, this.isAppBar = false}) : super(key: key);

  final bool isAppBar;
  final padding = 8.0;
  @override
  Size get preferredSize =>
      Size.fromHeight(isAppBar ? kToolbarHeight : kMarqueTapHeight);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isAppBar ? kMarqueTapHeight + 8 : kMarqueTapHeight,
      width: double.infinity,
      child: Padding(
        padding: isAppBar
            ? EdgeInsets.only(left: padding, right: padding, top: padding)
            : EdgeInsets.symmetric(horizontal: padding),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                  Radius.circular(kCornerRadiusCirlcular)),
            ),
            child: BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
              builder: (context, state) {
                if (state is GlobalMarketLoaded) {
                  return GlobalMarketMarque(
                    currencyString: BlocProvider.of<AppSettingsBloc>(context)
                        .state
                        .currency
                        .currencyString,
                    marketCap: state.globalMarket.totalMarketCap,
                    marketCap24hPercentageChange:
                        state.globalMarket.marketCapChangePercentage24hUsd,
                    marketCapPercentage:
                        state.globalMarket.marketCapPercentage,
                    totalVolume: state.globalMarket.totalVolume,
                  );
                }

                if (state is GlobalMarketError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(Ionicons.alert_circle_outline),
                      Text(state.error)
                    ],
                  );
                }
                return const ShimmerAppBarDataBlock();
              },
            )),
      ),
    );
  }
}
