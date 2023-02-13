// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';
import 'package:yaca/core/bloc/global_market/global_market_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/ui/constants/constants.dart';
import 'package:yaca/ui/views/market_overview/widgets/global_market_marque.dart';
import 'package:yaca/ui/views/market_overview/widgets/shimmer_app_bar_data_block.dart';

class AppBarBottom extends StatelessWidget with PreferredSizeWidget {
  AppBarBottom({super.key, this.isAppBar = false});

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
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(
                  Radius.circular(kCornerRadiusCircular)),
            ),
            child: BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
              builder: (context, state) {
                if (state is GlobalMarketLoaded) {
                  return GlobalMarketMarque(
                    currencyString:
                        BlocProvider.of<ApplicationSettingsBloc>(context)
                            .state
                            .currency
                            .currencyString,
                    marketCap: state.globalMarket.totalMarketCap,
                    marketCap24hPercentageChange:
                        state.globalMarket.marketCapChangePercentage24hUsd,
                    marketCapPercentage: state.globalMarket.marketCapPercentage,
                    totalVolume: state.globalMarket.totalVolume,
                  );
                }

                if (state is GlobalMarketError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(Icons.error_outline_rounded),
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
