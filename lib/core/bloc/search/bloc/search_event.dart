part of 'search_bloc.dart';

abstract class SearchBaseEvent extends Equatable {
  const SearchBaseEvent();

  @override
  List<Object> get props => [];
}

class LoadAssetListEvent extends SearchBaseEvent {
  const LoadAssetListEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends SearchBaseEvent {
  final String query;
  final List<SimpleAsset> assetList;

  const SearchEvent({required this.query, required this.assetList});

  @override
  List<Object> get props => [query, assetList];
}
