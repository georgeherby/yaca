//Common

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

Color kPositiveGreenDark = const Color(0xFF4B7C57);
Color kNegativeRedDark = const Color(0xFFCE6771);

Color kYellow = const Color(0xFFFEBA67);

Color kPositiveGreenLight = const Color(0xFF65A776);
Color kNegativeRedLight = const Color(0xFFCE6771);

Color kPrimary = const Color(0xFF638175);
Color kDarkPrimary = const Color(0xFF638175);
Color kSecondary = const Color(0xFFF5828D);
Color kDarkSecondary = const Color(0xFFF5828D);

Color kDarkSurface = const Color(0xFF1E1F1F);
Color kDarkBackground = const Color(0xFF1C1B1F);
Color kDarkError = const Color(0xFFCE6771);

Color kLightSurface = const Color(0xFFFFFBFE);
Color kLightBackground = const Color(0xFFFFFBFE);
Color kLightError = const Color(0xFFCE6771);

Map<int, Color> colorCodes = {
  50: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .1),
  100: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .2),
  200: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .3),
  300: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .4),
  400: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .5),
  500: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .6),
  600: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .7),
  700: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .8),
  800: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, .9),
  900: Color.fromRGBO(kPrimary.red, kPrimary.green, kPrimary.blue, 1),
};
MaterialColor kPrimarySwatch = MaterialColor(kPrimary.value, colorCodes);

abstract class ThemeColours {
  late Color primary;
  late MaterialColor primarySwatch;
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
  MaterialColor primarySwatch = kPrimarySwatch;

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
  Color cardBackground = Colors.orange;

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
  Color textColor = Colors.black87;
}

class DarkThemeColors implements ThemeColours {
  @override
  MaterialColor primarySwatch = kPrimarySwatch;

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
  Color cardBackground = Colors.green;

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
  Color toPositiveNegativeColor(BuildContext context, {double opacity = 1.0}) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return this > 0
          ? kPositiveGreenDark.withOpacity(opacity)
          : kNegativeRedDark.withOpacity(opacity);
    } else {
      return this > 0
          ? kPositiveGreenLight.withOpacity(opacity)
          : kNegativeRedLight.withOpacity(opacity);
    }
  }
}

extension PositiveNegativeColorForBool on bool {
  Color toPositiveNegativeColorFromBool(BuildContext context,
      {double opacity = 1.0}) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return this
          ? kPositiveGreenDark.withOpacity(opacity)
          : kNegativeRedDark.withOpacity(opacity);
    } else {
      return this
          ? kPositiveGreenLight.withOpacity(opacity)
          : kNegativeRedLight.withOpacity(opacity);
    }
  }
}
