// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/exchange_ticker.dart';
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

  void _onSingleAssetExchangeLoad(
    SingleAssetExchangeLoad event,
    Emitter<SingleAssetExchangeState> emit,
  ) async {
    emit(const SingleAssetExchangeLoading());

    try {
      var exchExchangeTicker = await exchangeTickerRespository
          .getAllExchangeTickers(event.marketCoinId);

      emit(SingleAssetExchangeLoaded(exchExchangeTicker));
    } on Exception catch (e) {
      emit(SingleAssetExchangeError(e.toString()));
    }
  }
}
