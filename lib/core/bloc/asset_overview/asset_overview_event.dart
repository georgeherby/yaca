part of 'asset_overview_bloc.dart';

abstract class AssetOverviewEvent extends Equatable {
  const AssetOverviewEvent();

  @override
  List<Object> get props => [];
}

class AssetOverviewLoad extends AssetOverviewEvent {
  const AssetOverviewLoad();

  @override
  List<Object> get props => [];
}
