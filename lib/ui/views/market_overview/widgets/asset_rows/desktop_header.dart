// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key, required this.blockSize});
  final double blockSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8, bottom: 4),
      child: Row(
        children: [
          SizedBox(width: 32 + blockSize * 2 + blockSize * 16),
          SizedBox(
            width: blockSize * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last 7 days',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: blockSize * 30,
            child: Row(
              children: [
                SizedBox(
                  width: blockSize * 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '7d',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
                SizedBox(
                  width: blockSize * 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '24h',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
                SizedBox(
                  width: blockSize * 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1h',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: blockSize * 1),
              ],
            ),
          ),
          Expanded(
            flex: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(width: 44),
        ],
      ),
    );
  }
}
