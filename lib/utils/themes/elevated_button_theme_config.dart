import 'package:flutter/material.dart';
import 'package:live_score/utils/themes/color_scheme_config.dart';
import 'package:live_score/utils/themes/text_theme_config.dart';

class ElevatedButtonThemeConfig {
  ElevatedButtonThemeConfig._();

  static final lightElevatedButtonThemeConfig = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(1),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          return states.contains(WidgetState.disabled)
              ? ColorSchemeConfig.lightColorScheme.outline.withOpacity(0.5)
              : ColorSchemeConfig.lightColorScheme.primary;
        },
      ),
      foregroundColor: WidgetStatePropertyAll(
        ColorSchemeConfig.lightColorScheme.onPrimary,
      ),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      textStyle: WidgetStatePropertyAll(
        TextThemeConfig.lightTextTheme.titleMedium
            ?.copyWith(color: ColorSchemeConfig.lightColorScheme.onTertiary),
      ),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          return states.contains(WidgetState.pressed)
              ? ColorSchemeConfig.lightColorScheme.tertiary.withOpacity(0.2)
              : null;
        },
      ),
    ),
  );
}
