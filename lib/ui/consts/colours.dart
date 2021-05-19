//Common
import 'package:flutter/material.dart';

Color positiveGreenDark = Color(0xFF085839);
Color negativeRedDark = Color(0xFF971A11);

Color positiveGreen = Color(0xFF18C683);
Color negativeRed = Color(0xFFF44336);

Color positiveGreenLight = Color(0xFFD9F8ED);
Color negativeRedLight = Color(0xFFFCE4E1);

abstract class ThemeColours {
  late Color primary;
  late Color accent;
  late Color scaffoldBackground;
  late Color cardBackground;
  late Color appBarColour;
}

// Primary 2cb570
//Light 68e89f
// Dark 008444

class LightThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = const Color(0xFFEEEEEE);

  @override
  Color accent = const Color(0xFFF33335);

  @override
  Color primary = const Color(0xFF5866DF);

  @override
  Color appBarColour = const Color(0xFFEEEEEE);

  @override
  Color cardBackground = Colors.white;
}

class DarkThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = const Color(0xFF1F2022);

  @override
  Color accent = const Color(0xFFF33335);

  @override
  Color primary = const Color(0xFF5866DF);

  @override
  Color appBarColour = const Color(0xFF1F2022);

  @override
  Color cardBackground = const Color(0xFF2C2C2D);
}

extension PositiveNegativeColor on double {
  Color toPositiveNegativeColor({double opacity = 1.0}) {
    return this < 0 ? negativeRed : positiveGreen.withOpacity(opacity);
  }

  Color toPositiveNegativeColorLight({double opacity = 1.0}) {
    return this < 0
        ? negativeRedLight
        : positiveGreenLight.withOpacity(opacity);
  }

  Color toPositiveNegativeColorDark({double opacity = 1.0}) {
    return this < 0 ? negativeRedDark : positiveGreenDark.withOpacity(opacity);
  }
}
