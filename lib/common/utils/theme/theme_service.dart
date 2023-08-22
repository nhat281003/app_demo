import 'package:app_3tv/common/constants/string_constant.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/preference_utils.dart';
import 'package:flutter/material.dart';
// ignore_for_file: constant_identifier_names

enum ThemeType { DARK, LIGHT }

class ThemeService {
  static String fontName = 'Poppins';
  static ThemeData themeData() {
    int themeType = PreferenceUtils.getInt(StringConstant.SAVETHEME);
    switch (themeType) {
      case 0:
        return lightTheme();
      default:
        return lightTheme();
    }
  }

  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    TextTheme _basicTextTheme(TextTheme base) {
      return base.copyWith(
        displayLarge: base.displayLarge?.copyWith(
          color: ColorUtils.COLOR_TEXT_BLACK87,
        ),
        displayMedium: base.displayMedium
            ?.copyWith(fontFamily: fontName, color: ColorUtils.COLOR_RED),
        displaySmall: base.displaySmall
            ?.copyWith(fontFamily: fontName, color: ColorUtils.BG_BUTTON_BUY),
        headlineMedium: base.displaySmall
            ?.copyWith(fontFamily: fontName, color: ColorUtils.BG_COLOR),
        headlineSmall: base.displaySmall
            ?.copyWith(fontFamily: fontName, color: ColorUtils.BG_STATUS_CANEL),
      );
    }

    ColorScheme colorScheme(ColorScheme base) {
      return base.copyWith(
        secondary: ColorUtils.COLOR_GREEN_BOLD,
        primary: ColorUtils.text_list,
        onPrimary: ColorUtils.text_list.withOpacity(0.7),
        surface: ColorUtils.BG_BASE2,
        onSurface: ColorUtils.BG_COLOR,
        onBackground:  ColorUtils.COLOR_GREEN_BOLD,
      );
    }

    return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      splashColor: ColorUtils.BG_BUTTON_BUY,
      primaryColor: ColorUtils.COLOR_BG_TOOLBAR,
      backgroundColor: ColorUtils.COLOR_WHITE,
      bottomAppBarColor: ColorUtils.COLOR_WHITE,
      disabledColor: ColorUtils.COLOR_BLACK,
      errorColor: ColorUtils.COLOR_RED,
      indicatorColor: ColorUtils.BG_COLOR,
      focusColor: ColorUtils.BG_COLOR,
      dividerColor: Colors.grey,
      selectedRowColor: ColorUtils.BG_BASE2,
      cardColor: ColorUtils.COLOR_WHITE,
      scaffoldBackgroundColor: ColorUtils.COLOR_WHITE,
      hoverColor: ColorUtils.COLOR_WHITE,
      primaryColorLight: Colors.black54,
      primaryColorDark: ColorUtils.BG_COLOR,
      hintColor: ColorUtils.COLOR_BLACK,
      highlightColor: ColorUtils.text_list,
      colorScheme: colorScheme(base.colorScheme),
      secondaryHeaderColor: ColorUtils.COLOR_WHITE,
    );
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();
    TextTheme _basicTextTheme(TextTheme base) {
      return base.copyWith(
        displayLarge: base.displayLarge
            ?.copyWith(fontFamily: fontName, color: ColorUtils.COLOR_WHITE),
        displayMedium: base.displayMedium
            ?.copyWith(fontFamily: fontName, color: ColorUtils.COLOR_BLACK),
        displaySmall: base.displaySmall
            ?.copyWith(fontFamily: fontName, color: ColorUtils.COLOR_RED),
        headlineMedium: base.headlineMedium
            ?.copyWith(fontFamily: fontName, color: ColorUtils.BG_BUTTON_BUY),
        headlineSmall: base.headlineSmall
            ?.copyWith(fontFamily: fontName, color: ColorUtils.BG_COLOR),
        titleLarge: base.titleLarge
            ?.copyWith(fontFamily: fontName, color: ColorUtils.BG_STATUS_CANEL),
      );
    }

    ColorScheme colorScheme(ColorScheme base) {
      return base.copyWith(
        secondary: ColorUtils.COLOR_GREEN,
        primary: ColorUtils.COLOR_TEXT_GREY,
        onPrimary: ColorUtils.COLOR_TEXT_GREY,
        surface: ColorUtils.BG_BASE_BLACK2,
        onSurface: ColorUtils.BG_BASE_BLACK2,
        onBackground:  ColorUtils.BG_COLOR,
      );
    }

    return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      splashColor: ColorUtils.BG_COLOR,
      primaryColor: ColorUtils.COLOR_TEXT_BLACK87,
      disabledColor: ColorUtils.COLOR_WHITE,
      bottomAppBarColor: ColorUtils.BG_BASE_BLACK2,
      errorColor: ColorUtils.COLOR_RED,
      dividerColor: ColorUtils.COLOR_TEXT_BLACK87,
      hintColor: ColorUtils.COLOR_WHITE,
      indicatorColor: ColorUtils.COLOR_WHITE,
      focusColor: ColorUtils.COLOR_TEXT_BLACK87,
      selectedRowColor: ColorUtils.COLOR_BLACK,
      cardColor: ColorUtils.COLOR_BLACK,
      scaffoldBackgroundColor: ColorUtils.COLOR_TEXT_BLACK87,
      hoverColor: ColorUtils.BG_COLOR,
      primaryColorLight: ColorUtils.line_list,
      primaryColorDark: ColorUtils.COLOR_BLACK,
      highlightColor: ColorUtils.COLOR_WHITE,
      colorScheme: colorScheme(base.colorScheme),
      secondaryHeaderColor: ColorUtils.BG_BASE_BLACK2,
    );
  }
}
