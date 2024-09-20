import 'package:flutter/material.dart';
import 'package:live_score/utils/themes/color_scheme_config.dart';
import 'package:live_score/utils/themes/text_theme_config.dart';

class AppBarThemeConfig {
  AppBarThemeConfig._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: ColorSchemeConfig.lightColorScheme.primary,
    foregroundColor: ColorSchemeConfig.lightColorScheme.onPrimary,
    titleTextStyle: TextThemeConfig.lightTextTheme.titleLarge?.copyWith(
      color: ColorSchemeConfig.lightColorScheme.onPrimary,
    ),
    iconTheme: IconThemeData(
      color: ColorSchemeConfig.lightColorScheme.onPrimary,
    ),
  );
}
