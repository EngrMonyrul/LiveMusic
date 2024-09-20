import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_score/utils/enums/font_options.dart';
import 'package:live_score/utils/themes/appbar_theme_config.dart';
import 'package:live_score/utils/themes/card_theme_config.dart';
import 'package:live_score/utils/themes/color_scheme_config.dart';
import 'package:live_score/utils/themes/elevated_button_theme_config.dart';
import 'package:live_score/utils/themes/input_decoration_theme_config.dart';
import 'package:live_score/utils/themes/text_theme_config.dart';

class BaseThemeConfig {
  BaseThemeConfig._();

  static final lightThemeConfig = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextThemeConfig.lightTextTheme,
    colorScheme: ColorSchemeConfig.lightColorScheme,
    scaffoldBackgroundColor: CupertinoColors.systemGrey6,
    fontFamily: FontOptions.poppins.key,
    appBarTheme: AppBarThemeConfig.lightAppBarTheme,
    cardTheme: CardThemeConfig.lightCardTheme,
    elevatedButtonTheme:
        ElevatedButtonThemeConfig.lightElevatedButtonThemeConfig,
    inputDecorationTheme: InputDecorationThemeConfig.inputDecorationThemeConfig,
  );
}
