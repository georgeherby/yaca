import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackChevronButton extends StatelessWidget {
  final VoidCallback onTapped;

  const BackChevronButton({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      child: Icon(
        CupertinoIcons.left_chevron,
        size: 16,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
