part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {

  const TrendingLoaded({required this.trending});
  final List<SearchTrendingCoin> trending;

  @override
  List<Object> get props => [trending];
}

class TrendingError extends TrendingState {

  const TrendingError( this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
