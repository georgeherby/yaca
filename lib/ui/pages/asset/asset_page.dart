// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaca/core/bloc/application_settings/application_settings_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/bloc/asset/asset_bloc.dart';
import 'package:yaca/core/repositories/api/coingecko/single_asset_repository.dart';

class AssetPage extends StatelessWidget {
  AssetPage({
    super.key,
    @PathParam('assetId') required this.id,
  });
  final CoinGeckoApi _api = CoinGeckoApi();
  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AssetBloc(singleAssetRepository: AssetRepository(_api))
            ..add(AssetLoad(
                currencyCode: BlocProvider.of<ApplicationSettingsBloc>(context)
                    .state
                    .currency,
                marketCoinId: id)),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
