// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';

class RankingCard extends StatelessWidget {
  const RankingCard({super.key, required this.ranking});
  final int ranking;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius:
            const BorderRadius.all(Radius.circular(kCornerRadiusCirlcular / 2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Text(ranking.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
      ),
    );
  }
}
