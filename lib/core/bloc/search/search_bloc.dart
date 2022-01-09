// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/simple_asset.dart';
import 'package:yaca/core/repositories/api/coingecko/coin_list_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchBaseEvent, SearchState> {
  late List<SimpleAsset> _listOfAllAssetForSearch;
  final CoinListReposiotry coinListReposiotry;

  SearchBloc(this.coinListReposiotry) : super(const SearchInitial()) {
    on<GetAssetListEvent>(_onGetAssetListEvent);
    on<SearchEvent>(_onSearchEvent);
  }

  @override
  void onTransition(Transition<SearchBaseEvent, SearchState> transition) {
    debugPrint("SearchBloc :: " + transition.toString());
    super.onTransition(transition);
  }

  void _onGetAssetListEvent(
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

  void _onSearchEvent(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query == null) {
      emit(SearchLoaded(_listOfAllAssetForSearch));
    } else {
      String query = event.query!.toLowerCase();
      emit(SearchLoaded(_listOfAllAssetForSearch
          .where((element) =>
              element.name.toLowerCase().contains(query) ||
              element.symbol.toLowerCase().contains(query))
          .toList()));
    }
  }
}
