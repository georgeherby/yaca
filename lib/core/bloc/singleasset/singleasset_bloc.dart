// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/models/settings/chosen_currency.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/api/coingecko/asset_history.dart';
import 'package:crypto_app/core/models/api/coingecko/single_asset_data.dart';
import 'package:crypto_app/core/repositories/api/coingecko/single_asset_repository.dart';

part 'singleasset_event.dart';
part 'singleasset_state.dart';

class SingleAssetBloc extends Bloc<SingleAssetEvent, SingleAssetState> {
  final SingleAssetRespository singleAssetRespository;

  SingleAssetBloc({required this.singleAssetRespository})
      : super(SingleAssetInitial());

  @override
  Stream<SingleAssetState> mapEventToState(
    SingleAssetEvent event,
  ) async* {
    if (event is SingleAssetLoad) {
      yield SingleAssetLoading();

      try {
        print('done');
        var assetHistorySplits = await singleAssetRespository
            .fetchFullAssetHistory(event.marketCoinId, event.currencyCode);

        var assetDetails =
            await singleAssetRespository.getSingleAssetData(event.marketCoinId);

        yield SingleAssetLoaded(assetDetails, assetHistorySplits);
      } on Exception catch (e) {
        yield SingleAssetError(e.toString());
      }
    }
  }
}
