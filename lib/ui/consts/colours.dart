//Common

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

Color kPositiveGreenDark = const Color(0xFF085839);
Color kNegativeRedDark = const Color(0xFF971A11);

Color kPositiveGreen = const Color(0xFF18C683);
Color kYellow = const Color(0xFFB9BB2C);
Color kNegativeRed = const Color(0xFFF44336);

Color kPositiveGreenLight = const Color(0xFFD9F8ED);
Color kNegativeRedLight = const Color(0xFFFCE4E1);

Color kGold = const Color(0xFFE4B256);

abstract class ThemeColours {
  late Color primary;
  late Color accent;
  late Color scaffoldBackground;
  late Color cardBackground;
  late Color appBarColour;
  late Color chipUnselectedColor;
  late Color chipSelectedColor;
}

class LightThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = const Color(0xFFEEEEEE);

  @override
  Color accent = const Color(0xFF9152F9);

  @override
  Color primary = const Color(0xFF0F9C7B);

  @override
  Color appBarColour = const Color(0xFFEEEEEE);

  @override
  Color cardBackground = const Color(0xFFFEFEFF);

  @override
  Color chipSelectedColor = const Color(0xFF0F9C7B);

  @override
  Color chipUnselectedColor = const Color(0xFFFEFEFF);
}

class DarkThemeColors implements ThemeColours {
  @override
  // Color scaffoldBackground = const Color(0xFF1F2022);
  Color scaffoldBackground = const Color(0xFF12111A);

  @override
  Color accent = const Color(0xFF9152F9);

  @override
  Color primary = const Color(0xFF0F9C7B);

  @override
  Color appBarColour = const Color(0xFF12111A);

  @override
  Color cardBackground = const Color(0xFF1D1A27);

  @override
  Color chipSelectedColor = const Color(0xFF0F9C7B);

  @override
  Color chipUnselectedColor = const Color(0xFF1D1A27);
}

extension PositiveNegativeColor on double {
  Color toPositiveNegativeColor({double opacity = 1.0}) {
    return this < 0 ? kNegativeRed : kPositiveGreen.withOpacity(opacity);
  }

  Color toPositiveNegativeColorLight({double opacity = 1.0}) {
    return this < 0
        ? kNegativeRedLight
        : kPositiveGreenLight.withOpacity(opacity);
  }

  Color toPositiveNegativeColorDark({double opacity = 1.0}) {
    return this < 0
        ? kNegativeRedDark
        : kPositiveGreenDark.withOpacity(opacity);
  }
}
