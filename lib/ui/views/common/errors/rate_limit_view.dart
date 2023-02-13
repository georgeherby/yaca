// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

class RateLimitedView extends StatelessWidget {
  const RateLimitedView({super.key, required this.onRefresh});
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraint.maxHeight),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_rounded, size: 48),
              const SizedBox(height: 16),
              const Text(
                  'You are being rate limited. Please try again in a few minutes.'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: onRefresh, child: const Text('Retry')),
            ],
          ),
        ),
      );
    });
  }
}
