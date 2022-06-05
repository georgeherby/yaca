// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:ionicons/ionicons.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.onRefresh, required this.error});
  final VoidCallback? onRefresh;
  final String error;

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
              const Icon(Ionicons.bug_outline, size: 48),
              const SizedBox(height: 16),
              const Text(
                  'Error occured. Please try again. If you still face issues, please contact the developer with details in the section below.'),
              const SizedBox(height: 16),
              Theme(
                data: ThemeData(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  iconColor: Theme.of(context).iconTheme.color,
                  collapsedIconColor: Theme.of(context).iconTheme.color,
                  title: Text(
                    'Error details',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  children: [
                    Text(error),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (onRefresh != null)
                ElevatedButton(onPressed: onRefresh, child: const Text('Retry'))
              else
                Container(),
            ],
          ),
        ),
      );
    });
  }
}
