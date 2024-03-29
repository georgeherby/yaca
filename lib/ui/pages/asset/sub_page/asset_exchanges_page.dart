// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/singleasset_exchange/singleasset_exchange_bloc.dart';
import 'package:yaca/ui/views/asset/widgets/exchange_list_with_filter.dart';
import 'package:yaca/ui/views/common/errors/error_view.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';
import 'package:yaca/ui/views/widgets/surface.dart';

class AssetExchangePage extends StatelessWidget {
  const AssetExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
        title: 'Exchanges',
        body: BlocBuilder<SingleAssetExchangeBloc, SingleAssetExchangeState>(
          builder: (context, state) {
            if (state is SingleAssetExchangeLoaded) {
              return MaterialSurface(
                externalPadding: getValueForScreenType<EdgeInsets>(
                  context: context,
                  mobile: const EdgeInsets.symmetric(horizontal: 8.0),
                  tablet:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  desktop:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                ),
                child: ExchangeListWithFilter(exchanges: state.exchangeTickers),
              );
            } else if (state is SingleAssetExchangeError) {
              debugPrint(state.error.toString());
              return ErrorView(error: state.error);
            } else {
              debugPrint('Loading');
              return Center(
                child: PlatformCircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
