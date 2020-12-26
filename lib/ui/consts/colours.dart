//Common
import 'package:flutter/material.dart';

abstract class ThemeColours {
  late Color primary;
  late Color accent;
  late Color scaffoldBackground;
  late Color appBarColour;
}

// Primary 2cb570
//Light 68e89f
// Dark 008444

class LightThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = const Color(0xFFFDFDFD);

  @override
  Color accent = const Color(0xFFb52c71);

  @override
  Color primary = const Color(0xFF2cb570);

  @override
  Color appBarColour = const Color(0xFFFDFDFD);
}

class DarkThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = const Color(0xFF121212);

  @override
  Color accent = const Color(0xFFb52c71);

  @override
  Color primary = const Color(0xFF2cb570);

  @override
  Color appBarColour = const Color(0xFF121212);
}
