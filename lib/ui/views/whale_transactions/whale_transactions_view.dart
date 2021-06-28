// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:crypto_app/core/exceptions/missing_config_exception.dart';
import 'package:crypto_app/core/extensions/platform.dart';
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/pages/app_settings/app_settings_page.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:crypto_app/ui/utils/view_builder/view_state.dart';
import 'package:crypto_app/ui/utils/view_builder/view_state_builder.dart';
import 'package:crypto_app/ui/views/whale_transactions/widgets/whale_transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: AppBar(
        toolbarHeight: Theme.of(context).platform == TargetPlatform.macOS
            ? kTitleBarMacOSHeight
            : kToolbarHeight,
        title: Text(
          'Whale Transactions',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        leading: (Theme.of(context).platform.isDesktop())
            ? Container()
            : IconButton(
                tooltip: 'Open settings',
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => AppSettingsPage(),
                  ),
                ),
                icon: FaIcon(FontAwesomeIcons.cog),
              ),
        centerTitle: true,
        elevation: Theme.of(context).appBarTheme.elevation,
        actions: [
          (Theme.of(context).platform.isDesktop())
              ? IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.syncAlt,
                    size: Theme.of(context).platform == TargetPlatform.macOS
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
            Center(child: const CupertinoActivityIndicator()),
        onSuccess: (context, transactions) => WhaleTransactionList(
            transactions: transactions, onRefresh: () => _refreshPosts()),
        onRefreshing: (context, posts) =>
            Center(child: const CupertinoActivityIndicator()),
        onEmpty: (context) => const Center(child: Text('No posts found')),
        onError: (context, error) {
          if (error is MissingConfigException) {
            return Center(child: Text('Enter your API token for Whale API'));
          }

          return Center(child: Text(error.toString()));
        },
      ),
    );
  }
}
