// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/global_market.dart';
import 'package:crypto_app/core/models/settings/chosen_currency.dart';
import 'package:crypto_app/core/repositories/api/coingecko/global_market_repository.dart';

part 'globalmarket_event.dart';
part 'globalmarket_state.dart';

class GlobalMarketBloc extends Bloc<GlobalMarketEvent, GlobalMarketState> {
  final GlobalMarketRespository repository;
  GlobalMarketBloc(this.repository) : super(GlobalMarketInitial()) {
    on<GlobalMarketLoad>(_onGlobalMarketLoad);
  }

  void _onGlobalMarketLoad(
      GlobalMarketLoad event, Emitter<GlobalMarketState> emit) async {
    try {
      emit(GlobalMarketLoading());
      var market = await repository.fetchMarketOverview(event.currency);
      emit(GlobalMarketLoaded(market));
    } catch (e) {
      emit(GlobalMarketError(e.toString()));
    }
  }
}
