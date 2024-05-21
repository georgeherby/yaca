part of 'search_bloc.dart';

abstract class SearchBaseEvent extends Equatable {
  const SearchBaseEvent();

  @override
  List<Object?> get props => [];
}

class GetAssetListEvent extends SearchBaseEvent {
  const GetAssetListEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends SearchBaseEvent {
  const SearchEvent({required this.query});
  final String? query;

  @override
  List<Object?> get props => [query];
}
