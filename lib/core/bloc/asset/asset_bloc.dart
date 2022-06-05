// 📦 Package imports:
import 'package:coingecko_api/data/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/asset_history_splits.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/repositories/api/coingecko/single_asset_repository.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  AssetBloc({required this.singleAssetRespository}) : super(AssetInitial()) {
    on<AssetLoad>(_onAssetLoad);
  }
  final AssetRespository singleAssetRespository;

  Future<void> _onAssetLoad(AssetLoad event, Emitter<AssetState> emit) async {
    emit(const AssetLoading());

    try {
      final assetHistorySplits = await singleAssetRespository
          .fetchFullAssetHistory(event.marketCoinId, event.currencyCode);

      final assetDetails =
          await singleAssetRespository.getSingleAssetData(event.marketCoinId);

      emit(AssetLoaded(assetDetails, assetHistorySplits));
    } on Exception catch (e) {
      emit(AssetError(e.toString()));
    }
  }
}
