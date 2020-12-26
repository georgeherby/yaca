import 'package:flutter/material.dart';

class AppBarDataBlock extends StatelessWidget {
  const AppBarDataBlock({
    Key? key,
    required this.label,
    required this.amount,
    this.changePer24Hours,
  }) : super(key: key);

  final String label;
  final String amount;
  final Widget? changePer24Hours;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          amount,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        changePer24Hours ?? Container()
      ],
    );
  }
}
