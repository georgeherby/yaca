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
  final String? query;

  const SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
