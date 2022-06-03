// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:yaca/ui/consts/constants.dart';

class RankingCard extends StatelessWidget {
  final int ranking;
  const RankingCard({super.key, required this.ranking});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(kCornerRadiusCirlcular)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Text(ranking.toString(),
            style: Theme.of(context).textTheme.caption),
      ),
    );
  }
}
