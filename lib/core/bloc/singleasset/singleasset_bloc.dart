// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/core/models/api/coingecko/exchange_ticker.dart';
import 'package:crypto_app/core/repositories/api/coingecko/exchange_ticker_repository.dart';
import 'package:crypto_app/core/repositories/api/coingecko/single_asset_repository.dart';

part 'singleasset_event.dart';
part 'singleasset_state.dart';

class SingleAssetBloc extends Bloc<SingleAssetEvent, SingleAssetState> {
  final ExchangeTickerRespository exchangeTickerRespository;
  final SingleAssetRespository singleAssetRespository;

  SingleAssetBloc(
      {required this.exchangeTickerRespository,
      required this.singleAssetRespository})
      : super(SingleAssetInitial());

  @override
  Stream<SingleAssetState> mapEventToState(
    SingleAssetEvent event,
  ) async* {
    if (event is SingleAssetLoad) {
      yield SingleAssetLoading();

      try {
        var exchExchangeTicker = await exchangeTickerRespository
            .getAllExchangeTickers(event.marketCoinId);
        var assetHistorySplits = await singleAssetRespository
            .fetchFullAssetHistory(event.marketCoinId, event.currencyCode);

        yield SingleAssetLoaded(assetHistorySplits, exchExchangeTicker);
      } catch (e) {
        yield SingleAssetError(e.toString());
      }
    }
  }
}
