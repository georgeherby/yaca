//Common

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

Color kPositiveGreenDark = const Color(0xFF085839);
Color kNegativeRedDark = const Color(0xFF971A11);

Color kPositiveGreen = const Color(0xFF18C683);
Color pNegativeRed = const Color(0xFFF44336);

Color kPositiveGreenLight = const Color(0xFFD9F8ED);
Color kNegativeRedLight = const Color(0xFFFCE4E1);

Color kGold = const Color(0xFFE4B256);

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
    return this < 0 ? pNegativeRed : kPositiveGreen.withOpacity(opacity);
  }

  Color toPositiveNegativeColorLight({double opacity = 1.0}) {
    return this < 0
        ? kNegativeRedLight
        : kPositiveGreenLight.withOpacity(opacity);
  }

  Color toPositiveNegativeColorDark({double opacity = 1.0}) {
    return this < 0 ? kNegativeRedDark : kPositiveGreenDark.withOpacity(opacity);
  }
}
