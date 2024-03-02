import 'package:codeli/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showSnackBarWidget(
    {required BuildContext context,
    required String message,
    bool isErro = true}) {
  SnackBar snackbar = SnackBar(
    content: Text(message),
    backgroundColor: isErro ? AppColors.darkRed : AppColors.darkGreen,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
