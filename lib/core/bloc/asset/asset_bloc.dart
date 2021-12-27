// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/api/coingecko/asset_history.dart';
import 'package:yaca/core/models/api/coingecko/single_asset_data.dart';
import 'package:yaca/core/models/settings/chosen_currency.dart';
import 'package:yaca/core/repositories/api/coingecko/single_asset_repository.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  final AssetRespository singleAssetRespository;

  AssetBloc({required this.singleAssetRespository}) : super(AssetInitial()) {
    on<AssetLoad>(_onAssetLoad);
  }

  void _onAssetLoad(AssetLoad event, Emitter<AssetState> emit) async {
    emit(const AssetLoading());

    try {
      var assetHistorySplits = await singleAssetRespository
          .fetchFullAssetHistory(event.marketCoinId, event.currencyCode);

      var assetDetails =
          await singleAssetRespository.getSingleAssetData(event.marketCoinId);

      emit(AssetLoaded(assetDetails, assetHistorySplits));
    } on Exception catch (e) {
      emit(AssetError(e.toString()));
    }
  }
}
