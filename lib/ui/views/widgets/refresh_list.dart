// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/extensions/platform.dart';

class RefreshableList extends StatelessWidget {
  final ListView child;
  final ValueGetter<Future<void>> onRefresh;

  const RefreshableList(
      {Key? key, required this.onRefresh, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Theme.of(context).platform.isDesktop() || kIsWeb)
        ? child
        : RefreshIndicator(
            onRefresh: onRefresh,
            backgroundColor: Theme.of(context).accentColor,
            color: Colors.white,
            child: child);
  }
}
