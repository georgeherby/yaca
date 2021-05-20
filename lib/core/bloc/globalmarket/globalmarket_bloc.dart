import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/old/api/coingecko/global_market_repository.dart';
import 'package:crypto_app/old/models/api/coingecko/global_market.dart';
import 'package:equatable/equatable.dart';

part 'globalmarket_event.dart';
part 'globalmarket_state.dart';

class GlobalMarketBloc extends Bloc<GlobalMarketEvent, GlobalMarketState> {
  final GlobalMarketRespository repository;
  GlobalMarketBloc(this.repository) : super(GlobalMarketInitial());

  @override
  Stream<GlobalMarketState> mapEventToState(
    GlobalMarketEvent event,
  ) async* {
    if (event is GlobalMarketLoad) {
      try {
        yield GlobalMarketLoading();
        var market = await repository.fetchMarketOverview();
        yield GlobalMarketLoaded(market);
      } catch (e) {
        yield GlobalMarketError(e.toString());
      }
    }
  }
}
