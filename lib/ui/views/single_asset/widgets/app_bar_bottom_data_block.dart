// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AppBarBottomDataBlock extends StatelessWidget {
  final String title;
  final Widget? widgetData;

  const AppBarBottomDataBlock(
      {Key? key, required this.title, required this.widgetData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: Theme.of(context).textTheme.caption?.color?.withOpacity(
                  Theme.of(context).brightness == Brightness.dark
                      ? 0.60
                      : 0.75),
              fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 4),
        widgetData ??
            Text(
              '-',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w900),
            ),
      ],
    );
  }
}
