// 🐦 Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/bloc/asset/asset_bloc.dart';
import 'package:crypto_app/ui/views/asset/asset_view.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/core/repositories/api/coingecko/single_asset_repository.dart';

class AssetPage extends StatelessWidget {
  final http.Client _client = http.Client();
  final String? id;
  final MarketCoin marketCoin;
  final Function(String, bool) onFavourite;

  AssetPage({
    Key? key,
    @PathParam('assetId') this.id,
    required this.marketCoin,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AssetBloc(
              singleAssetRespository: AssetRespository(_client))
            ..add(AssetLoad(
                currencyCode:
                    BlocProvider.of<AppSettingsBloc>(context).state.currency,
                marketCoinId: marketCoin.id)),
        ),
      ],
      child: AssetView(
        marketCoin: marketCoin,
        onFavourite: onFavourite,
      ),
    );
  }
}
