// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:crypto_app/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:crypto_app/core/bloc/singleasset/singleasset_bloc.dart';
import 'package:crypto_app/core/models/api/coingecko/market_coins.dart';
import 'package:crypto_app/core/repositories/api/coingecko/single_asset_repository.dart';
import 'package:crypto_app/ui/views/single_asset/single_asset_view.dart';

class SingleAssetPage extends StatelessWidget {
  final http.Client _client = http.Client();
  final MarketCoin marketCoin;
  final Function(String, bool) onFavourite;

  SingleAssetPage({
    Key? key,
    required this.marketCoin,
    required this.onFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SingleAssetBloc(
              // exchangeTickerRespository: ExchangeTickerRespository(_client),
              singleAssetRespository: SingleAssetRespository(_client))
            ..add(SingleAssetLoad(
                currencyCode: BlocProvider.of<AppSettingsBloc>(context)
                    .state
                    .currency
                    .currencyCode,
                marketCoinId: marketCoin.id)),
        ),
      ],
      child: SingleAssetView(
        marketCoin: marketCoin,
        onFavourite: onFavourite,
      ),
    );
  }
}
