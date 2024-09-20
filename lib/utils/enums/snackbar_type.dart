import 'package:flutter/material.dart';

enum SnackBarType {
  alert,
  error,
  success;

  static List<SnackBarType> get list => values;

  bool get isAlert => this == alert;

  bool get isError => this == error;

  bool get isSuccess => this == success;

  IconData get icon => switch (this) {
        alert => Icons.warning_rounded,
        error => Icons.error,
        success => Icons.done_outline_rounded,
      };

  Color get color => switch (this) {
        alert => Colors.yellow,
        error => Colors.red,
        success => Colors.green,
        _ => Colors.white,
      };
}
