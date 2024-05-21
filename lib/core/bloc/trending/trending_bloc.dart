// 📦 Package imports:
import 'package:coingecko_api/data/search_trending.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/repositories/api/coingecko/trending_asset_repository.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc(this._trendingAssetRepository) : super(TrendingInitial()) {
    on<LoadTrending>((event, emit) async {
      emit(TrendingLoading());

      try {
        final List<SearchTrendingCoin> assets =
            await _trendingAssetRepository.getTrendingAssets();
        emit(TrendingLoaded(trending: assets));
      } catch (e) {
        emit(TrendingError(e.toString()));
      }
    });
  }
  final TrendingAssetRepository _trendingAssetRepository;
}
