// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/tranding_asset.dart';
import 'package:yaca/core/repositories/api/coingecko/trending_asset_repository.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingAssetRepository _trendingAssetRepository;

  TrendingBloc(this._trendingAssetRepository) : super(TrendingInitial()) {
    on<LoadTrending>((event, emit) async {
      emit(TrendingLoading());

      try {
        List<TrendingAsset> assets =
            await _trendingAssetRepository.getTrendingAssets();
        emit(TrendingLoaded(trending: assets));
      } catch (e) {
        emit(TrendingError(e.toString()));
      }
    });
  }
}
