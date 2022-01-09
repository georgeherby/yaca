part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<TrendingAsset> trending;

  const TrendingLoaded({required this.trending});

  @override
  List<Object> get props => [trending];
}

class TrendingError extends TrendingState {
  final String error;

  const TrendingError( this.error);

  @override
  List<Object> get props => [error];
}
