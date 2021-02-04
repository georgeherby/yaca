import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarStatic extends StatelessWidget with PreferredSizeWidget {
  final Widget body;
  final VoidCallback? refreshTapped;

  const AppBarStatic({Key? key, required this.body, this.refreshTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:
                  LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, stops: [
                0.25,
                0.75,
              ], colors: [
                // Color(0xFF5866DF),
                // Color(0xFFF35491),
                Color(0xFF385AEF),
                Color(0xFF6725CD),
              ]),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      body,
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                refreshTapped != null
                    ? IconButton(
                        icon: Icon(CupertinoIcons.arrow_clockwise), onPressed: refreshTapped)
                    : Container(),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
