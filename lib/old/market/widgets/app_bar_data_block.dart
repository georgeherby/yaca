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
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).textTheme.bodyText1?.color),
        ),
        Text(
          amount,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyText1?.color),
        ),
        changePer24Hours ?? Container()
      ],
    );
  }
}
