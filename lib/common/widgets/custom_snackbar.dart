import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_score/utils/enums/snackbar_type.dart';
import 'package:live_score/utils/extensions/context_ext.dart';

class CustomSnackBar {
  CustomSnackBar(this.context);

  final BuildContext context;

  showSnackBar({String? message, SnackBarType? snackbarType}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    return ScaffoldMessenger.of(context).showSnackBar(_snackBarConfig(
      message: message,
      snackbarType: snackbarType,
    ));
  }

  SnackBar _snackBarConfig({String? message, SnackBarType? snackbarType}) {
    final theme = context.theme;

    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20,
      ),
      padding: EdgeInsets.zero,
      // showCloseIcon: true,
      duration: const Duration(seconds: 2),
      content: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: snackbarType?.color ?? Colors.white,
        ),
        child: Row(
          children: [
            /*<<----------->> icon <<----------->>*/
            Icon(
              snackbarType?.icon ?? Icons.report_gmailerrorred_sharp,
              color: theme.colorScheme.onPrimary,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*<<----------->> title <<----------->>*/
                  Text(
                    snackbarType?.name.toUpperCase() ?? "",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /*<<----------->> subtitle <<----------->>*/
                  Text(
                    message ?? "",
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
