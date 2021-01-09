//Common
import 'package:flutter/material.dart';

Color positiveGreen = Color(0xFF18C683);
Color negativeRed = Colors.red;

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
  Color accent = const Color(0xFFF33335);

  @override
  Color primary = const Color(0xFF5866DF);

  @override
  Color appBarColour = const Color(0xFFFDFDFD);
}

class DarkThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = const Color(0xFF121212);

  @override
  Color accent = const Color(0xFFF33335);

  @override
  Color primary = const Color(0xFF5866DF);

  @override
  Color appBarColour = const Color(0xFF121212);
}

extension PositiveNegativeColor on double {
  Color toPositiveNegativeColor({double opacity = 1.0}) {
    return this < 0 ? Colors.red : positiveGreen.withOpacity(opacity);
  }
}
