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

Color kPrimary = const Color(0xFF0F9C7B);
Color kDarkPrimary = const Color(0xFF0F9C7B);
Color kSecondary = const Color(0xFF9152F9);
Color kDarkSecondary = const Color(0xFF9152F9);

Color kDarkSurface = const Color(0xFF1A1A27);
Color kDarkBackground = const Color(0xFF12111A);
Color kDarkError = const Color(0xFFC75469);

Color kLightSurface = const Color(0xFFFEFEFF);
Color kLightBackground = const Color(0xFFEEEEEE);
Color kLightError = const Color(0xFFBA1A1A);

abstract class ThemeColours {
  late Color primary;
  late Color secondary;
  late Color scaffoldBackground;
  late Color cardBackground;
  late Color appBarColour;
  late Color chipUnselectedColor;
  late Color chipSelectedColor;
  late Color unSelectedColor;
  late Color errorColor;
  late Color iconColor;
  late Color enabledBorderColor;
  late Color textColor;
  late Color textInputBackground;
}

class LightThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = kLightBackground;

  @override
  Color textInputBackground = kLightBackground;

  @override
  Color secondary = kSecondary;

  @override
  Color primary = kPrimary;

  @override
  Color appBarColour = kLightBackground;

  @override
  Color cardBackground = kLightSurface;

  @override
  Color chipSelectedColor = kPrimary;

  @override
  Color chipUnselectedColor = kLightSurface;

  @override
  Color unSelectedColor = Colors.black54;

  @override
  Color errorColor = kLightError;

  @override
  Color iconColor = Colors.black.withOpacity(0.70);

  @override
  Color enabledBorderColor = Colors.black87;

  @override
  Color textColor = Colors.black;
}

class DarkThemeColors implements ThemeColours {
  @override
  Color scaffoldBackground = kDarkBackground;
  
  @override
  Color textInputBackground = kDarkBackground;

  @override
  Color secondary = kDarkSecondary;

  @override
  Color primary = kDarkPrimary;

  @override
  Color appBarColour = kDarkBackground;

  @override
  Color cardBackground = kDarkSurface;

  @override
  Color chipSelectedColor = Colors.white.withOpacity(0.87);

  @override
  Color chipUnselectedColor = kDarkSurface;

  @override
  Color unSelectedColor = Colors.white24;

  @override
  Color errorColor = kDarkError;

  @override
  Color iconColor = Colors.white.withOpacity(0.87);

  @override
  Color enabledBorderColor = Colors.white.withOpacity(0.87);

  @override
  Color textColor = Colors.white.withOpacity(0.87);
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
