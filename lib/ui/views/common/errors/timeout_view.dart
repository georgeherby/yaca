// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:ionicons/ionicons.dart';

class TimeoutView extends StatelessWidget {
  final VoidCallback onRefresh;

  const TimeoutView({super.key, required this.onRefresh});

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
              const Icon(Ionicons.wifi_outline, size: 48),
              const SizedBox(height: 16),
              const Text(
                  "Connection timeout. Ensure you are connected to the internet and try again."),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: onRefresh, child: const Text("Retry")),
            ],
          ),
        ),
      );
    });
  }
}
