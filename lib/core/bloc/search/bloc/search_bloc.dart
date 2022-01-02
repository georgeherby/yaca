import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yaca/core/models/api/coingecko/simple_asset.dart';
import 'package:yaca/core/repositories/api/coingecko/coin_list_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchBaseEvent, SearchState> {
  final CoinListReposiotry coinListReposiotry;

  SearchBloc({required this.coinListReposiotry})
      : super(const SearchInitial()) {
    on<LoadAssetListEvent>((event, emit) async {
      emit(const SearchLoading());
      await coinListReposiotry
          .getCoinList()
          .then((value) => emit(SearchLoaded(value)))
          .catchError((error) => emit(SearchError(error.toString())));
    });
    on<SearchEvent>((event, emit) async {
      emit(SearchLoaded(event.assetList
          .where((element) =>
              element.name.contains(event.query) ||
              element.symbol.contains(event.query))
          .toList()));
    });
  }
}
