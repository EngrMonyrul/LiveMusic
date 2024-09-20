import 'package:flutter/material.dart';
import 'package:live_score/utils/themes/text_theme_config.dart';

import 'color_scheme_config.dart';

class InputDecorationThemeConfig {
  InputDecorationThemeConfig._();

  static final inputDecorationThemeConfig = InputDecorationTheme(
    isDense: true,
    hintStyle: TextThemeConfig.lightTextTheme.bodyMedium?.copyWith(
      color: ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.6),
    ),
    errorStyle: TextThemeConfig.lightTextTheme.labelMedium?.copyWith(
      color: ColorSchemeConfig.lightColorScheme.error,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
        color: ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.6),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
        color: ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.6),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
          color: ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.6)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: ColorSchemeConfig.lightColorScheme.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: ColorSchemeConfig.lightColorScheme.error),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    labelStyle: TextThemeConfig.lightTextTheme.bodyMedium?.copyWith(
      color: ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.5),
    ),
    prefixIconColor: WidgetStateColor.resolveWith(
      (states) {
        return states.contains(WidgetState.focused)
            ? ColorSchemeConfig.lightColorScheme.primary
            : ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.5);
      },
    ),
    suffixIconColor: WidgetStateColor.resolveWith(
      (states) {
        return states.contains(WidgetState.focused)
            ? ColorSchemeConfig.lightColorScheme.primary
            : ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.5);
      },
    ),
  );
}
