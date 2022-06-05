// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/global_coin_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/repositories/api/coingecko/global_market_repository.dart';

part 'globalmarket_event.dart';
part 'globalmarket_state.dart';

class GlobalMarketBloc extends Bloc<GlobalMarketEvent, GlobalMarketState> {
  GlobalMarketBloc(this.repository) : super(const GlobalMarketInitial()) {
    on<GlobalMarketLoad>(_onGlobalMarketLoad);
  }
  final GlobalMarketRespository repository;

  @override
  void onTransition(
      Transition<GlobalMarketEvent, GlobalMarketState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  Future<void> _onGlobalMarketLoad(
      GlobalMarketLoad event, Emitter<GlobalMarketState> emit) async {
    try {
      emit(const GlobalMarketLoading());
      final market = await repository.fetchMarketOverview(event.currency);
      emit(GlobalMarketLoaded(market));
    } catch (e) {
      emit(GlobalMarketError(e.toString()));
    }
  }
}
