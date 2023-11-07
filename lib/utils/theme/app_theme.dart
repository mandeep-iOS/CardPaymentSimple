import 'package:flutter/material.dart';
import 'package:paymenttest/export.dart';

enum ThemeType { light, dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  late bool isDark;
  late Color background;
  late Color surface;
  late Color bg2;
  late Color primary;
  late Color primaryVariant;
  late Color secondary;
  late Color secondaryVariant;
  late Color accent;
  late Color grey;
  late Color greyStrong;
  late Color greyWeak;
  late Color textFieldBorder;
  late Color error;
  late Color focus;
  late Color greenButton;

  late Color redButton;
  late Color txt;
  late Color milkText;

  late Color accentTxt;
  late Color glassWhite;
  late Color greyTextFieldFill;
  late Color black;
  late Color transparentBlack;

  late Color blue;
  late Color dividerColor;
  late Color cardColor;
  AppTheme(this.isDark) {
    txt = isDark ? Colors.white : const Color(0xff323B56);
    accentTxt = Colors.white;
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(false)
          ..background = const Color(0xFFFFFFFF)
          ..bg2 = const Color(0xffF6F7FA)
          ..surface = Colors.white
          ..cardColor = const Color(0xffF1F5F6)
          ..dividerColor = const Color(0xffE3E3E3)
          ..milkText = const Color(0xffC6CEDA)
          ..primary = const Color(0xff0065FF)
          ..primaryVariant = const Color(0xff045D56)
          ..secondary = const Color(0xffFFD339)
          ..secondaryVariant = const Color(0xffFFCF44)
          ..accent = const Color(0xffB15DFF)
          ..greyWeak = const Color(0xffA8A8A8)
          ..textFieldBorder = const Color(0xffA2C0EC)
          ..grey = const Color(0xff515d5a)
          ..black = Colors.black
          ..transparentBlack = const Color(0xff23262B)
          ..greyStrong = const Color(0xff151918)
          ..error = Colors.redAccent
          ..redButton = const Color(0xffF97A60)
          ..blue = Colors.blue
          ..greenButton = const Color(0xff2D9739)
          ..glassWhite = const Color(0x5affffff)
          ..greyTextFieldFill = const Color(0xfff6f7fa)
          ..focus = const Color(0xFF0ee2b1);

      default:
        return AppTheme.fromType(defaultTheme);
    }
  }

  ThemeData get themeData {
    ThemeData t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: primaryVariant,
        secondary: secondary,
        secondaryContainer:
            ColorHelper.getMaterialColorFromColor(secondaryVariant),
        background: background,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: greyWeak,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      highlightColor: primary,
      toggleableActiveColor: primary,
    );
  }
}
