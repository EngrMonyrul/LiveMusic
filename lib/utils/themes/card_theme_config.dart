import 'package:flutter/material.dart';
import 'package:live_score/utils/themes/color_scheme_config.dart';

class CardThemeConfig {
  CardThemeConfig._();

  static final lightCardTheme = CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9),
    ),
    margin: EdgeInsets.zero,
    color: ColorSchemeConfig.lightColorScheme.surface,
  );
}
