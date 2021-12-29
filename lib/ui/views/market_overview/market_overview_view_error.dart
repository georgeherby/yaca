import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yaca/core/bloc/appsettings/appsettings_bloc.dart';
import 'package:yaca/core/bloc/asset_overview/asset_overview_bloc.dart';
import 'package:yaca/core/bloc/globalmarket/globalmarket_bloc.dart';
import 'package:yaca/ui/views/widgets/refresh_list.dart';

class MarketOverviewViewError extends StatelessWidget {
  final String error;
  const MarketOverviewViewError(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraint.maxHeight),
        child: RefreshableList(
          onRefresh: () async {
            BlocProvider.of<GlobalMarketBloc>(context).add(GlobalMarketLoad(
                BlocProvider.of<AppSettingsBloc>(context).state.currency));
            BlocProvider.of<AssetOverviewBloc>(context).add(AssetOverviewLoad(
                BlocProvider.of<AppSettingsBloc>(context).state.currency));
            return;
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Ionicons.alert_circle_outline),
                    Text(error)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
