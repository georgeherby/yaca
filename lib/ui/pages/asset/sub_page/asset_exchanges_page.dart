// 🐦 Flutter imports:
import 'package:crypto_app/ui/views/asset/widgets/exchange_list_with_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:crypto_app/ui/views/widgets/scaffold_with_back.dart';

class AssetExchangePage extends StatelessWidget {
  const AssetExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
        title: 'Exchanges',
        body: BlocBuilder<SingleAssetExchangeBloc, SingleAssetExchangeState>(
          builder: (context, state) {
            if (state is SingleAssetExchangeLoaded) {
              return Padding(
                padding: getValueForScreenType<EdgeInsets>(
                  context: context,
                  mobile: const EdgeInsets.symmetric(horizontal: 8.0),
                  tablet:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  desktop:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                ),
                child: Material(
                  borderRadius: getValueForScreenType<BorderRadius>(
                      context: context,
                      mobile: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      tablet: BorderRadius.circular(10),
                      desktop: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: Theme.of(context).cardTheme.elevation!,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: ExchangeListWithFilter(
                          exchanges: state.exchangeTickers)),
                ),
              );
            } else if (state is SingleAssetExchangeError) {
              debugPrint(state.error.toString());
              return Center(
                child: Column(
                  children: [
                    Icon(CupertinoIcons.exclamationmark),
                    Text(state.error)
                  ],
                ),
              );
            } else {
              debugPrint('Loading');
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ));
  }
}
