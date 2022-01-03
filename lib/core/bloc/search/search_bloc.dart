import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yaca/core/models/api/coingecko/simple_asset.dart';
import 'package:yaca/core/repositories/api/coingecko/coin_list_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchBaseEvent, SearchState> {
  late final List<SimpleAsset> _listOfAllAssetForSearch;
  final CoinListReposiotry coinListReposiotry;

  SearchBloc({required this.coinListReposiotry})
      : super(const SearchInitial()) {
    on<GetAssetListEvent>((event, emit) async {
      emit(const SearchLoading());
      await coinListReposiotry.getCoinList().then((value) {
        _listOfAllAssetForSearch = value;
        return emit(SearchLoaded(value));
      }).catchError((error) => emit(SearchError(error.toString())));
    });
    on<SearchEvent>((event, emit) async {
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
    });
  }
}
