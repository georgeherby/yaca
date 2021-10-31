// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/core/models/api/coingecko/single_asset_data.dart';
import 'package:crypto_app/core/models/settings/chosen_currency.dart';
import 'package:crypto_app/core/repositories/api/coingecko/single_asset_repository.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  final AssetRespository singleAssetRespository;

  AssetBloc({required this.singleAssetRespository})
      : super(AssetInitial());

  @override
  Stream<AssetState> mapEventToState(
    AssetEvent event,
  ) async* {
    if (event is AssetLoad) {
      yield AssetLoading();

      try {
        print('done');
        var assetHistorySplits = await singleAssetRespository
            .fetchFullAssetHistory(event.marketCoinId, event.currencyCode);

        var assetDetails =
            await singleAssetRespository.getSingleAssetData(event.marketCoinId);

        yield AssetLoaded(assetDetails, assetHistorySplits);
      } on Exception catch (e) {
        yield AssetError(e.toString());
      }
    }
  }
}
