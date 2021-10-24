// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/global_market_marque.dart';
import 'package:crypto_app/ui/views/market_overview/widgets/shimmer_app_bar_data_block.dart';

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
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
              builder: (context, state) {
                if (state is GlobalMarketLoaded) {
                  return GlobalMarketMarque(
                    currencySymbol: BlocProvider.of<AppSettingsBloc>(context)
                        .state
                        .currency
                        .currencySymbol,
                    marketCap: state.globalMarket.data.totalMarketCap,
                    marketCap24hChange:
                        state.globalMarket.data.marketCapChangePercentage24hUsd,
                    marketCapPercentage:
                        state.globalMarket.data.marketCapPercentage,
                    totalVolume: state.globalMarket.data.totalVolume,
                  );
                }

                if (state is GlobalMarketError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(CupertinoIcons.exclamationmark),
                      Text(state.error)
                    ],
                  );
                }
                return ShimmerAppBarDataBlock();
              },
            )),
      ),
    );
  }
}
