part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  const SearchLoading();
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<CoinShort> filteredList;

  const SearchLoaded(this.filteredList);
  @override
  List<Object> get props => [filteredList];
}

class SearchError extends SearchState {
  final String error;

  const SearchError(this.error);
  @override
  List<Object> get props => [error];
}
