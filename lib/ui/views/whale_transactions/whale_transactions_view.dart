// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

// 🌎 Project imports:
import 'package:yaca/core/exceptions/missing_config_exception.dart';
import 'package:yaca/core/extensions/platform.dart';
import 'package:yaca/core/models/api/whalealerts/whale_transactions.dart';
import 'package:yaca/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:yaca/ui/utils/view_builder/view_state.dart';
import 'package:yaca/ui/utils/view_builder/view_state_builder.dart';
import 'package:yaca/ui/views/common/errors/error_view.dart';
import 'package:yaca/ui/views/common/errors/rate_limit_view.dart';
import 'package:yaca/ui/views/whale_transactions/widgets/whale_transaction_list.dart';
import 'package:yaca/ui/views/widgets/app_bar_title.dart';
import 'package:yaca/ui/views/widgets/general_app_bar.dart';

class WhaleTransactionView extends StatefulWidget {
  const WhaleTransactionView({
    Key? key,
  }) : super(key: key);

  @override
  _WhaleTransactionViewState createState() => _WhaleTransactionViewState();
}

class _WhaleTransactionViewState extends State<WhaleTransactionView> {
  late FilterListBloc<WhaleTransaction, String> listBloc;

  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<FilterListBloc<WhaleTransaction, String>>(context).state
        is Success) {
      listBloc =
          BlocProvider.of<FilterListBloc<WhaleTransaction, String>>(context);
    } else {
      listBloc =
          BlocProvider.of<FilterListBloc<WhaleTransaction, String>>(context)
            ..loadElements();
    }
  }

  Future _refreshPosts() async =>
      listBloc.refreshElements(filter: listBloc.filter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        platform: Theme.of(context).platform,
        title: const AppBarTitle('Whale Transcations'),
        leadingButtonType: Theme.of(context).platform.onlyMobile(context)
            ? LeadingButtonType.settings
            : null,
        actions: [
          (Theme.of(context).platform.isDesktop())
              ? IconButton(
                  icon: Icon(
                    Ionicons.sync_outline,
                    size: Theme.of(context).platform == TargetPlatform.macOS &&
                            !kIsWeb
                        ? 20
                        : Theme.of(context).iconTheme.size,
                  ),
                  onPressed: () => _refreshPosts())
              : Container()
        ],
      ),
      body: ViewStateBuilder<List<WhaleTransaction>,
          FilterListBloc<WhaleTransaction, String>>(
        bloc:
            BlocProvider.of<FilterListBloc<WhaleTransaction, String>>(context),
        onLoading: (context) =>
            Center(child: PlatformCircularProgressIndicator()),
        onSuccess: (context, transactions) => WhaleTransactionList(
            transactions: transactions,
            onRefresh: () async => await _refreshPosts()),
        onRefreshing: (context, posts) =>
            Center(child: PlatformCircularProgressIndicator()),
        onEmpty: (context) => const Center(child: Text('No posts found')),
        onError: (BuildContext context, error) {
          if (error is MissingConfigException) {
            return const Center(
                child: Text('Enter your API token for Whale API'));
          }
          return ErrorView(
              onRefresh: () async => _refreshPosts(), error: error.toString());
        },
        onRateLimited: (BuildContext context, error) {
          return RatelimtedView(onRefresh: () async => await _refreshPosts());
        },
      ),
    );
  }
}
