// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shimmer/shimmer.dart';

class ShimmerAppBarDataBlock extends StatelessWidget {
  const ShimmerAppBarDataBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Shimmer.fromColors(
            loop: 5,
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.white30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.grey,
              ),
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
