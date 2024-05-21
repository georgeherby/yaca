// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:coingecko_api/data/coin_short.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/repositories/api/coingecko/coin_list_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchBaseEvent, SearchState> {
  SearchBloc(this.coinListReposiotry) : super(const SearchInitial()) {
    on<GetAssetListEvent>(_onGetAssetListEvent);
    on<SearchEvent>(_onSearchEvent);
  }
  late List<CoinShort> _listOfAllAssetForSearch;
  final CoinListRepository coinListReposiotry;

  @override
  void onTransition(Transition<SearchBaseEvent, SearchState> transition) {
    debugPrint('SearchBloc :: $transition');
    super.onTransition(transition);
  }

  Future<void> _onGetAssetListEvent(
    GetAssetListEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(const SearchLoading());
      _listOfAllAssetForSearch = await coinListReposiotry.getCoinList();
      emit(SearchLoaded(_listOfAllAssetForSearch));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> _onSearchEvent(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query == null) {
      emit(SearchLoaded(_listOfAllAssetForSearch));
    } else {
      final String query = event.query!.toLowerCase();
      emit(SearchLoaded(_listOfAllAssetForSearch
          .where((element) =>
              element.name.toLowerCase().contains(query) ||
              element.symbol.toLowerCase().contains(query))
          .toList()));
    }
  }
}
