// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class TabletHeader extends StatelessWidget {
  const TabletHeader({super.key, required this.blockSize});
  final double blockSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8, bottom: 4),
      child: Row(
        children: [
          SizedBox(width: 32 + blockSize * 2 + blockSize * 15),
          SizedBox(
            width: blockSize * 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: blockSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '7d',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
                SizedBox(
                  width: blockSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '24h',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
                SizedBox(
                  width: blockSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1h',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 25,
            child: Text(
              'Price',
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(width: 32),
          ),
        ],
      ),
    );
  }
}
