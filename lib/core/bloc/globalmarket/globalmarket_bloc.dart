// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/global_market.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/repositories/api/coingecko/global_market_repository.dart';

part 'globalmarket_event.dart';
part 'globalmarket_state.dart';

class GlobalMarketBloc extends Bloc<GlobalMarketEvent, GlobalMarketState> {
  final GlobalMarketRespository repository;
  GlobalMarketBloc(this.repository) : super(const GlobalMarketInitial()) {
    on<GlobalMarketLoad>(_onGlobalMarketLoad);
  }

  @override
  void onTransition(
      Transition<GlobalMarketEvent, GlobalMarketState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  void _onGlobalMarketLoad(
      GlobalMarketLoad event, Emitter<GlobalMarketState> emit) async {
    try {
      emit(const GlobalMarketLoading());
      var market = await repository.fetchMarketOverview(event.currency);
      emit(GlobalMarketLoaded(market));
    } catch (e) {
      emit(GlobalMarketError(e.toString()));
    }
  }
}
