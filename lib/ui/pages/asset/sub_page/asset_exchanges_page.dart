// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:yaca/core/bloc/single_asset_exchange/single_asset_exchange_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/ui/views/single_asset/widgets/exchange_list_with_filter.dart';
import 'package:yaca/ui/views/common/errors/error_view.dart';
import 'package:yaca/ui/views/widgets/scaffold_with_back.dart';
import 'package:yaca/ui/views/widgets/elevated_card.dart';

class AssetExchangePage extends StatelessWidget {
  const AssetExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
        title: 'Exchanges',
        body: BlocBuilder<SingleAssetExchangeBloc, SingleAssetExchangeState>(
          builder: (context, state) {
            if (state is SingleAssetExchangeLoaded) {
              return ElevatedCard(
                // externalPadding: getValueForScreenType<EdgeInsets>(
                //   context: context,
                //   mobile: const EdgeInsets.all(8.0),
                //   tablet: const EdgeInsets.all(8.0),
                //   desktop: const EdgeInsets.all(8.0),
                // ),
                contentPadding: const EdgeInsets.all(8.0),
                child: ExchangeListWithFilter(exchanges: state.exchangeTickers),
              );
            } else if (state is SingleAssetExchangeError) {
              debugPrint(state.error);
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
