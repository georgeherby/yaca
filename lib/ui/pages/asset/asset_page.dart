// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset/asset_bloc.dart';
import 'package:yaca/core/repositories/api/coingecko/single_asset_repository.dart';

class AssetPage extends StatelessWidget {
  final CoinGeckoApi _api = CoinGeckoApi();
  final String id;

  AssetPage({
    Key? key,
    @PathParam('assetId') required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AssetBloc(singleAssetRespository: AssetRespository(_api))
                ..add(AssetLoad(
                    currencyCode: BlocProvider.of<AppSettingsBloc>(context)
                        .state
                        .currency,
                    marketCoinId: id)),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
