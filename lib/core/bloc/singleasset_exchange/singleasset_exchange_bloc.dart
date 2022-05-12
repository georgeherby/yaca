// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/repositories/api/coingecko/exchange_ticker_repository.dart';

part 'singleasset_exchange_event.dart';
part 'singleasset_exchange_state.dart';

class SingleAssetExchangeBloc
    extends Bloc<SingleAssetExchangeEvent, SingleAssetExchangeState> {
  final ExchangeTickerRespository exchangeTickerRespository;

  SingleAssetExchangeBloc({required this.exchangeTickerRespository})
      : super(SingleAssetExchangeInitial()) {
    on<SingleAssetExchangeLoad>(_onSingleAssetExchangeLoad);
  }
  @override
  void onTransition(
      Transition<SingleAssetExchangeEvent, SingleAssetExchangeState>
          transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  void _onSingleAssetExchangeLoad(
    SingleAssetExchangeLoad event,
    Emitter<SingleAssetExchangeState> emit,
  ) async {
    emit(const SingleAssetExchangeLoading());

    try {
      var exchangeTickers = await exchangeTickerRespository
          .getExchangeTickerForCoin(event.marketCoinId);

      emit(SingleAssetExchangeLoaded(exchangeTickers));
    } on Exception catch (e) {
      emit(SingleAssetExchangeError(e.toString()));
    }
  }
}
