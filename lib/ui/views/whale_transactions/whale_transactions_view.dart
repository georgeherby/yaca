// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:crypto_app/core/models/api/whalealerts/whale_transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/views/whale_transactions/widgets/whale_transaction_list.dart';
import 'package:crypto_app/ui/consts/constants.dart';
import 'package:crypto_app/ui/utils/view_builder/filter_list_bloc.dart';
import 'package:crypto_app/ui/utils/view_builder/view_state.dart';
import 'package:crypto_app/ui/utils/view_builder/view_state_builder.dart';

class WhaleTransactionView extends StatefulWidget {
  const WhaleTransactionView({
    Key? key,
  }) : super(key: key);

  @override
  _WhaleTransactionViewState createState() => _WhaleTransactionViewState();
}

class _WhaleTransactionViewState extends State<WhaleTransactionView> {
  late FilterListBloc<Transactions, String> listBloc;

  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<FilterListBloc<Transactions, String>>(context).state
        is Success) {
      listBloc = BlocProvider.of<FilterListBloc<Transactions, String>>(context);
    } else {
      listBloc = BlocProvider.of<FilterListBloc<Transactions, String>>(context)
        ..loadElements();
    }
  }

  void _refreshPosts() => listBloc.refreshElements(filter: listBloc.filter);

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
        centerTitle: true,
        elevation: Theme.of(context).appBarTheme.elevation,
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.arrow_clockwise),
              onPressed: () => _refreshPosts())
        ],
      ),
      body: ViewStateBuilder<List<Transactions>,
          FilterListBloc<Transactions, String>>(
        bloc: BlocProvider.of<FilterListBloc<Transactions, String>>(context),
        onLoading: (context) =>
            Center(child: const CupertinoActivityIndicator()),
        onSuccess: (context, posts) =>
            WhaleTransactionList(transactions: posts),
        onRefreshing: (context, posts) =>
            Center(child: const CupertinoActivityIndicator()),
        onEmpty: (context) => const Center(child: Text('No posts found')),
        onError: (context, error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
