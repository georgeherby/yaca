// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpandableCard extends StatefulWidget {
  final Widget contents;
  final double collapsedHeight;

  const ExpandableCard(
      {Key? key, required this.contents, this.collapsedHeight = 50})
      : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with TickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: Container(
              constraints: expanded
                  ? BoxConstraints(maxHeight: double.infinity)
                  : BoxConstraints(maxHeight: widget.collapsedHeight),
              child: widget.contents),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                expanded = !expanded;
              });
            },
            icon: FaIcon(expanded
                ? FontAwesomeIcons.chevronUp
                : FontAwesomeIcons.chevronDown))
      ],
    );
  }
}
