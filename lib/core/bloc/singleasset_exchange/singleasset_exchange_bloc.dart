// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/exchange_ticker.dart';
import 'package:crypto_app/core/repositories/api/coingecko/exchange_ticker_repository.dart';

part 'singleasset_exchange_event.dart';
part 'singleasset_exchange_state.dart';

class SingleAssetExchangeBloc
    extends Bloc<SingleAssetExchangeEvent, SingleAssetExchangeState> {
  final ExchangeTickerRespository exchangeTickerRespository;

  SingleAssetExchangeBloc({required this.exchangeTickerRespository})
      : super(SingleAssetExchangeInitial());

  @override
  Stream<SingleAssetExchangeState> mapEventToState(
    SingleAssetExchangeEvent event,
  ) async* {
    if (event is SingleAssetExchangeLoad) {
      yield SingleAssetExchangeLoading();

      try {
        var exchExchangeTicker = await exchangeTickerRespository
            .getAllExchangeTickers(event.marketCoinId);

        yield SingleAssetExchangeLoaded(exchExchangeTicker);
      } on Exception catch (e) {
        yield SingleAssetExchangeError(e.toString());
      }
    }
  }
}
